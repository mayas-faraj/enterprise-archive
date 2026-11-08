var ReportGenerator=
{
	USERS: Object.keys(SetManager.getUsers()),
	TEXT_MAX_LENGTH: 100,
	RECEIVED_TIME_DIFFERENCE:3500,
	INDEX_TIME_DIFFERENCE:13500000,
	INITIAL_TIME_STAMP:1569231152630,
	MAX_LONG:9223373036854,
	MIN_LONGITUDE:36.5,
	MIN_LATITUDE:32.6,
	MAX_LONGITUDE:41,
	MAX_LATITUDE:36.5,

	operates: function(args)
	{
		switch(args.op)
		{
			case "loadReportsByArgs":
			case "loadReportsRealtime":
			case "loadReportsNotification":
			case "loadReportsCommand":
				return ReportGenerator.loadReports(args);
			case "loadCommands":
				return ReportGenerator.loadCommands(args);
			case "findCommand":
				return ReportGenerator.loadCommands(args);
			case "countReportsByUnseen":
				return ReportGenerator.countReportsByUnseen();

			default:
				return "unsupported function";
		}
	},

	loadReports: function(args)
	{
		console.log(args);
		if(args!=null && args.users!=null)
			args.user=args.users;

		var reportsString="";
		var textArray=ReportGenerator.dataBulk.split(",");
		var startIndex, endIndex;

		if(args.startKey!="0" && args.startKey!="" && args.startKey!=null)
			startIndex=parseInt(args.startKey)+1;
		else 
			startIndex=0;

		if(args.offset!=null && args.offset!="")
		{
			if(startIndex+args.offset<=textArray.length)
				endIndex=startIndex+args.offset;
			else
				endIndex=textArray.length;
			
		}
		else
			endIndex=textArray.length;


		for(var i=startIndex; i<endIndex; i++)
		if(textArray[i]!="")
		{
			var report=ReportGenerator.generateReport(i, textArray[i]);
			console.log(args.users, args.searchKeywords, args.timestamp1, args.timestamp2, args.hasCommand, args.minImportance, args.maxImportance, "xxx");

			if((args.user==null || args.user=="" || args.user.indexOf(report.publisher)>=0) &&
			(args.keywords==null || args.keywords=="" || args.keywords.split(" ").some(r=> report.keywords.split(" ").includes(r))) &&
			(args.startTimestamp==null || args.startTimestamp=="0" || report.timestamp>=args.startTimestamp) &&
			(args.endTimestamp==null || args.endTimestamp=="0" || report.timestamp<args.endTimestamp) &&
			(args.isImportantFilter==null || args.isImportantFilter=="0") &&
			(args.hasCommand=="0" || args.hasCommand==null || (report.commandId!="-1" && report.commandId!=null)) &&
			(args.commandId==null || args.commandId=="" || report.commandId==args.commandId) &&
			((args.minImportance=="0" && args.maxImportance=="0") || (args.minImportance==null && args.maxImportance==null) || (report.importance>=args.minImportance && report.importance<args.maxImportance)))

				reportsString+=JSON.stringify(report)+"<br />";
		}

		return reportsString; 
	},

	countReportsByUnseen: function(args)
	{
		var count=0;
		var textArray=ReportGenerator.dataBulk.split(",");
		for(var i=0; i<textArray.length; i++)
		if(textArray[i]!="")
		{
			var report=ReportGenerator.generateReport(i, textArray[i]);
			if(report.actions==null || report.actions.currentSeen!=null)
				count++;
		}

		return count.toString(); 
	},


	generateReport: function(index, text)
	{
		var textLength=text.split(" ").length;
		if(textLength>=ReportGenerator.TEXT_MAX_LENGTH)
			textLength=ReportGenerator.TEXT_MAX_LENGTH;

		var report={};
		report.text=report.keywords=text;
		report.realtime=true;
		report.cellTimestamp=report.timestamp=ReportGenerator.INITIAL_TIME_STAMP - (index * ReportGenerator.INDEX_TIME_DIFFERENCE);
		report.receivedTimestamp=report.cellTimestamp+3500;
		report.importance=textLength/ReportGenerator.TEXT_MAX_LENGTH;
		report.ip="";
		report.commandId=index%6==0?"5":"-1";
		report.provider=index%5!=0?"XMPP":(index%2==0?"MTN":"Syriatel");
		report.gps=ReportGenerator.getGps(textLength);
		report.cellInfo=ReportGenerator.getCellInfo(textLength);
		report.es=localStorage.getItem("node");
		report.publisher=ReportGenerator.getPublisher(index);
		report.id=(ReportGenerator.MAX_LONG-report.cellTimestamp).toString();
		report.rowKey=index.toString();
		report.reportAction=ReportGenerator.getAction(index);
		return report;
	},

	getGps: function(textLength)
	{
		if(textLength>=ReportGenerator.TEXT_MAX_LENGTH/4)
		{
			textLength=textLength*2;
			if(textLength>ReportGenerator.TEXT_MAX_LENGTH)
				textLength=ReportGenerator.TEXT_MAX_LENGTH;

			return	{accuracy: textLength/4,
				latitude: ReportGenerator.MIN_LATITUDE + ((textLength/ReportGenerator.TEXT_MAX_LENGTH)*(ReportGenerator.MAX_LATITUDE-ReportGenerator.MIN_LATITUDE)),
				longitude: ReportGenerator.MIN_LONGITUDE + (((textLength%5)/10)*(ReportGenerator.MAX_LONGITUDE-ReportGenerator.MIN_LONGITUDE))
			};
		}
		else
			return null;
	},

	getCellInfo: function(textLength)
	{
		if(textLength>=ReportGenerator.TEXT_MAX_LENGTH/10)
		{
			textLength=textLength*3;
			if(textLength>ReportGenerator.TEXT_MAX_LENGTH)
				textLength=ReportGenerator.TEXT_MAX_LENGTH;

			return	{accuracy: 0,
				azimuth: textLength*1.7,
				height: textLength*2.5,
				cgi: "4170112356345"+textLength,
//				siteName: "عنوان برج التغطية",
				latitude: ReportGenerator.MIN_LATITUDE + ((textLength/ReportGenerator.TEXT_MAX_LENGTH)*(ReportGenerator.MAX_LATITUDE-ReportGenerator.MIN_LATITUDE)),
				longitude: ReportGenerator.MIN_LONGITUDE + ((textLength%5/10)*(ReportGenerator.MAX_LONGITUDE-ReportGenerator.MIN_LONGITUDE))
			};
		}
		else
			return null;
	},

	getPublisher: function(index)
	{
		var jid=ReportGenerator.USERS[index % ReportGenerator.USERS.length];
		return jid.substring(0, jid.indexOf("@"));
	},

	getAction: function(index)
	{
		return null;
	},

	loadCommands: function(args)
	{
		var commandsString="";
		var textArray=ReportGenerator.commandBulk.split(",");
		var startIndex, endIndex;

		if(args.op=="findCommand")
			args.offset=1;

		if(args.rowKey!="0" && args.rowKey!="" && args.rowKey!=null)
			startIndex=parseInt(args.rowKey)+1;
		else 
			startIndex=0;

		if(args.offset!=null && args.offset!="")
			if(startIndex+args.offset<=textArray.length)
				endIndex=startIndex+args.offset;
			else
				endIndex=textArray.length;
		else
			endIndex=textArray.length;
		for(var i=startIndex; i<endIndex; i++)
		{
			var command=ReportGenerator.generateCommand(i, textArray[i]);
			if((args.keywords==null || args.keywords=="" || args.keywords.split(" ").some(r=> command.text.split(" ").includes(r))) &&
			(args.startTimestamp==null || args.startTimestamp=="0" || args.startTimestamp<=command.timestamp) &&
			(args.endTimestamp==null || args.endTimestamp=="0" || args.endTimestamp>command.timestamp))
			{
				commandsString+=JSON.stringify(command);
				if(args.op!="findCommand")
					commandsString+="<br />";
			}
		}
console.log(commandsString);
		return commandsString; 
	},

	generateCommand: function(index, text)
	{
		var command={};
		command.text=text;
		command.sets="";
		command.rowKey=index.toString();
		command.es=localStorage.getItem("node");
		command.timestamp=ReportGenerator.INITIAL_TIME_STAMP - (index * ReportGenerator.INDEX_TIME_DIFFERENCE);
		command.readers=ReportGenerator.getReaders(index, command.timestamp);
		return command;
	},

	getReaders: function(index, commandTimestamp)
	{
		var users=[];
		var userIndexs=[];
		var userStatus=[];
		var switchIndex=index%5;
		switch(switchIndex)
		{
			case 0:
				userIndexs=[0,1,2,3,4,5,6];
				userStatus=[true, false, false, true, true, false, true];
			break;
			case 1:
			case 0:
				userIndexs=[1,2,6];
				userStatus=[false, true, true];
			break;
			case 2:
				userIndexs=[4,6,7];
				userStatus=[true, false, false];
			break;
			case 3:
				userIndexs=[5,6];
				userStatus=[true, false];
			break;
			case 4:
				userIndexs=[1,2,4,5,7];
				userStatus=[true, false, false, true, true];
			break;
			default:
				userIndexs=[3,5,6];
				userStatus=[true, false, false];
			break;
		}
console.log(index, switchIndex, userIndexs, userStatus);
		for(var i=0; i<userIndexs.length; i++)
			users.push({name: ReportGenerator.USERS[userIndexs[i]], timestamp: userStatus[i]?commandTimestamp+356943235:"0"});
			
		return users;
	},
	commandBulk: "يطلب إليكم مراقبة والبحث عن اصوات حفر  في منطقة تل العز,يطلب إرسال معلومات وتفاصيل إضافية عن البلاغات المرسلة من قبلكم,يطلب التوجه إلى الموقع رقم ب45 وانتظار التعليمات,تشديد المراقبة بالنظر لكافة التلال الواقعة شمال غرب النقطة 23,يطلب إليكم البحث عن سيارة نوع كيا سيفيك تحمل اللوحة رقم /234234/ في المنطقة التي تعملون بها,يطلب إليكم ارسال تقرير تفصيلي عن الوضع الحالي لديكم,يطلب التوجه إلى النقة رقم 461 وانتظار المزيد من التعليمات,يطلب ارسال امر تجريبي لمعرفة جاهزية كل منكم,يطلب الرصد الجوي بدقة في النقطة رقم 2938 لاحتمال ارسال طائرات مسيرة تحوي مواد متفجرة,يطلب إليكم تشديد الحراسة والمراقبة لنقاط المرابطة لديكم,يطلب إليكم التوجه لشارع المحطة وجلب معلومات بخصوص خلية تخطط لزعزعة الاستقرار في المنطقة تعمل في الخفاء,يطلب اليكم ارسال حالة الجاهزية لكل عنصر",

	
	dataBulk: "سماع صوت طائرة مسيرة من الشرق بسمت 34.5 الآن استمر لمدة 12 ثانية,تجمع اشخاص يحمل بعضهم عصي في آخر الشارع مع استخدام البعض للاتصالات الخلوية بشكل كثيف,اعمدة دخان تتصاعد من اتجاه فرن العباس مع سماع صوت سيارات الاطفاء,سماع اطلاق رصاص في شارع النيل سوف يتم الحصول على المزيد من المعلومات وذكرها,سيارة تحمل الرقم 2839523 تتجاوز حاجز السلوم مسرعة وقيام عناصر الحاجر باطلاق الرصاص عليها,الشرطة تلقي القبض على شخصين كانا يقومان بتصوير فرع الأمن الجنائي والادلة تشير إلى مخطط يستهدف الفرع حيث أن لحظة القاء القبض عليهم كان يوجد العديد من السيارات التي تحمل لوحتها محافظة الرقة,العثور على جثمان مواطن مدني في منتصف شارع الشرق وعليه آثار طعنات وقام الاهالي بإخبار رجال الشرطة ومن خلال رؤيتي لبطاقته الشخصية تبين انها تعود للمدعو سامر الخولي اسم الاب طلال,سماع صوت انفجار بالقرب من مخفر المنطقة العمالية وتوجه سيارات الاسعاف للمكان سوف أقوم بالتوجه لمنطقة التفجير والتواصل لارسال المزيد من المعلومات,صوت صادر من السمت 36.43 والتوقعات تشير إلى مرور طائرة مسيرة من شارع الهلال باتجاه مشفى التوفيق,سماع اصوات حفريات في منطقة القصر تحت البناء رقم 4328 حيث دار احاديث من الاهالي بسماعهم تلك الاصوات لاتوجه للمكان وتم سماع الاصوات لمدة 4 ساعات متواصلة دون معرفة الاسباب,اعلن المشفى الوطني عن وصول عشرات حالات التسمم الغذائي خلال 8 ساعات لاقوم بالتوجه للمشفى وتبين ان السبب هو مواد سامة مخلوطة في المياه وان معظم الاشخاص الذين تسممو يقطنون في حي العمال,سماع اطلاق رصاص بالقرب من ساحة الجابر وتبين انها صادرة عن سيارة تحمل جثمان شهيد من الجيش العربي السوري,غارة جوية للكيان الصهيوني استهدفت النقطة 32 شرق تلة العامر واصابة عدد من قوات الجيش العربي السوري,مشاهدة وميض قوي مع دوي انفجار في شرق شارع المهر والتقدير ان صوت الانفجار يبعد حوالي 800 متر من موقعي ويترافق ذلك مع وجود العديد من الانباء حول غارات للكيان الصهيوني تستهدف نقاط للجيش العربي السوري,قوة تابعة للجيش العربي السوري تلقي القبض على 6 عناصر كانو يختبئون في بناء القيم نهاية شارع الاصالة بناء رقم 528 وقامو باعتقال المجموعة وبعد التفتيش تبين وجود قطع سلاح وذخائر في قبو البناء,شوهد تجمع لحوالي 40 شخص امام ساحة عران في ناحية الصولة وهم ينصتون لشخص ويقوم بتسليم مبالغ مالية لكل منهم في الساعة 2 بعد منتصف الليل,حادث سير على الاستراد الدولي بالقرب من مدينة الحالك ووفاة 4 ركاب واصابة 8 اخرين وتم نقلهم إلى مشفى المدينة,اطلاق رصاص تلاه دوي انفجار في ساحة العشار في الناحية مع وصول تعزيزات لعناصر الامن الداخلي وحفظ النظام,اهمال طبي كبير في مشفى الوارد في منطقة العبارة نتج عنه ارتقاء شهيدين من الجيش العربي السوري اصيبو في معارك ريف حماه الشرقي والحديث عن الاهمال متداول منذ اشهر والشكوك تشير إلا ان الاهمال مقصود بدوافع ارهابية,شوهد تجمع لاليات تحمل لوحات من محافظة حماه وهي تتوجه على الاستراد الرئيسي وبداخلها اشخاص ملثمون,وفاه شخص جراء شجار بين مجموعتين في منطقة الكوة على خلفية انتماء مناطقي,تم العثور على بطاقة ذاكرة في قارعة الطريق وعند استخدامها تبين وجود تطبيقات لا تعمل وعند ارسال البطاقة لشخص تقني ومن خلال فحصه للتطبيقات تبين أنها برامج خبيثة تهدف إلى الحصول وسرقة المعلومات الخاصة بالمستخدم ويوجد اخبار تدل على ان العديد من الاشخاص عثرو على بطاقات مشابه,وجود عبارات على جدران مدرسة القامة تدعم الارهاب ومن خلال النظر للخطوط المستخدمة في كتابة العبارات يتبين ان من قام بالكتابة 4 اشخاص على الاكثر,سماع صوت صاروخ او طائرة مسيرة فوق تلة الصهر بالمست 45.34 وقد استمر الصوت لمدة 4 ثواني من نقطة ثابتة,العديد من الاهالي في المنطقة التي اقيم فيها قدمو شكوى لوجود مناشير كانت موضوعة امام بيوتهم تهددهم بعدم التعاون مع الجيش العربي السوري وتهدد من يتعاون مع الجيش في كشف الإرهاب سوف يتم قتله,سيارة مسرعة تحمل الرقم 29238 تقوم بتجاوز السيارات وقامت بصدم احداها في طريق يتسع لسيارة واحدة فقط ونوعها كيا سيراتو لون فضي,استشهاد عدد من المدنيين في ناحية شورى أثناء قيامهم بزراعة وحصاد اراضهم نتيجة عبوات ناسفة تم زراعتها بوقت سابق من قبل العصابات المسلحة الإرهابية وتم التأكد من ارتقاء 4 شهداء اشقاء وعدد من الجرحى,وجود سيارة عسكرية نوع جيب مركونة في الطريق الواصل بين بنك ارام وساحة التمالكة منذ ثلاثة ايام والشكوك بأن السيارة مسروقة وهي تحمل الرقم 239428"
};
