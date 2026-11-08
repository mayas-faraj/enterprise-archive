var map;
var onlineList={};
$(document).ready(function()
{
	//constant variables region
	var OFFSET=10;
	var SVG_TEXT_LENGTH=19;
	var LIVE_DELAY=5000;

	var SMS_MAX_LENGTH=190;
	var XMPP_MODE=1;
	var SMS_MODE=2;

	//tempate parsing
	var reportTemplate=$("#reportDiv");
	var reportCommandTemplate=reportTemplate.find("#commandLabel")
	var reportParent=reportTemplate.parent();

	var unseenTemplate=reportTemplate.find(".content-report-svg");

	var carouselTemplate=reportTemplate.find("#reportCarousel>a:first");
	var carouselParent=reportTemplate.find("#reportCarousel");

	var commentTemplate=reportTemplate.find("#commentDiv>div:first");
	var actionTemplate=reportTemplate.find("#actionDiv>div:first");

	var userTemplate=$("#userDiv");
	var selectOptionTemplate=$("#setSelect>option");

	//leaflet map initialization
	var satelliteLayer=L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 13,  maxNativeZoom: 12, minNativeZoom: 8, reuseTitles: true});
	var streetOpacityLayer=L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 13,  maxNativeZoom: 12, minNativeZoom: 8, resuseTiles: true, opacity:0.5});
	var streetLayer=L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 13,  maxNativeZoom: 12, minNativeZoom: 8, resuseTiles: true});

	var northEast=L.latLng(37.7, 45.2);
	var southWest=L.latLng(31.94, 33.97);

	map=L.map('map',
	{
		maxBounds: L.latLngBounds(southWest, northEast),
		center:[34.8,38.9],
		zoom: 7,
		zoomSnap: 0.1,
		layers: [satelliteLayer, streetOpacityLayer]
	});
  
	//variable region
	var sets=SetManager.getSet();
	var setUsers=SetManager.getUsers();
	//var onlineList=[];
	var currentScrollTop;
	var startKey="";
	var users;
	var searchKeywords;
	var minImportance;
	var maxImportance;
	var useUnseenFilter;
	var useImportantFilter;
   	var hasCommand;
	var timestamp1;
	var timestamp2;
	var longitude1;
	var latitude1;
	var longitude2;
	var latitude2;
	var searchApplied=false;
	var scrollEnabled=true;
	var displayJid=false;
	var manageNode=false;

	//load settings
	DataAccess.findSetting("displayJid", function(configResult)
	{
		//console.log("config displayJid: ", configResult);

		if(configResult.trim()!="null")
			displayJid=JSON.parse(configResult).value=="true";
	});

	DataAccess.findSetting("liveMapNotification", function(configResult)
	{
		//console.log("config liveMapNotification: ", configResult);

		if(configResult.trim()!="null")
			$("#liveMapNotificationCheckbox").prop("checked", JSON.parse(configResult).value=="true");
	});

	DataAccess.findSetting("liveTime", function(configResult)
	{
		//console.log("config liveTime: ", configResult);

		if(configResult.trim()=="null")
		{
			$("#liveTimeText").val(LiveNavigation._INTERVAL / 1000);
		}
		else
		{
			var value=JSON.parse(configResult).value;
			LiveNavigation._INTERVAL=value;
			$("#liveTimeText").val(value / 1000);
		}

		M.updateTextFields();
	})

	DataAccess.findSetting("mapViewGroup", function(configResult)
	{
		//console.log("config mapViewGroup: ", configResult);

		if(configResult.trim()!="null")
		{
			var value=JSON.parse(configResult).value;
			$("input[value='"+value+"']").click().change();
		}
	});
/*
	SessionAccess.getSetCommentPrivilege(function(hasPrivilege)
	{
		if(hasPrivilege!="1")	
			reportTemplate.find("a.section-toggler").each(function()
			{
				if($(this).attr("data-section")==".report-comment")
					$(this).remove();
			});
	});

	SessionAccess.getSetCommentPrivilege(function(hasPrivilege)
        {
                if(hasPrivilege.trim()=="0")
                        reportTemplate.find("a.section-toggler").each(function()
                        {
                                if($(this).attr("data-section")==".report-comment")
                                        $(this).remove();
                        });
        });

	SessionAccess.getSetImportantPrivilege(function(hasPrivilege)
	{
		if(hasPrivilege.trim()=="0")
			reportTemplate.find("#importantButton").remove();
	});

	SessionAccess.getSetSeenPrivilege(function(hasPrivilege)
	{
		if(hasPrivilege.trim()=="0")
			unseenTemplate=$("<span></span>");
	});
*/
	//materialize initialization
	if($("#reportNav").length==1)
	{
		$("#reportNav").sidenav(
		{
			edge: "right",
			draggable: false,
		}).sidenav("open");
	}
	
	$(".collapsible").collapsible();
	$(".carousel").carousel({indicators: true});
	$(".fixed-action-btn").floatingActionButton();
	$(".datepicker").datepicker(datepickerArgs);
	$(".timepicker").timepicker(timepickerArgs);
	$(".tooltipped").tooltip();
	$("select").formSelect();
	$(".dropdown-trigger").dropdown({autoTrigger: true, constrainWidth: false, coverTrigger: false, hover: true});
	$("#viewModal, #filterModal, #mapSettingModal").modal();
	$("#exportModal").modal(
	{
		onOpenStart: function(modal)
		{
			$(modal).find("span:first").text($(".content-report").length);
		}
	});

	$("#visibilityModal").modal(
	{
		onOpenStart: function(modal)
		{
			$(modal).find("span").text($(".content-report-svg").length);
		}
	});

	$("#exportReportModal").modal(
	{
		onOpenStart: function(modal, trigger)
		{
			var report=$(trigger).parent().parent().parent();
			$(modal).find("#exportButton").attr("data-report", "#"+report.attr("id")); 
		}
	});

	$("#commandModal").modal(
	{
		onOpenStart: function(modal, trigger)
		{
			var commandKey=$(trigger).attr("data-command");
			$(modal).find(">.modal-footer>a:first").attr("href", "commands.html?c="+commandKey);
			InterfaceAccess.findCommand(commandKey, function(result)
			{
				try
				{
					//console.log("command: ", result);
					if(result!=null && result.trim()!="")
					{
						var commandObject=JSON.parse(result);
						$(modal).find("p").html(commandObject.text);
					}
					else
						$(modal).find("p").html("لا تملك الصلاحية لقراءة الأمر.");
				}
				catch(ex)
				{
					$(modal).find("p").html(ex);
					console.log(ex);
				}
			});
		}
	});

	$("#sendCommandModal").modal(
	{
		onOpenStart: function(modal, trigger)
		{
			var user=$(trigger).attr("data-user");
			$(modal).find("#commandUserLabel").html(user);
			$("#configureUl>li:first").click();
		}
	});

	$("#confirmModal").modal(
	{
		onOpenStart: function(modal, trigger)
		{
			var operation=$(trigger).attr("data-operation");
			$(modal).find("#confirmButton").attr("data-operation", operation);
			switch(operation)
			{
				case "block":
					$(modal).find("span").html("إزالة");
				break;
				case "unblock":
					$(modal).find("span").html("استعادة");
				break;
			};
		}
	});

	//update materialize input value
	updateDateControl($("#searchFromDate"));
	updateDateControl($("#searchToDate"));
	updateTimeControl($("#searchFromTime"));
	updateTimeControl($("#searchToTime"));

	//request variable and initialization
	var queryUser=Master.getVariable("id");
	var schema=Master.getVariable("schema");
	var reportRowkey=Master.getVariable("r");
	var querySet=Master.getVariable("set");
	var queryMap=Master.getVariable("map");

	//initial statements
	if(schema==null)
	{
		reportTemplate.remove();

		//initial functions
		setupViewMode(queryMap==null);
		$(window).scrollTop(0);
		carouselParent.html("");
		LiveNavigation.setMap(map);
		LiveNavigation.setStopButton($("#stopLiveNavigationButton"));
		LiveNavigation.setPlayButton($("#playLiveNavigationButton"));
		
		$(".set-thetype").html(SetManager.getSetInfo().theType);

		/*
		SessionAccess.getManageNodesPrivilege(function(privilege)
		{
			manageNode=privilege=="1";
			if(reportRowkey!=null)
			{
				$("#assistanceDiv").remove(); 
				userTemplate.next().remove();
				userTemplate.remove();
				
				loadReport(reportRowkey);		

				$("#dataDiv").removeClass("l5").addClass("l7").removeClass("m12").addClass("m5");
				$("#moreDiv>a>span").html("عرض جميع البلاغات");
				$("#moreDiv>a").attr("href", "reports.html");
			}
			else
			{
				$("#moreDiv").css("display", "none");

				if(queryUser==null)
				{
					userTemplate.remove();
					fillSet();
				}
				else
				{
					setupUserCard();
					
					reportTemplate.find("#panelDiv, .content-icon-offline").remove();
					reportTemplate.find("#userLink").addClass("cursor-default");
					$("#viewModeButton").remove();
				}

				SessionAccess.getControlList($("#searchText"), $("#searchFromDate"), $("#searchFromTime"), $("#searchToDate"), $("#searchToTime"), $("#setSelect"), $("#unseenReportsCheckbox"), $("#importantReportsCheckbox"), $("#replayReportsCheckbox"), $("input[name=importantGroup]"), $("#mapLockCheckbox"), function()
				{
					$("#setSelect").formSelect();
					addSelectAll($("#setSelect"));
					parseCondition(true);
					loadReports();
				});
			}
		});
		*/
	}

	//event region
	$("#filterDiv #searchButton, #filterModal #searchButton").click(function()
	{
		startKey="";
		searchApplied=true;

		$(document).scrollTop(0);
		
		$(".content-report, .material-tooltip").remove();
		$(".tooltipped").tooltip();
		for(var layerId in map._layers)
			if(map._layers[layerId]._url==null)
				map.removeLayer(map._layers[layerId]);

		parseCondition(false);
		loadReports();

		//SessionAccess.saveControlList($("#searchText"), $("#searchFromDate"), $("#searchFromTime"), $("#searchToDate"), $("#searchToTime"), $("#setSelect"), $("#unseenReportsCheckbox"), $("#importantReportsCheckbox"), $("#replayReportsCheckbox"), $("input[name=importantGroup]"), $("#mapLockCheckbox"));
	});

	$("#filterDiv #resetSearchButton, #filterModal #resetSearchButton").click(function()
	{
		$("#searchText").val("");
		$("#unseenReportsCheckbox, #importantReportsCheckbox, #replayReportsCheckbox").prop("checked", false);
		$("#searchFromDate, #searchToDate").val("").datepicker(datepickerArgs); 
		$("#searchFromTime, #searchToTime").val("").timepicker(timepickerArgs);
		$("input[name=importantGroup]:first").prop("checked", true);
		
		var values=[];
		$("select option").each(function()
		{
			values.push($(this).attr("value"));
		});

		$("#setSelect").val(values).formSelect();
		addSelectAll($("setSelect"));

		$("#searchButton").click();
	});

	$(document).on("click", ".locationing", function()
	{
		var markerId=$(this).attr("data-marker");
		if(markerId!=0)
			map.flyTo(map._layers[markerId].openPopup()._latlng, 14);

	});

	$("#statisticsButton").click(function(v)
	{
		if($("#floatStatisticsDiv").hasClass("hide"))
			$("#floatStatisticsDiv").removeClass("hide");
		else
			$("#floatStatisticsDiv").addClass("hide");
	});

	$("#showDetialCheckbox, #showMediaCheckbox, #showSetCheckbox, #showCommandCheckbox").change(function()
	{
		var elementClass=$(this).attr("data-target");
		var display;

		if($(this).prop("checked"))
			display="";
		else
			display="none";

		$(elementClass).css("display", display);
		$(elementClass+" + hr").css("display", display);

		reportTemplate.find(elementClass).css("display", display);
		reportTemplate.find(elementClass+" + hr").css("display", display);
	});

	$("#showMarginCheckbox").change(function()
	{
		if($(this).prop("checked"))
		{
			$(".content-report").css("margin-bottom", "");
			reportTemplate.css("margin-bottom", "");
		}
		else
		{
			$(".content-report").css("margin-bottom", "0px");
			reportTemplate.css("margin-bottom", "0px");
		}
	});

	$("#userSubscribeButton").click(function()
	{
		StropheAccess.presenceSubscribe(StropheAccess.getJid(queryUser));
		M.toast({html: "<i class='material-icons'>check_circle</i>تم إرسال طلب مصادقة لرؤية الحالة, ستتمكن من رؤية حالة المستخدم ومراسلته مرجد قيام المستخدم بعملية تسجيل الدخول", classes: "toast-success", displayLength: 5000});
	});

	$("#mapSettingButton").click(function()
	{
		var value=parseFloat($("#liveTimeText").val());

		if(!isNaN(value))
		{
			LiveNavigation._INTERVAL=value*1000;

			DataAccess.saveSetting("liveTime", LiveNavigation._INTERVAL, function(result)
			{
				//console.log("saving liveMapNotification: ", result);
			});
		}
		else
		{
			M.toast({html: "<i class='material-icons'>cancel</i>القيمة المدخلة ليست برقم", classes: "toast-error"});
			$("#liveTimeText").val(LiveNavigation._INTERVAL/1000);
		}
	});

	$("#mapConfigDiv #centerMapButton, #mapSettingModal #centerMapButton").click(function()
	{
		map.flyTo([34.8,38.9],7);
	});

	$("#viewModeButton").click(function()
	{
		toggleViewMode();
	});

	$("#visiblitiyButton").click(function()
	{
		$(".content-report-svg").click();
	});

	$("#exportAllButton").click(function()
	{
		var exportDetials=$("#exportDetailsCheckbox").prop("checked");
		var exportComments=$("#exportCommentsCheckbox").prop("checked");
		var exportActions=$("#exportActionsCheckbox").prop("checked");
		var exportContent="";
		var seperator=",";
		var replacer="-";
		var header="";

		header+="اسم المرسل"+seperator;
		header+="معرف المرسل"+seperator;
		header+=SetManager.getSetInfo().theType+seperator;
		header+="التاريخ"+seperator;
		header+="البلاغ"+seperator;
		header+="العنوان"+seperator;
		header+="الإحداثيات"+seperator;
		header+="عدد الوسائط"+seperator;
		header+="وسيط الإرسال"+seperator;
		header+="معرف خلية التغطية"+seperator;
		if(exportComments)
			header+="التعليقات"+seperator;
		if(exportActions)
			header+="التفاعلات"+seperator;

		exportContent+=header+"\r\n";

		$(".content-report").each(function()
		{
			exportContent+=$(this).find("#userLink").html().replace(seperator, replacer)+seperator;
			exportContent+=$(this).find("#userLink").attr("data-tooltip").substring(36)+seperator;
			exportContent+=$(this).find("#setLink>span").html().replace(seperator, replacer)+seperator;
			exportContent+=moment(parseInt($(this).find("#timestampLabel").attr("data-timestamp"))).format(DATE_FORMAT)+seperator;
			exportContent+=$(this).find("#reportLabel").html().replace(/[\s"]/gi, " ").replace(seperator, replacer)+seperator;
			exportContent+=$(this).find("#locationLink>span").html().replace(seperator, replacer)+seperator;
			var markerId=$(this).find("#locationLink").attr("data-marker");
			
			if(markerId==0)
				exportContent+="لا يوجد إحداثيات"+seperator;
			else
				exportContent+=map._layers[markerId]._latlng.lat+"-"+map._layers[markerId]._latlng.lng+seperator;

			exportContent+=$(this).find("#mediaCountLabel").html()+seperator;
			exportContent+=$(this).find("#providerLabel").html()+seperator;
			exportContent+=$(this).find("#cgiLabel").html()+seperator;

			if(exportComments)
			{
				var comments="";

				$(this).find("#commentDiv>div").each(function()
				{
					comments+=$(this).find(">label>span:first").html().replace(seperator, replacer);
					comments+=" بتاريخ ";
					comments+=moment(parseInt($(this).find(">span").attr("data-timestamp"))).format(DATE_FORMAT);
					comments+=" - ";

				});

				if(comments.length>0)
					comments=comments.substring(0, comments.length-2);
				exportContent+=comments+seperator;
			}

			if(exportActions)
			{
				var actions="";

				$(this).find("#actionDiv>div>label").each(function()
				{
					actions+=$(this).find(">span:first").html();
					actions+=" بتاريخ ";
					actions+=moment(parseInt($(this).find(">span:last").attr("data-timestamp"))).format(DATE_FORMAT);
					actions+=" - ";
				});

				if(actions.length>0)
					actions=actions.substring(0, actions.length-2);
				exportContent+=actions+seperator;
			}

			exportContent+="\r\n";
		});

		DocumentExporter.exportCsv(exportContent, function(result)
		{
			//console.log(result);

			if(!result.startsWith("error"))
				window.location.href=result;
		});
	});

	$(document).on("click" ,"#exportButton", function()
	{
		var exportComments=$("#exportReportCommentsCheckbox").prop("checked");
		var exportActions=$("#exportReportActionsCheckbox").prop("checked");
		var reportId=$(this).attr("data-report");
		var report=$(reportId);
		var admin=$("#headerUserFullNameLabel").html();
		var name=report.find("#userLink").html();
		var id=report.find("#userLink").attr("data-tooltip").substring(36);
		var date=moment(parseInt(report.find("#timestampLabel").attr("data-timestamp"))).format(DATE_FORMAT);
		var set=SetManager.getSetInfo()["theType"]+" "+report.find("#setLink>span").html();
		var text=report.find("#reportLabel").html();
		var address=report.find("#locationLink>span").html();
		var markerId=report.find("#locationLink").attr("data-marker");
		var location;
		if(markerId==0)
			location="لا يوجد إحداثيات";
		else
			location=map._layers[markerId]._latlng.lat+", "+map._layers[markerId]._latlng.lng;

		var media=report.find("#mediaCountLabel").html();
		var comments="";

		if(exportComments)
		{
			report.find("#commentDiv>div").each(function()
			{
				comments+=$(this).find(">label>span:first").html();
				comments+=" بتاريخ ";
				comments+=moment(parseInt($(this).find(">span").attr("data-timestamp"))).format(DATE_FORMAT);
				comments+=", ";
			});

			if(comments.length>0)
			{
				comments="التعليقات على البلاغ: "+comments;
				comments=comments.substring(0, comments.length-2);
			}
		}

		var actions="";

		if(exportActions)
		{
			report.find("#actionDiv>div>label").each(function()
			{
				actions+=$(this).find(">span:first").html();
				actions+=" بتاريخ ";
				actions+=moment(parseInt($(this).find(">span:last").attr("data-timestamp"))).format(DATE_FORMAT);
				actions+=", ";
			});

			if(actions.length>0)
			{
				actions="سجل التفاعلات مع البلاغ: "+actions;
				actions=actions.substring(0, actions.length-2);
			}
			
		}

		DocumentExporter.exportWord(admin, name, id, set, text, date, address, location, media, comments, actions, function(result)
		{
			console.log(result);
			if(!result.startsWith("error"))
				window.location.href=result;
		});

	});

	$(document).on("click" ,".content-report-svg", function()
	{
		var report=$(this).parent().parent().parent().parent().parent().parent();
		var reportId=report.attr("id").substring(7);

		var timestamp=(new Date()).getTime();
		var callback=function(resultId)
		{
			console.log("set seen: "+resultId);

			if(resultId!=null && resultId!="")
			{
				addReportAction(resultId, "seen");
				Master.increaseNotificationCount(-1);
				if($("#notify_"+resultId.replace("*", "\\*")+" .notify-unseen").length>0)
					$("#notify_"+resultId.replace("*", "\\*")+" .notify-unseen").remove();
			}
		};

		if(reportId.indexOf("*")>=0)
			InterfaceAccess.setReportSeenById(reportId, "1", timestamp, callback); 
		else
		{
			var isRealtime=report.attr("data-realtime");
			InterfaceAccess.setReportSeen(reportId, isRealtime, "1", timestamp, callback);
		}
	});

	$(document).on("click", ".content-report #commentButton" ,function()
	{
		var report=$(this).parent().parent().parent();
		var reportId=report.attr("id").substring(7);
		var timestamp=(new Date()).getTime();
		var commentText=report.find("div.report-comment input[type=text]");
		var callback=function(resultId)
		{
			console.log("comment save result: ", resultId);
			var reportDiv=$("#report_"+resultId.replace("*", "\\*"));
			var reportText=reportDiv.find("div.report-comment input[type=text]");

			reportDiv.find("#commentDiv").append(getComment({text: reportText.val(), timestamp: timestamp}));
			reportDiv.find("#commentDiv>div:last>span").tooltip();
			reportText.val("");
		};

		if(commentText.val()!="")
			if(reportId.indexOf("*")>0)
				InterfaceAccess.saveReportCommentById(reportId, commentText.val(), timestamp, callback);
			else
			{
				var isRealtime=report.attr("data-realtime");		

				InterfaceAccess.saveReportComment(reportId, isRealtime, commentText.val(), timestamp, callback);
			}
	});

	$(document).on("click", ".content-report #commentDiv .button-close", function()
	{
		var report=$(this).parent().parent().parent().parent();
		var commentDiv=$(this).parent().parent();
		var reportId=report.attr("id").substring(7);
		var isRealtime=report.attr("data-realtime");
		var timestamp=$(this).parent().parent().find("span.timer").attr("data-timestamp");

		InterfaceAccess.deleteComment(reportId, isRealtime, timestamp, function(result)
		{
			console.log("deleting comment result: ", result);
			
			if(result=="true")
				commentDiv.remove();
		});
	});

	$(document).on("click", ".content-report #importantButton" ,function()
	{
		var report=$(this).parent().parent().parent();
		var reportId=report.attr("id").substring(7);
		var importantButton=$(this);
		var setImportant=!importantButton.hasClass("stream-button-active");
		var timestamp=(new Date()).getTime();
		var callback=function(resultId)
		{
			resultId=resultId.replace("*", "\\*");
			console.log("toggle important, ", setImportant, " with result: ", resultId);

			if(resultId!=null && resultId!="")
			if(setImportant)
			{
				$("report_"+resultId+" #importantButton").addClass("stream-button-active");
				addReportAction(resultId, "important");
			}
			else
			{
				$("report_"+resultId+" #importantButton").removeClass("stream-button-active");
				addReportAction(resultId, "unimportant");
			}
		};

		if(reportId.indexOf("*")>=0)
			InterfaceAccess.setReportImportantById(reportId, setImportant?"1":"0", timestamp, callback);
		else
		{
			var isRealtime=report.attr("data-realtime");
			InterfaceAccess.setReportImportant(reportId, isRealtime, setImportant?"1":"0", timestamp, callback);
		}
	});

	$(document).on("click", ".section-toggler", function()
	{
		var section=$(this).attr("data-section");
		var target=$(this).parent().parent().parent().find(section);
		

		if($(target).hasClass("section-active"))
			$(target).removeClass("section-active");
		else
			$(target).addClass("section-active");
	});

	$(document).on("mouseenter", ".leaflet-popup", function()
	{
		LiveNavigation.pauseNavigation();
	});

	$(document).on("mouseleave", ".leaflet-popup", function()
	{
		LiveNavigation.resumeNavigation();
	});

	$(document).on("mouseenter", ".content-report .content-icon-panel", function()
	{
		$(this).addClass("content-icon-panel-active")
	});

	$(document).on("mouseleave", ".content-report .content-icon-panel", function()
	{
		$(this).removeClass("content-icon-panel-active")
	});

	$("#liveMapNotificationCheckbox").change(function()
	{
		DataAccess.saveSetting("liveMapNotification", $(this).prop("checked"), function(result)
		{
			console.log("saving liveMapNotification: ", result);
		});
	});

	$("#playLiveNavigationButton").click(function()
	{
		LiveNavigation.resumeNavigation();
	});

	$("#sendCommandButton").click(function()
	{
		if(Validator.validateHasValue($("#commandText")))
		{
			var commandUser=$("#commandUserLabel").html();
			var commandJid=StropheAccess.getJid(commandUser);
			var commandText=$("#commandText").val();
			InterfaceAccess.saveCommand(Strophe.getNodeFromJid(StropheAccess.connection.jid), commandText, "", commandUser, function(commandId)
			{
				console.log("Command has saved to db: ", commandId);
				if(commandId!=null)
				{
					var mode=parseInt($("#configureButton").attr("data-mode"));
					if(mode==XMPP_MODE)
					{
						StropheAccess.sendMessage(commandId, [commandJid], commandText);
					}
					else if(mode==SMS_MODE)
					{
						SmsAccess.sendMessage(commandId, [commandJid], commandText, function(sendResult)
						{
							console.log(sendResult);
							InterfaceAccess.setCommandRead(commandId, commandUser, "-1", function(result)
							{
								console.log("save sms user read: ", result);
							});
						});
					}

					var audio=new Audio();
					audio.src="audio/Ding Notification.wav";
					audio.play();

					M.toast({html: "تم ارسال الأمر بنجاح.", classes: "toast-success"});
					$("#commandText").val("");

					$("#closeCommandButtom").click();
					$("#sendCommandModal").modal("close");

				}
			});
		}

	});

	$("#configureUl>li").click(function()
	{
		var mode=parseInt($(this).attr("data-mode"));
		$("#configureButton").attr("data-mode", mode);
		$("#configureButton").html($(this).find(">a").html());
		if(mode==SMS_MODE)
		{
			$("#commandText").attr("maxlength", SMS_MAX_LENGTH).attr("data-length", SMS_MAX_LENGTH).characterCounter();
		}
		else
		{
			$("#commandText").attr("maxlength", null).attr("data-length", null);
			$(".character-counter").remove();
		}
	});


	$("#confirmButton").click(function()
	{
		var operation=$(this).attr("data-operation");
		var jid=StropheAccess.getJid(queryUser);

		if(setUsers[jid]!=null)
		{
			/*
			*/
			/*
			SessionAccess.getSessionNodeId(function(node)
			{
				if(operation=="block")
				{
					var count=$("#userReportCount").html();
console.log("removing: ", node, jid);
					StropheAccess.unRegisterUser(node, jid, function(nodeResult)
					{
						StropheAccess.sendMessage((new Date()).getTime(), ["ehq@ekhtar.sy"], '<roster>{"id":"'+(new Date()).getTime()+'", "jid":"'+jid+'", "name": "'+setUsers[jid].name+'","command": "delete"}');
						if(count!="0")
							StropheAccess.saveRosterItem(jid, setUsers[jid].name, SetManager.DELETED_SET_ID, function()
							{
								M.toast({html: "<i class='material-icons'>check_circle</i>تم حجب المستخدم بنجاح لوجود بلاغات مرسله من قبله.", classes: "toast-success"});
								StropheAccess.presenceUnsubscribed(jid, function()
								{
									console.log("jid unsubscribe from presence:", jid);
								});
							});
						else
							StropheAccess.deleteRosterItem(jid, function()
							{
								delete(setUsers[jid]);
								M.toast({html: "<i class='material-icons'>check_circle</i>تم حذف المستخدم بنجاح.", classes: "toast-success"});
								console.log("jid deleted completely: ", jid);
							});
					});
				}
				else if(operation="unblock")
				{
					XmppAccess.checkJidInNodes(jid, function(exists)
					{
						if(exists.indexOf('1')==-1)
						{
							StropheAccess.saveRosterItem(jid, setUsers[jid].name, "", function(rosterResult)
							{
								StropheAccess.sendMessage((new Date()).getTime(), ["ehq@ekhtar.sy"], '<roster>{"id":"'+(new Date()).getTime()+'", "jid":"'+jid+'", "name":"'+setUsers[jid].name+'", "available":false}');

								StropheAccess.registerUser(node, jid, function(iq)
								{
									M.toast({html: "<i class='material-icons'>check_circle</i>تم إلغاء حجب المستخدم.", classes: "toast-success"});

									StropheAccess.presenceSubscribe(jid, function(subscribeResult)
									{
										console.log("Presence subscribe");
									});
								});

							});
						}
						else
							M.toast({html: "<i class='material-icons'>cancel</i>المستخدم ينتمي إلى جهة أخرى حالياً..", classes: "toast-error"});
					});
				}
			});
			*/
		}
		else
			M.toast({html: "<i class='material-icons'>cancel</i>لا يوجد صلاحيات للقيام بالعملية.", classes: "toast-error"});
	});


	$("#fullMapButton").click(function()
	{
		window.location.replace("notify.html");
	});

	$("input[name='mapViewGroup']").change(function()
	{		
		if($(this).val()=="fullMap")
			map.removeLayer(streetLayer).addLayer(satelliteLayer).addLayer(streetOpacityLayer);
		else if($(this).val()=="streetMap")
			map.removeLayer(streetOpacityLayer).removeLayer(satelliteLayer).addLayer(streetLayer);
		else if($(this).val()=="satelliteMap")
			map.removeLayer(streetOpacityLayer).removeLayer(streetLayer).addLayer(satelliteLayer);

		DataAccess.saveSetting("mapViewGroup", $(this).val(), function(configResult)
		{
				console.log("saving mapViewGroup: ", configResult);
		});
	});

	$(".sidenav-button").click(function()
	{
		var sidenav=M.Sidenav.getInstance($("#reportNav"));
		if(sidenav!=null)
			if(sidenav.isOpen)
			{
				$(this).css("margin-right", "0px");
				sidenav.close();
			}
			else
			{
				sidenav.open();
				$(this).css("margin-right", "350px");
			}
	});


	//functions region
	function scrollReportNav()
	{
		if(scrollEnabled && !$("#reportNav").is(":animated") && $(this).scrollTop()!=0 && $(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight)
		{
			scrollEnabled=false;
			console.log("fetching from: "+startKey);
			loadReports();
		}
	}

	function scrollWindow()
	{
		if(scrollEnabled && !$("html").is(":animated") && $(this).scrollTop()!=0 && $(this).scrollTop() + $(this).innerHeight() >= $(document).height()-5)
		{
			scrollEnabled=false;
			console.log("fetching from: "+startKey);
			loadReports();
		}
	}

	function parseCondition(isInitial)
	{
		var queryString="";
		users="";
		if(queryUser!=null)
		{
			queryString=joinQuery(queryString, "الخاصة بالمستخدم "+queryUser);
			users=queryUser;
		}
		else if(isInitial && querySet!=null)
		{
			if(sets[querySet].users.length!=0)
				for(var j=0; j<sets[querySet].users.length; j++)
					users+=Strophe.getNodeFromJid(sets[querySet].users[j].jid)+";";
			else
				users=";";
			setName=sets[querySet].name;

			queryString=joinQuery(queryString, "الخاصة بمستخدمي "+SetManager.getSetInfo().theType + " (" + setName+ ")");
		}
		else if($("#setSelect").val().length==0)
		{
			users=";";
			queryString=joinQuery(queryString, "الذين لا ينتمون لأي "+SetManager.getSetInfo().type);
		}
		else if($("#setSelect").val().length!=$("#setSelect>option").length)
		{
			var selectedSet=$("#setSelect").val();
			var setNames="";
	
			for(var i=0; i<selectedSet.length; i++)
			{
				for(var j=0; j<sets[selectedSet[i]].users.length; j++)
					users+=Strophe.getNodeFromJid(sets[selectedSet[i]].users[j].jid)+";";
				setNames+=sets[selectedSet[i]].name;

				if(i!=selectedSet.length-1)
					setNames+=" ,";
			}

			queryString=joinQuery(queryString, "الخاصة بمستخدمي "+SetManager.getSetInfo().theTypes + " ("+setNames+")");
		}

		searchKeywords=$("#searchText").val();
		if(searchKeywords!="")
			queryString=joinQuery(queryString, "التي تحوي الكلمة ("+searchKeywords+")");
		
		var importanceText="";
		minImportance=$("input[name=importantGroup]:checked").attr("data-min-importance");
		maxImportance=$("input[name=importantGroup]:checked").attr("data-max-importance");

		if(minImportance!=0 || maxImportance!=0)
			queryString=joinQuery(queryString, "التي تم تقييم النظام درجة أهميتها كـ("+$("input[name=importantGroup]:checked + span>span").html()+")");

		useUnseenFilter=$("#unseenReportsCheckbox").prop("checked");
		if(useUnseenFilter)
			queryString=joinQuery(queryString, "التي لم تتم مشاهدتها");

		useImportantFilter=$("#importantReportsCheckbox").prop("checked")
		if(useImportantFilter)
			queryString=joinQuery(queryString, "التي تم تعيينها كهامة");

		hasCommand=$("#replayReportsCheckbox").prop("checked");
		if(hasCommand)
			queryString=joinQuery(queryString, "المرسلة رداً على أمر");

		timestamp1=getTimestamp($("#searchFromDate"), $("#searchFromTime"));
		timestamp2=getTimestamp($("#searchToDate"), $("#searchToTime"), true);

		if(timestamp1!=0)
			queryString=joinQuery(queryString, "التي تم استقبالها بعد تاريخ "+moment(timestamp1).format(DATE_FORMAT));

		if(timestamp2!=0)
			queryString=joinQuery(queryString, "تاريخ استقبالها قبل "+moment(timestamp2).format(DATE_FORMAT));

		if($("#mapLockCheckbox").prop("checked"))
		{
			var bounds=map.getBounds();	
			longitude1=bounds._northEast.lng;
			latitude1=bounds._northEast.lat;
			longitude2=bounds._southWest.lng;
			latitude2=bounds._southWest.lat;
		}
		else
			longitude1=longitude2=latitude1=latitude2=0;

		queryString=queryString.substring(0, queryString.length-2);

		$("#queryLabel").html("عرض جميع البلاغات "+queryString+" حسب الأحدث");
	}

	function setupUserCard()
	{
		var userInfo=setUsers[StropheAccess.getJid(queryUser)];
		if(userInfo==null)
		{
			userTemplate.find("#headerLabel").html(SetManager.getEmptyUser().name);
			userTemplate.find("#userId").html(queryUser);
			userTemplate.find("#userSet").html(SetManager.getEmptyUser().setName);
			userTemplate.find("img").attr("src", SetManager.getEmptyUser().setLogo);
			userTemplate.find("userStatus").removeClass("content-icon-offline").removeClass("content-icon-online").addClass("content-icon-exclamation");
			userTemplate.css("border-right-color", SetManager.getEmptyUser().setColor);

			userTemplate.find("#userCommandButton, #userAccessButton, #userSubscribeButton, #userNavigationButton, #unblockUserButton, #blockUserButton").css("display", "none");
		}
		else
		{
			SessionAccess.getManageUsersPrivilege(function(privilege)
			{
				if(privilege=="1")
				{
					userTemplate.find("#userEditButton").attr("href", "users.html?id="+queryUser);

					$("#userDiv").mouseenter(function()
					{
						userTemplate.find("#userEditButton").css("opacity", "0.7");
					});

					$("#userDiv").mouseleave(function()
					{
						userTemplate.find("#userEditButton").css("opacity", "0");
					});

				}
				else
					userTemplate.find("#userEditButton").remove();
					
			});

			userTemplate.find("#userNavigationButton").attr("href", "navigation.html?id="+queryUser);
			userTemplate.find("#userAccessButton").attr("href", "access.html?id="+queryUser);
			userTemplate.find("#userCommandButton").attr("data-user", queryUser);

			userTemplate.find("#headerLabel").html(userInfo.name);
			userTemplate.find("#userId").html(queryUser);
			userTemplate.find("#userSet").html(userInfo.setName);
			userTemplate.find("img, .content-report #userImage").attr("src", userInfo.setLogo);

			$(".content-report #userLink").html(userInfo.name);
			$(".content-report #userImage").attr("src", userInfo.setLogo);

			userTemplate.css("border-right-color", userInfo.setColor);

			userTemplate.find("#userCommandButton, #userAccessButton, #userSubscribeButton, #userNavigationButton, #unblockUserButton, #blockUserButton").css("display", "");

			if(!userInfo.available)
				userTemplate.find("#userStatus").removeClass("content-icon-offline").removeClass("content-icon-online").addClass("content-icon-exclamation");
			else if(checkUserStatus(queryUser))
				
				userTemplate.find("#userStatus").removeClass("content-icon-offline").removeClass("content-icon-exclamation").addClass("content-icon-online");
			else
				userTemplate.find("#userStatus").removeClass("content-icon-offline").removeClass("content-icon-exclamation").addClass("content-icon-offline");

			if(userTemplate.find("#userReportCount").text()=="")
				InterfaceAccess.countReportsByUsers(queryUser, "0", function(reportCount)
				{
					if(reportCount.indexOf("Error")==-1)
					{
						userTemplate.find("#userReportCount").html(reportCount);
						if(setUsers[StropheAccess.getJid(queryUser)]==null && StropheAccess.connection.connected && reportCount>0)
							StropheAccess.saveRosterItem(StropheAccess.getJid(queryUser), "", SetManager.DELETED_SET_ID);	
					}
					else
						userTemplate.find("#userReportCount").html("(لا يمكن الوصول للبيانات) ٠");
					setupUserButtons(userInfo.setId, userInfo.available);
				});
			else
				setupUserButtons(userInfo.setId, userInfo.available, userTemplate.find("#userReportCount").html());
		}
	}

	function setupUserButtons(userSetId, available)
	{
		if(userSetId!=SetManager.DELETED_SET_ID)
		{
			userTemplate.find("#unblockUserButton").css("display", "none");
			if(available)
				userTemplate.find("#userSubscribeButton").css("display", "none");
			else
			{
				userTemplate.find("#userCommandButton").css("display", "none");
	
				if(available!=null)
					userTemplate.find("#userSubscribeButton>i").html("access_time");
			}
		}
		else
			userTemplate.find("#userSubscribeButton, #userCommandButton, #blockUserButton").css("display", "none");

		SessionAccess.getManageUsersPrivilege(function(privilege)
		{
			if(privilege==null || privilege.trim()=="0")
				userTemplate.find("#blockUserButton, #unblockUserButton").remove();

			userTemplate.find("a.hide").removeClass("hide");
		});
	}

	function updateUserStatus(id, isOnline)
	{
		if(isOnline)
		{
			onlineList[id]=1;
			$(".content-report #status_"+id).removeClass("content-icon-offline").addClass("content-icon-online");
		}
		else
		{
			delete(onlineList[id]);
			$(".content-report #status_"+id).removeClass("content-icon-online").addClass("content-icon-offline");

		}
	}

	function checkUserStatus(id)
	{
		return onlineList[id]!=null
	}

	function loadReport(reportRowkey)
	{
		if(reportRowkey.indexOf("*")>=0)
		{
			report=InterfaceAccess.loadReportsById(reportRowkey, function(result)
			{
				if(result!=null && result.indexOf("Error")==-1)
				{
					addJsonReport(result);
					if($("#unseenSvg").length==1)
						$("#unseenSvg").click();
				}
			});
		}
		else
		{
			report=InterfaceAccess.findReport(reportRowkey, function(result)
			{
				if(result!=null)
				{
					addJsonReport(result);
					if($("#unseenSvg").length==1)
						$("#unseenSvg").click();
				}
			});
		}
	}

	function loadReports()
	{
		//console.log(users, ",", searchKeywords, ",", getBooleanString(hasCommand), ",", "", ",", "", ",", minImportance, ",", maxImportance, ",", getBooleanString(useUnseenFilter), ",", getBooleanString(!useUnseenFilter), ",", getBooleanString(useImportantFilter), ",", getBooleanString(useImportantFilter), ",", timestamp1, ",", timestamp2, ",", longitude1, ",", latitude1, ",", longitude2, ",", latitude2, ",", startKey, ",", OFFSET);

		if(users!=";")
			InterfaceAccess.loadReportsByArgs(users, getBooleanString(hasCommand), searchKeywords, "", getBooleanString(useUnseenFilter), getBooleanString(!useUnseenFilter), getBooleanString(useImportantFilter), getBooleanString(useImportantFilter), minImportance, maxImportance, timestamp1, timestamp2, longitude1.toString(), latitude1.toString(), longitude2.toString(), latitude2.toString(), "0", startKey, OFFSET, function(reports)
			{

				if(reports!=null && reports.trim()!="")
					if(reports.indexOf("Error")==-1)
					{
						var reportArray=reports.split("<br />");
						for(var i=0; i<reportArray.length; i++)
							if(reportArray[i]!="")
								addJsonReport(reportArray[i]);
					}
					else
					{
						$("#moreDiv").css("display", "block");	

						if(reports.indexOf("Error")>=0)
							$("#moreDiv>a>span").html("لا يمكن الوصول للبيانات, إعادة المحاولة.");
					}

				updateReportCount();
				scrollEnabled=true;
			});
	}
	
	function addJsonReport(jsonReport)
	{
		try
		{
			var report=JSON.parse(jsonReport);
			var locationX;
			var locationY;
			var locationAccuracy;
			var isLocationGps;
			var cgi;
			var siteName;
			var isSeen=false;
			var isImportant=false;
			var comments=report.reportComments;
			var actions=[];

			startKey=report.rowKey;

			if(isLocationGps=(report.gps!=null && report.gps.longitude!=null && report.gps.longitude!=0 && report.gps.latitude!=null && report.gps.latitude!=0))
			{
				
				locationX=report.gps.longitude;
				locationY=report.gps.latitude;
				locationAccuracy=report.gps.accuracy;
			}
			else if(report.cellInfo!=null && report.cellInfo.longitude!=null && report.cellInfo.latitude!=null)
			{
				locationX=report.cellInfo.longitude;
				locationY=report.cellInfo.latitude;
				locationAccuracy=0;
			}
			else
			{
				locationX=locationY=0;
				locationAccuracy=0;
			}

			if(report.cellInfo!=null)
			{
				cgi=report.cellInfo.cgi;
				siteName=report.cellInfo.siteName;
			}
			else
				cgi=siteName="";

			if(report.reportAction!=null)
				for(var j=0; j<report.reportAction.length; j++)
				{
					if(report.reportAction[j].type=="currentSeen")
						isSeen=true;
					else if(report.reportAction[j].type=="currentImportant")
						isImportant=true;
					else if(report.reportAction[j].type!="currentUnimportant" && report.reportAction[j].type!="currentUnseen")
						actions.push(
						{
							type: report.reportAction[j].type,
							timestamp: report.reportAction[j].timestamp
						});
				}

			addReport(report.rowKey, report.realtime, report.importance, report.commandId, report.publisher, report.text, report.timestamp, report.receivedTimestamp, report.provider, locationX, locationY, locationAccuracy, isLocationGps, cgi, siteName, isSeen, isImportant, comments, actions, report.attachments, report.attachmentFiles, report.es);
				
				}
		catch(ex)
		{
			console.log(ex, "source: ", jsonReport);
		}

	}

	function getLimitedString(value)
	{
		if(value.length>SVG_TEXT_LENGTH)
			return value.substring(0, SVG_TEXT_LENGTH);
		else
		{
			var spaces="";
			for(var i=0; i<SVG_TEXT_LENGTH-value.length; i++)
				spaces+="&nbsp;";

			return spaces+value;
		}
	}

	function addReport(rowKey, isRealtime, importance, commandId, publisher, text, timestamp, receivedTimestamp, provider, locationX, locationY, locationAccuracy, isLocationGps, cgi, siteName, isSeen, isImportant, comments, actions, attachments, attachmentFiles, es)
	{
		var publisherSet;
		if(publisher!="")
		{
			publisherSet=setUsers[StropheAccess.getJid(publisher)]; 

			if(publisherSet==null)
			{
				publisherSet=
				{
					setId: SetManager.DELETED_SET_ID,
					setName: sets[SetManager.DELETED_SET_ID].name,
					setLogo: sets[SetManager.DELETED_SET_ID].logo,
					setColor: sets[SetManager.DELETED_SET_ID].color
				};
			}
		}
		else
		{
			publisher="مستخدم إخطار";
			publisherSet=
			{
				setId: es,
				setName: es,
				setLogo: "imgs/user-anonymous.png",
				setColor: "#000"
			};
		}

		var publisherName=publisherSet.name;
		if(publisherName==null || publisherName.trim()=="" || displayJid)
			publisherName=publisher;

		var setId;
		var setName;

		if(manageNode)
		{
			setId=setName=es;
		}
		else
		{
			setId=publisherSet.setId;
			setName=publisherSet.setName;
		}

		//var setNameSvg=getLimitedString(setName);
		var setColor=publisherSet.setColor;
		var setLogo=publisherSet.setLogo;

		var timestampMoment=moment(timestamp).fromNow();
		var receivedTimestampMoment=moment(receivedTimestamp).fromNow();
		var locationAddress;
		var cellCgi;
		var mediaCount=0;
		var locationIcon;
		var addToTop;

		if(rowKey.indexOf("*")>=0)
			addToTop=true;
		else
			addToTop=false;

		if(isLocationGps)
			locationIcon="gps";
		else
			locationIcon="cell";

		if(siteName!=null && siteName!="")
			locationAddress=siteName;
		else
			locationAddress=geoName(locationX, locationY);

		if(cgi!=null && cgi!="")
			cellCgi=cgi;
		else
			cellCgi="لا يوجد";

		var markerId=addMarker("imgs/markers/marker_"+locationIcon+"_"+setColor.substring(1)+".png", "imgs/markers/marker_"+locationIcon+"_shadow.png", locationX, locationY, locationAccuracy, isLocationGps, publisher, publisherName, timestamp, text, importance);

		reportTemplate.attr("id", "report_"+rowKey);
		reportTemplate.attr("data-realtime", isRealtime?"1":"0");
		
		if(commandId!=null && commandId!="" && commandId!="-1")
		{
			reportTemplate.find(reportCommandTemplate).removeClass("hide");
			reportTemplate.find(reportCommandTemplate).find("a").attr("data-command", commandId);
		}
		else
			reportTemplate.find(reportCommandTemplate).addClass("hide");

		//process user link
		var userLink=reportTemplate.find("#userLink");
		if(!userLink.hasClass("cursor-default"))
			userLink.attr("href", "reports.html?id="+publisher)

		userLink.attr("data-tooltip", "<i class='material-icons'>person</i>"+publisher).html(publisherName);

		//process user image
		reportTemplate.find("#userImage").attr("src", setLogo);

		//process panel div
		if(reportTemplate.find("#panelDiv").length>0)
		{
			reportTemplate.find("#panelDiv>#reportsButton").attr("href", "reports.html?id="+publisher);
			reportTemplate.find("#panelDiv>#commandButton").attr("data-user", publisher);
		}
		
		//report info
		reportTemplate.find("#reportLabel").html(text);
		reportTemplate.find("#timestampLabel").attr("data-timestamp", timestamp).attr("data-tooltip", moment(timestamp).format(DATE_ICON_FORMAT)).html(timestampMoment);	
		reportTemplate.find("#receivedTimestampLabel").attr("data-timestamp", receivedTimestamp).attr("data-tooltip", moment(receivedTimestamp).format(DATE_ICON_FORMAT)).html(receivedTimestampMoment);
		reportTemplate.find("#providerLabel").html(provider);	
		
		reportTemplate.find("#locationLink").attr("data-marker", markerId);
		reportTemplate.find("#locationLink>span").html(locationAddress);

		var userStatus=reportTemplate.find("#userImage").next();
		if(userStatus.length>0)
		{
			userStatus.attr("id", "status_"+publisher);

			if(checkUserStatus(publisher))
				userStatus.removeClass("content-icon-offline").removeClass("content-icon-exclamation").addClass("content-icon-online");
			else
				if(publisherSet.available)
					userStatus.removeClass("content-icon-online").removeClass("content-icon-exclamation").addClass("content-icon-offline");	
				else	
					userStatus.removeClass("content-icon-online").removeClass("content-icon-offline").addClass("content-icon-exclamation");	
		}

		if(locationX==0 && locationY==0)
		{
			reportTemplate.find("#locationLink>i").html("location_off");
			reportTemplate.find("#locationLink").removeAttr("href");
		}
		else
		{
			reportTemplate.find("#locationLink").attr("href", "#!");
			if(!isLocationGps)
				reportTemplate.find("#locationLink>i").html("settings_input_antenna");
			else
				reportTemplate.find("#locationLink>i").html("place");
		}

		reportTemplate.find("#setLink").attr("href", "users.html?set="+setId);
                reportTemplate.find("#setLink>span").html(setName);
		//reportTemplate.find("#setSvg>a").attr("xlink:href", "users.html?set="+setId);
		//reportTemplate.find("#setSvg>a>text").html(setNameSvg);

		reportTemplate.find("#cgiLabel").html(cellCgi);
				
		reportTemplate.find("#unseenDiv").html("");

		if(!isSeen)
			reportTemplate.find("#unseenDiv").html(unseenTemplate.get(0).outerHTML);
		

		reportTemplate.css("border-right-color", setColor);

		if(isImportant)
			reportTemplate.find("#importantButton").addClass("stream-button-active");
		else
			reportTemplate.find("#importantButton").removeClass("stream-button-active");
		
		//media processing
		reportTemplate.find(".report-media").html("");
		if((attachmentFiles!=null && attachmentFiles!="") || (attachments!=null && attachments!=""))
		{
			reportTemplate.find(".report-media").html(carouselParent.get(0).outerHTML);
			reportTemplate.find(".report-media+hr").removeClass("hide");
			if(attachmentFiles!=null && attachmentFiles!="")
			{	
				var attachmentArray=attachmentFiles.split(";");
				for(var i=0; i<attachmentArray.length; i++)
					if(attachmentArray[i]!="")
					{
						var seperator=attachmentArray[i].indexOf(':');
						var uri=attachmentArray[i].substring(0,seperator);
						var position=attachmentArray[i].substring(seperator+1);
						mediaCount++;

						carouselTemplate.attr("id", "a_"+hash(uri+"_"+position));
						carouselTemplate.attr("data-title", text);
						carouselTemplate.attr("data-lightbox", "light_"+rowKey);
						carouselTemplate.find(">img").addClass("status-loading").removeClass("status-exclamatin");
						reportTemplate.find("#reportCarousel").append(carouselTemplate.get(0).outerHTML);

						MediaAccess.findMedia(uri, position, function(result)
						{
							var resultUri=result.substring(0,result.indexOf(';'));
							var resultContent=result.substring(result.indexOf(';')+1);
							var imageId=hash(resultUri);

							if(resultContent=="Connection refused (Connection refused)" || resultContent.substring(0,4)=="http")
								$("#a_"+imageId+">img").removeClass('status-loading').addClass('status-exclamation');
							else
							{
								try
								{
									$("#a_"+imageId).attr("href","data:image/png;base64, "+ resultContent);
									$("#a_"+imageId+">img").removeClass("status-loading").attr("src","data:image/png;base64, "+resultContent);
								}
								catch(e)
								{
									$("#a_"+imageId+">img").removeClass("status-loading").addClass("status-exclamation");
									console.log("error fetch media",e);
								}
							}
						});
				}
			}
			else 
			{
				var attachmentArray=attachments.split(";");
				for(var i=0; i<attachmentArray.length; i++)
					if(attachmentArray!="")
					{
						mediaCount++;
						carouselTemplate.attr("id", "a_"+rowKey);
						carouselTemplate.attr("data-title", text);
						carouselTemplate.attr("data-lightbox", "light_"+rowKey);
						carouselTemplate.attr("href", attachmentArray[i]);
						carouselTemplate.find(">img").attr("src", attachmentArray[i]).removeClass("status-loading").removeClass("status-exclamatino");

						reportTemplate.find("#reportCarousel").append(carouselTemplate.get(0).outerHTML);
					}	
			}

			reportTemplate.find("#mediaCountLabel").html(mediaCount);
		}
		else
		{
			reportTemplate.find(".report-madia").html("");	
			reportTemplate.find(".report-media+hr").addClass("hide");
			reportTemplate.find("#mediaCountLabel").html("لا يوجد");
		}

		//comment processing
		reportTemplate.find("#commentDiv").html("");
		if(comments!=null && comments.length>0)
		{
			for(var i=0; i<comments.length; i++)
				reportTemplate.find("#commentDiv").append(getComment(comments[i]));
		}

		//action processing
		reportTemplate.find("#actionDiv").html("");
		if(actions!=null && actions.length>0)
		{
			for(var i=0; i<actions.length; i++)
				reportTemplate.find("#actionDiv").prepend(getAction(actions[i]));
		}

		//command processing
		reportTemplate.find("div.report-comment input[type=text] + Label").attr("for", "commentText_"+rowKey);
		reportTemplate.find("div.report-comment input[type=text]").attr("id", "commentText_"+rowKey);

		//append report
		if(addToTop)
		{
			var scrollTop=$(document).height() - $(window).scrollTop();
			reportParent.prepend(reportTemplate.get(0).outerHTML);

			if($(window).scrollTop()!=0)
				$(document).scrollTop(-scrollTop+$(document).height());
		}
		else
			reportParent.append(reportTemplate.get(0).outerHTML);

		//materialize initalations
		if(mediaCount!=0)
			$("#report_"+rowKey.replace("*", "\\*")+" .carousel").carousel({indicators: true});

		$("#report_"+rowKey.replace("*", "\\*")+" .tooltipped").tooltip({exitDelay: 200});
		

		if($("#liveMapNotificationCheckbox").prop("checked"))
		{
			if($("#reportNav:not(.hide)").length==1)
				$("#reportNav").scrollTop(currentScrollTop+$("#report_"+rowKey.replace("*", "\\*")).height());
			else
				$(window).scrollTop(currentScrollTop+$("#report_"+rowKey.replace("*", "\\*")).innerHeight()+30+2.75);

			LiveNavigation.startNavigation(rowKey, map.getCenter().lng, map.getCenter().lat, map.getZoom())
		}

		return rowKey;
	}

	function addMarker(icon, shadow, locationX, locationY, locationAccuracy, isLocationGps, publisher, publisherName, timestamp, text, importance)
	{
		if(locationX!=0 && locationY!=0)
		{
			var sizePercent=1+(importance/2);
			var iconWidth=25*sizePercent;
			var iconHeight=41*sizePercent;
			var shadowWidth=42*sizePercent;
			var shadowHeight=26*sizePercent;

			var icon = L.icon(
			{
				iconUrl: icon, 
				iconSize: [iconWidth, iconHeight],
				iconAnchor: [iconWidth/2, iconHeight],
				shadowUrl: shadow,
				shadowSize: [shadowWidth, shadowHeight],
				shadowAnchor: [iconWidth/2, shadowHeight],
				popupAnchor: [0, -20 /*-iconHeight/2*/]
			});

			var marker = L.marker([locationY, locationX], {icon: icon});
			var markerText="";
			var locationIcon;

			if(isLocationGps)
				locationIcon="place";
			else
				locationIcon="settings_input_antenna";

			if(publisherName!=null)
				markerText+="<i class='material-icons'>person</i>"+publisherName+"<br>";

			if(publisher!=null)
				markerText+="<i class='material-icons'>phone_android</i>"+publisher+"<br>";
		
			if(timestamp!=null)
				markerText+="<i class='material-icons'>access_time</i>"+moment(timestamp).format(DATE_FORMAT)+"<br>";	

			markerText+="<i class='material-icons'>"+locationIcon+"</i>Y: "+locationY+"<br>";
			markerText+="<i class='material-icons'>"+locationIcon+"</i>X: "+locationX+"<br>";
			markerText+="<i class='material-icons'>"+locationIcon+"</i>A: "+locationAccuracy+"<br>";
			if(text!=null)
				markerText+="<i class='material-icons'>textsms</i>"+text+"<br>";
			marker.bindPopup(markerText).openPopup();
			map.addLayer(marker);

			return marker._leaflet_id;
		}
		else
			return "0";
	}

	function getComment(comment)
	{
		commentTemplate.find(">label>span").html(comment.text);
		commentTemplate.find(">span").attr("data-timestamp", comment.timestamp).attr("data-tooltip", moment(comment.timestamp).format(DATE_ICON_FORMAT)).html(moment(comment.timestamp).fromNow());
		return commentTemplate.get(0).outerHTML;
	}

	function getAction(action)
	{
		switch(action.type)
		{
			case "seen":
				if(action.timestamp!=-1)
				{
					actionTemplate.find(">i").html("visibility");
					actionTemplate.find(">label>span:first").html("تمت المشاهدة");
				}
				else
				{
					actionTemplate.find(">i").html("visibility_off");
					actionTemplate.find(">label>span:first").html("لا يدعم النظام ميزة البلاغات المشاهدة");
				}
			break;
			case "unseen":
				actionTemplate.find(">i").html("visibility_off");
				actionTemplate.find(">label>span:first").html("تم التعيين كغير مقروء");
			break;
			case "important":
				actionTemplate.find(">i").html("star");
				actionTemplate.find(">label>span:first").html("تم التعيين كهام");
			break;
			case "unimportant":
				actionTemplate.find(">i").html("star_outline");
				actionTemplate.find(">label>span:first").html("تم إزالة التعيين كهام");
			break;
			case "export":
				actionTemplate.find(">i").html("cloud_download");
				actionTemplate.find(">label>span:first").html("تم التصدير إلى مستند نصي");
			break;
			default:
				actionTemplate.find(">i").html("info");
				actionTemplate.find(">label>span:first").html("نشاط غير معروف");
			break;
		}

		if(action.timestamp!=-1)
		{
			actionTemplate.find(">label").attr("data-tooltip", moment(action.timestamp).format(DATE_ICON_FORMAT));
			actionTemplate.find(">label>span:last").attr("data-timestamp", action.timestamp).html(" "+moment(action.timestamp).fromNow());
		}
		else
		{
			actionTemplate.find(">label").attr("data-tooltip", "<i class='material-icons'>info</i>البلاغ مرسل قبل إضافة ميزة البلاغات المشاهدة");
			actionTemplate.find(">label>span:last").html("");
		}
		
		return actionTemplate.get(0).outerHTML;
	}

	addReportAction=function addReportAction(reportId, type)
	{
		var reportDiv=$("#report_"+reportId.replace("*", "\\*"));
		reportDiv.find("#actionDiv").prepend(getAction({type: type, timestamp: (new Date()).getTime()}));
		reportDiv.find("#actionDiv>div:first>label").tooltip();

		if(type=="seen")
		{
			reportDiv.find(".content-report-svg").css("opacity", "0");
			setTimeout(function()
			{
				reportDiv.find(".content-report-svg").remove();
			}, 1000);

			increaseUnseenReportCount(-1);
		}
		else if(type=="important")
		{
			reportDiv.find("#importantButton").addClass("stream-button-active");
			increaseImportantReportCount(1);
		}
		else if(type=="unimportant")
		{
			reportDiv.find("#importantButton").removeClass("stream-button-active");
			increaseImportantReportCount(-1);
		}
	}

	function fillSet()
	{
		$("#setSelect").html("");
		for(var key in sets)
			if(sets[key].users.length>0)
			{
				selectOptionTemplate.attr("value", key);
				selectOptionTemplate.attr("data-icon", sets[key].logo);
				selectOptionTemplate.html(sets[key].name);
				$("#setSelect").append(selectOptionTemplate.get(0).outerHTML);
			}
	}

	function updateReportCount()
	{
		$("#totalReportCountLabel>span").html($(".content-report").length);
		$("#importantReportCountLabel>span").html($(".stream-button-active").length);
		$("#unseenReportCountLabel>span").html($(".content-report-svg").length);
	}

	function increaseReportCount(amount)
	{
		var count=$("#totalReportCountLabel>span").html();
		$("#totalReportCountLabel>span").html(parseInt(count)+amount);
	}

	function increaseImportantReportCount(amount)
	{
		var count=$("#importantReportCountLabel>span").html();
		$("#importantReportCountLabel>span").html(parseInt(count)+amount);
	}

	function increaseUnseenReportCount(amount)
	{
		var count=parseInt($("#unseenReportCountLabel>span").html())+amount;

		if(count<0)
			count=0;
		
		$("#unseenReportCountLabel>span").html(count);
	}

	function isLocationOnMap(longitude, latitude)
	{
		if($("#mapLockCheckbox").prop("checked"))
		{
			var bounds=map.getBounds();

			longitude1=bounds._northEast.lng;
			latitude1=bounds._northEast.lat;
			longitude2=bounds._southWest.lng;
			latitude2=bounds._southWest.lat;
			//console.log(longitude1, longitude, longitude2, latitude1, latitude, latitude2);
			return longitude>=longitude2 && longitude<longitude1 && latitude>=latitude2 && latitude<latitude1;
		}
		else
			return true;
	}

	function getBooleanString(value)
	{
		if(value)
			return "1";
		else
			return "0";
	}

	function joinQuery(text1, text2)
	{
		var result;
		if(text1=="")
			result=text2;
		else
			result=text1+" و"+text2;

		result+=", ";
		return result;
	}

	function hash(s)
	{
		var a = 1, c = 0, h, o;
		if (s) 
		{
			a = 0;
			for (h = s.length - 1; h >= 0; h--) 
			{
			    o = s.charCodeAt(h);
			    a = (a<<6&268435455) + o + (o<<14);
			    c = a & 266338304;
			    a = c!==0?a^c>>21:a;
			}
		}

		return String(a);
	}

	function toggleViewMode()
	{
		setupViewMode($("#mainContentDiv").hasClass("hide"));
	}

	function hideStatisticsDiv()
	{
		$("#floatStatisticsDiv").addClass("hide")
	}

	function setupViewMode(miniMapMode)
	{
		if(miniMapMode)
		{
			$(window).scroll(scrollWindow);
			$("#reportNav").off("scroll", scrollReportNav).addClass("hide");

			if($("#assistanceDiv #filterDiv").length==0)
				$("#filterDiv").appendTo("#assistanceDiv>.content-filter");
		
			if($("#assistanceDiv #statisticsDiv").length==0)
				$("#statisticsDiv").appendTo("#assistanceDiv>.content-filter");

			if($("#dataDiv>div").length==0)
				$("#reportNav>div").appendTo($("#dataDiv"));

			if($("#mapDiv #map").length==0)
				$("#map").appendTo("#mapDiv>.content-map>div:first");

			$("#mapExtraSettingDiv>#mapExtraControlSettingDiv>label").addClass("tooltipped").prependTo($("#mapConfigDiv>.left")).each(function()
			{
				$(this).find("span:last").remove();
			});

			$("#mapExtraSettingDiv>#mapExtraViewSettingDiv>label").addClass("tooltipped").appendTo($("#mapConfigDiv>.right")).each(function()
			{
				$(this).find("span:last").remove();
			});

			$(".fixed-action-btn").css("right" ,"100px");
			$("#mainContentDiv, #filterDiv>.content-header").removeClass("hide");
			$("#filterButton, #statisticsButton, #mapSettingButton, #mapExtraSettingDiv, .sidenav-button").addClass("hide");
			$("#map").off("click", "hideStatisticsDiv").css("position", "relative").css("height", "calc(-80px + 100vh)");
			unseenTemplate.find("text").attr("x", "30");
			$("#unseenSvg text").attr("x", "30");

			LiveNavigation.setContainerList($("html"));
		}
		else
		{
			$(window).off("scroll", scrollWindow);
			$("#reportNav").scroll(scrollReportNav).removeClass("hide");

			if($("#filterModal #filterDiv").length==0)
				$("#filterDiv").appendTo("#filterModal>.modal-content");

			if($("#floatStatisticsDiv #statisticsDiv").length==0)
				$("#statisticsDiv").appendTo($("#floatStatisticsDiv"));

			if($("#reportNav>div").length==0)
				$("#dataDiv>div").appendTo("#reportNav")
			
			if($("body>#map").length==0)
				$("#map").appendTo("body")

			$("#mapConfigDiv>.left>label").removeClass("tooltipped").tooltip("destroy").appendTo($("#mapExtraSettingDiv>#mapExtraControlSettingDiv")).each(function()
			{
				$(this).append("<span>"+$(this).attr("data-tooltip")+"</span>");
			});

			$("#mapConfigDiv>.right>label").removeClass("tooltipped").tooltip("destroy").appendTo($("#mapExtraSettingDiv>#mapExtraViewSettingDiv")).each(function()
			{
				$(this).append("<span>"+$(this).attr("data-tooltip")+"</span>");
			});

			$(".fixed-action-btn").css("right" ,"calc(100vw - 75px)");
			$("#mainContentDiv, #filterDiv>.content-header").addClass("hide");
			$("#filterButton, #statisticsButton, #mapSettingButton, #mapExtraSettingDiv, .sidenav-button").removeClass("hide");
			$("#map").click(hideStatisticsDiv).css("position", "fixed").css("top", "0").css("left", "0").css("height", "100%");

			unseenTemplate.find("text").attr("x", "10");
			$("#unseenSvg text").attr("x", "10");

			LiveNavigation.setContainerList($("#reportNav"));
		}

		map.invalidateSize();
		$(".tooltipped").tooltip();
	}

	//events region
	StropheAccess.connected(function()
	{
		if(queryUser!=null)
		{
			var jid=StropheAccess.getJid(queryUser);


			StropheAccess.getLastActivity(jid, function(activity)
			{
				var seconds=$(activity).find("query").attr("seconds");
				var lastActivityStatement="آخر نشاط";

				if(seconds!=null)
				{
					if(seconds<0)
					{
						seconds*=-1;
						lastActivityStatement="اسثنائياً, "+lastActivityStatement;
					}

					var timestamp=(new Date()).getTime() - (seconds * 1000);
					$("#userActivity").removeClass("red-text").addClass("orange-text").attr("data-timestamp", timestamp).attr("data-tooltip", moment(timestamp).format(DATE_ICON_FORMAT)).html(lastActivityStatement + " " + moment(timestamp).fromNow()).tooltip();;
				}
				else
					$("#userActivity").removeClass("orange-text").removeClass("green-text").addClass("red-text").attr("data-timestamp", "0").attr("data-tooltip", "لا يمكن قراءة حالة المستخدم").html("لا يوجد معلومات");;
	
			});

			if(setUsers[jid]==null && $("#userReportCount").html()!="0")
				StropheAccess.saveRosterItem(jid, "", SetManager.DELETED_SET_ID);	
		}
	});

	StropheAccess.rosterUpdated(function(event, jid)
	{
		console.log("updated: ", queryUser, jid);
		setUsers=SetManager.getUsers();
		sets=SetManager.getSet();

		if(queryUser==Strophe.getNodeFromJid(jid))
			setupUserCard();
	});

	StropheAccess.presenceReceived(function(event, from, type)
	{
		if(queryUser==Strophe.getNodeFromJid(from))
			if(type=="subscribed" && $("#userSubscribeButton").length==1)
			{
				M.toast({html: "<i class='material-icons'>check_circle</i>تم مصادقة الحالة بنجاح.", classes: "toast-success"});
				$("#userSubscribeButton").css("display", "none");
				$("#userCommandButton").css("display" ,"");

				$("#userStatus").removeClass("content-icon-exclamation").removeClass("content-icon-offline").addClass("content-icon-online");
				$("#userActivity").removeClass("orange-text").removeClass("red-text").addClass("green-text").attr("data-tooltip", "متصل الآن").attr("data-timestamp", "0").html("متصل");
			}
			else if(type=="unavailable")
			{
				var timestamp=(new Date()).getTime();
				$("#userStatus").removeClass("content-icon-exclamation").removeClass("content-icon-online").addClass("content-icon-offline");
				$("#userActivity").removeClass("green-text").removeClass("red-text").addClass("orange-text").attr("data-tooltip", moment(timestamp).format(DATE_ICON_FORMAT)).attr("data-timestamp", timestamp).html("متصل منذ ثوان.");
			}
			else
			{
				$("#userStatus").removeClass("content-icon-exclamation").removeClass("content-icon-offline").addClass("content-icon-online");
				$("#userActivity").removeClass("orange-text").removeClass("red-text").addClass("green-text").attr("data-tooltip", "متصل الآن").attr("data-timestamp", "0").html("متصل");
			}
		
		updateUserStatus(Strophe.getNodeFromJid(from), type==null);
	});

	StropheAccess.messageReceived(function(event, id, publisher, es, text, timestamp, receivedTimestamp, commandId, importance, location, cell, provider, keywords, attachments)
	{
		console.log(id, publisher, es, text, timestamp, receivedTimestamp, commandId, importance, location, cell, provider, keywords, attachments);
		var locationX=0;
		var locationY=0;
		var locationAccuracy=0;
		var isLocationGps=false;
		var cgi="";
		var siteName="";
		var date=new Date(timestamp);
		var type;

		if(location!=null && location.x!=null && location.y!=null)
		{
			locationX=location.x;
			locationY=location.y;
			locationAccuracy=location.accuracy;
			isLocationGps=true;
		}
		else if(cell!=null && cell.cellX!=null && cell.cellY!=null)
		{
			locationX=cell.cellX;
			locationY=cell.cellY;
		}

		if(cell!=null)
		{
			cgi=cell.cgi;
			siteName=cell.siteName;
		}

		if((!$("#mapLockCheckbox").prop("checked") || isLocationOnMap(locationX, locationY)) &&
			(users=="" || users.indexOf(publisher)>0) &&
			(searchKeywords=="" || searchKeywords.split(" ").some(r=> keywords.split(" ").includes(r))) &&
			(timestamp1==0 || timestamp>=timestamp1) &&
			(timestamp2==0 || timestamp<timestamp2) &&
			!useImportantFilter && !useUnseenFilter &&
			(!hasCommand || (commandId!="-1" && commandId!=null)) &&
			((minImportance==0 && maxImportance==0) || (importance>=minImportance && importance<maxImportance)))
		{
			$("#alarmImage").addClass("rotating").removeClass("hide").css("opacity", "1");
			setTimeout(function()
			{
				$("#alarmImage").removeClass("rotating").addClass("hide").css("opacity", "1");
			}, 1000);
	
			//stop autoscrolling
			if($("#reportNav:not(.hide)").length==1)	
				currentScrollTop=$("#reportNav").scrollTop();
			else
				currentScrollTop=$(window).scrollTop();

			//add report
			reportId=addReport(id, true, importance, commandId, publisher, text, timestamp, receivedTimestamp, provider, locationX, locationY, locationAccuracy, isLocationGps, cgi, siteName, false, false, null, null, attachments, null, es)

			increaseReportCount(1);
			increaseUnseenReportCount(1);

		}
	});
});

var addReportAction;
