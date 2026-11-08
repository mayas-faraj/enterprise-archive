var map;
$(document).ready(function()
{
	//constant variables region
	var OFFSET=10;
	var DATE_ICON_FORMAT="[<i class='material-icons'>date_range</i>]DD-MM-YYYY [<i class='material-icons'>access_time</i>]HH:mm:ss";
	var DATE_FORMAT="DD-MM-YYYY HH:mm:ss";
	var SVG_TEXT_LENGTH=19;

	//tempate parsing
	var reportTemplate=$("#reportDiv");
	var reportParent=reportTemplate.parent();

	var carouselTemplate=reportTemplate.find("#reportCarousel>a:first");
	var carouselParent=carouselTemplate.parent();

	var commentTemplate=reportTemplate.find("#commentDiv>div:first");
	var actionTemplate=reportTemplate.find("#actionDiv>div:first");

	var userTemplate=$("#userDiv");
	var selectOptionTemplate=$("#setSelect>option");

	//leaflet map initialization
	var satelliteLayer=L.tileLayer('./assests/2017imgs/{z}/{x}/{y}.jpg', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, reuseTitles: true});
	var streetOpacityLayer=L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, resuseTiles: true, opacity:0.5});
	var streetLayer=L.tileLayer('./assests/streetsimgs/{z}/{x}/{y}.png', {minZoom: 7, zoomSnap: .5, zoomDelta: .25, maxZoom: 18,  maxNativeZoom: 16, minNativeZoom: 8, resuseTiles: true});

	var northEast=L.latLng(37.7, 43.2);
	var southWest=L.latLng(31.94, 33.97);

	map=L.map('map',
	{
		maxBounds: L.latLngBounds(southWest, northEast),
		center:[34.8,38.5],
		zoom: 7,
		zoomSnap: 0.1,
		layers: [satelliteLayer, streetOpacityLayer]
	});

	//variable region
	var sets=SetManager.getSet();
	var setUsers=SetManager.getUsers();
	var startKey="";
	var users;
	var keywords;
	var minImportance;
	var maxImportance;
	var useUnseenFilter;
	var useImportantFilter;
	var hasCommand;
	var fromTime;
	var toTime;
	var date1;
	var date2;
	var longitude1;
	var latitude1;
	var longitude2;
	var latitude2;

	//request variable and initialization
	var queryUser=Master.getVariable("id");

	var schema=Master.getVariable("schema");

	if(schema==null)
	{
		reportTemplate.remove();

		//initial functions
		$(window).scrollTop(0);
		moment.locale("ar-ly");
		$("#totalReportCountLabel>span").html("0");
		$("#unseenReportCountLabel>span").html("0");
		$("#importantReportCountLabel>span").html("0");
		parseCondition();
		loadReports();

		if(queryUser==null)
		{
			userTemplate.remove();
			$("#filterDiv li:nth-child(2)>.collapsible-header>span").html(SetManager.getSetInfo().theType);
			fillSet();
		}
		else
		{
			$("#filterDiv li:nth-child(2)").remove();

			var userInfo=setUsers[StropheAccess.getJid(queryUser)];
			if(userInfo==null)
			{
				userInfo=SetManager.getEmptyUser();
				userTemplate.find("#userMessageButton, #userMapButton, #userAccessButton").css("display", "none");
			}
			else
			{
				if(userInfo.available)
					userTemplate.find("#userMessageButton").attr("href", "commands.html?u="+queryUser);
				else
					userTemplate.find("#userMessageButton").remove();
				userTemplate.find("#userNavigationButton").attr("href", "navigation.html?id="+queryUser);
				userTemplate.find("#userAccessButton").attr("href", "access.html?id="+queryUser);
			}

			var userName=userInfo.name;
			var userSetId=userInfo.setId;
			var userSetName=userInfo.setName;
			var userSetColor=userInfo.setColor;
			var userSetLogo=userInfo.setLogo;

			userTemplate.find("h5").html(userName);
			userTemplate.find("#userId").html(queryUser);
			userTemplate.find("#userSet").html(userSetName);
			userTemplate.find("img").attr("src", userSetLogo);
			userTemplate.css("border-right-color", userSetColor);
		}
	}

	//materialize initialization
	$(".collapsible").collapsible({accordion: false});
	$("select").formSelect();
	$(".carousel").carousel({indicators: true});
	$(".tooltipped").tooltip();
	$(".fixed-action-btn").floatingActionButton();
	$(".datepicker").datepicker();
	$(".timepicker").timepicker();
	$("#viewModal").modal();
	$("#visibilityModal, #exportModal").modal(
	{
		onOpenStart: function(modal)
		{
			$(modal).find("span").text($(".report-box").length);
		}
	});

	$("#commandModal").modal(
	{
		onOpenStart: function(modal, trigger)
		{
			var commandKey=$(trigger).attr("data-command");
			$(modal).find(">.modal-footer>a:first").attr("href", "commands.html?c="+commandKey);
			InterfaceAccess.loadCommands("", "", "", commandKey, "1", function(result)
			{
				try
				{
					var commandObject=JSON.parse(result);
					$(modal).find("p").html(commandObject.text);
				}
				catch(ex)
				{
					$(modal).find("p").html(ex);
					console.log(ex);
				}
			});
		}
	});

	//event region
	$("#searchButton").click(function()
	{
		startKey="";
		
		$(".content-report").remove();
		for(var layerId in map._layers)
			if(map._layers[layerId]._url==null)
				map.removeLayer(map._layers[layerId]);

		parseCondition();
		loadReports();
	});

	$("#resetSearchButton").click(function()
	{
		$("#searchText").val("");
		$("#searchMapCheckbox, #unseenReportsCheckbox, importantReportsCheckbox, replayReportsCheckbox").prop("checked", false);
		$("#searchFromDate, #searchToDate").val("").datepicker();
		$("#searchFromTime, #searchToTime").val("").timepicker();
		$("#setSelect").val([]).formSelect();
	});

	$(document).on("click", ".locationing", function()
	{
		var markerId=$(this).attr("data-marker");
		if(markerId!=0)
			map.flyTo(map._layers[markerId].openPopup()._latlng, 14);

	});

	$("#showDetialCheckbox, #showCommentCheckbox, #showMediaCheckbox, #showActionCheckbox").change(function()
	{
		var elementClass=$(this).attr("data-target");
		var display;

		if($(this).prop("checked"))
			display="block";
		else
			display="none";

		$("."+elementClass).css("display", display);
	});

	$("#seenAllButton").click(function()
	{
		$(".report-new").click();
	});

	$("#exportAllButton").click(function()
	{
	});

	$(document).on("click", ".content-report #actionButton" ,function()
	{
		var report=$(this).parent().parent().parent();
		if(report.find(".report-action").hasClass("hide"))
			report.find(".report-action").removeClass("hide");
		else
			report.find(".report-action").addClass("hide");
	});

	$(document).on("click" ,".content-report-svg", function()
	{
		var report=$(this).parent().parent().parent().parent().parent();
		var reportId=report.attr("id").substring(7);
		var isRealtime=report.attr("data-realtime");
		var timestamp=(new Date()).getTime();

		InterfaceAccess.setReportSeen(reportId, isRealtime, "1", timestamp,function(resultId)
		{
			console.log("set seen: "+resultId);
			if(resultId!=null && resultId!="")
			{
				var reportDiv=$("#report_"+resultId);
				reportDiv.find(".content-report-svg").css("opacity", "0");
				reportDiv.find("#actionDiv").prepend(getAction({type: "seen", timestamp: (new Date()).getTime()}));
				reportDiv.find(".report-action").css("display", "");
				reportDiv.find("#actionDiv>div:fisrt>label").tooltip();
			}
		});
	});

	$(document).on("click", ".content-report #commentButton" ,function()
	{
		var report=$(this).parent().parent().parent();
                var reportId=report.attr("id").substring(7);
                var isRealtime=report.attr("data-realtime");			
		var timestamp=(new Date()).getTime();

		var commentText=report.find("div.report-comment input[type=text]");
		console.log("commenting...", reportId, commentText.val());

		if(commentText.val()!="")
		{
			InterfaceAccess.saveReportComment(reportId, isRealtime, commentText.val(), timestamp, function(resultId)
			{
				console.log("comment save result: ", resultId);
				var reportDiv=$("#report_"+resultId);
				var reportText=reportDiv.find("div.report-comment input[type=text]");

				reportDiv.find("#commentDiv").append(getComment({text: reportText.val(), timestamp: timestamp}));
				reportDiv.find("#commentDIv>div:last>span").tooltip();
				reportText.val("");

			});
		}
		else
		{
					
		}
	});

	$(document).on("click", ".content-report #commentDiv .button-close", function()
	{
		var report=$(this).parent().parent().parent().parent();
		var commentDiv=$(this).parent().parent();
		var reportId=report.attr("id").substring(7);
		var isRealtime=report.attr("data-realtime");
		var timestamp=$(this).parent().parent().find("span.timer").attr("data-timestamp");
console.log(reportId, timestamp);
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
		var isRealtime=report.attr("data-realtime");
		var timestamp=(new Date()).getTime();

		if($(this).hasClass("stream-button-active"))
			InterfaceAccess.setReportImportant(reportId, isRealtime, "0", timestamp, function(resultId)
			{
				console.log("set unimportant: "+resultId);
				if(resultId!=null && resultId!="")
				{
					var reportDiv=$("#report_"+resultId);
					reportDiv.find("#importantButton").removeClass("stream-button-active");
					reportDiv.find("#actionDiv").prepend(getAction({type: "unimportant", timestamp: (new Date()).getTime()}));
					reportDiv.find(".report-action").css("display", "");
					reportDiv.find("#actionDiv>div:first>label").tooltip();
				}
			});
		else
			InterfaceAccess.setReportImportant(reportId, isRealtime, "1", timestamp, function(resultId)
			{
				console.log("set important: "+resultId);
				if(resultId!=null && resultId!="")
				{
					var reportDiv=$("#report_"+resultId);
					reportDiv.find("#importantButton").addClass("stream-button-active");
					reportDiv.find("#actionDiv").prepend(getAction({type: "important", timestamp: (new Date()).getTime()}));
					reportDiv.find(".report-action").css("display", "");
					reportDiv.find("#actionDiv>div:first>label").tooltip();
				}
			});
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

	$("#fullMapButton").click(function()
	{
		if($("#filterDiv").css("display")=="none")
			$("#filterDiv").css("display", "block");
		else
			$("#filterDiv").css("display", "none");

		if($("#reportListDiv").css("display")=="none")
			$("#reportListDiv").css("display", "block");
		else
			$("#reportListDiv").css("display", "none");

		if($("#mapDiv").hasClass("l5"))
			$("#mapDiv").removeClass("l5").removeClass("pull-l5").addClass("l12");
		else
			$("#mapDiv").removeClass("l12").addClass("pull-l5").addClass("l5");
	});

	$("#mergeMapRadio").click(function()
	{		
		console.log('xxxxxxxxxxxx');
		map.removeLayer(streetLayer).removeLayer(satelliteLayer).addLayer(streetOpacityLayer);
		console.log("sssssss");
	});

	$("#streetMapRadio").click(function()
	{
		map.removeLayer(streetOpacityLayer).removeLayer(satelliteLayer).addLayer(streetLayer);
	});

	$("#satteliteMapRadio").click(function()
	{
		map.removeLayer(streetOpacityLayer).removeLayer(streetLayer).addLayer(satelliteLayer);
	});

	$(window).scroll(function()
	{
		if($(this).scrollTop() + $(this).innerHeight() >= $(document).height())
                {
			console.log("fetching from: "+startKey);
			loadReports();
                }
	
	});

	setInterval(function()
	{
		$(".timer").each(function()
		{
			var timestamp=$(this).attr("data-timestamp");
			if(timestamp!=null)
				$(this).html(moment(parseInt(timestamp)).fromNow());
		});
	}, 60000);

	function parseCondition()
	{
		var queryString="";
		users="";
		if(queryUser!=null)
		{
			queryString=joinQuery(queryString, "الخاصة بالمستخدم "+queryUser);
			users=queryString;
		}
		else if($("#setSelect").val().length>0 && $("#setSelect").val().length!=$("#setSelect>option").length)
		{
			var selectedSet=$("#setSelect").val();
			var setNames="";
	
			for(var i=0; i<selectedSet.length; i++)
			{
				for(var j=0; j<sets[selectedSet[i]].users.length; j++)
					users+=Strophe.getNodeFromJid(sets[selectedSet[i]].users[j].jid)+";";
				setNames+=sets[selectedSet[i]].name;
			}

			queryString=joinQuery(queryString, "الخاصة بمستخدمي "+SetManager.getSetInfo().theTypes + setNames);
		}


		keywords=$("#searchText").val();
		if(keywords!="")
			queryString=joinQuery(queryString, "التي تحوي الكلمة ("+keywords+")");
		
		var importanceText="";
		if($("#allImportantRadio").prop("checked"))
		{
			minImportance=$("#allImportantRadio").attr("data-min-importance");
			maxImportance=$("#allImportantRadio").attr("data-max-importance");
			importanceText=$("#allImportantRadio").html();
		}
		else if($("#allImportantRadio").prop("checked"))
		{
			minImportance=$("#normalImportantRadio").attr("data-min-importance");
			maxImportance=$("#normalImportantRadio").attr("data-max-importance");
			importanceText=$("#normalImportantRadio").html();
		}
		else if($("#allImportantRadio").prop("checked"))
		{
			minImportance=$("#importantRadio").attr("data-min-importance");
			maxImportance=$("#importantRadio").attr("data-max-importance");
			importanceText=$("#importantRadio").html();
		}
		else if($("#allImportantRadio").prop("checked"))
		{
			minImportance=$("#extremelyImportantRadio").attr("data-min-importance");
			maxImportance=$("#extremelyImportantRadio").attr("data-max-importance");
			importanceText=$("#extremelyImportantRadio").html();
		}

		if(minImportance!=0 || maxImportance!=0)
			queryString=joinQuery(queryString, "التي تم تقييم النظام درجة أهميتها كـ("+$("#importanceButton>span").text()+")");

			useUnseenFilter=$("#unseenReportsCheckbox").prop("checked");
			if(useUnseenFilter)
				queryString=joinQuery(queryString, "التي لم تتم مشاهدتها");

			useImportantFilter=$("#importantReportsCheckbox").prop("checked")
			if(useImportantFilter)
				queryString=joinQuery(queryString, "التي تم تعيينها كهامة");

			hasCommand=$("#replayReportsCheckbox").prop("checked");
			if(hasCommand)
				queryString=joinQUery(queryString, "المرسلة رداً على أمر");

			if($("#searchFromTime").val()!="")
				fromTime=$("#searchFromTime").val();
			else
				fromTime="";

			if($("#searchToTime").val()!="")
				toTime=$("#searchToTime").val();
			else
				toTime="23:59:59";

			if($("#searchFromDate").val()!="")
				date1=DateProcessor.formatDate(new Date($("#searchFromDate").val()+" "+fromTime));
			else
				date1="";

			if($("#searchToDate").val()!="")
				date2=DateProcessor.formatDate(new Date($("#searchToDate").val()+" "+toTime));
			else
				date2="";

			if(date1!="")
				queryString=joinQuery(queryString, "التي تم استقبالها بعد تاريخ "+date1);

			if(date2!="")
				queryString=joinQuery(queryString, "تاريخ استقبالها قبل "+date2);

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

		function loadReports()
		{
			console.log(users, ",", keywords, ",", getBooleanString(hasCommand), ",", "", ",", "", ",", minImportance, ",", maxImportance, ",", getBooleanString(useUnseenFilter), ",", getBooleanString(!useUnseenFilter), ",", getBooleanString(useImportantFilter), ",", getBooleanString(useImportantFilter), ",", date1, ",", date2, ",", longitude1, ",", latitude1, ",", longitude2, ",", latitude2, ",", startKey, ",", OFFSET);

			InterfaceAccess.loadReportsByArgs(users, getBooleanString(hasCommand), "", keywords, "", getBooleanString(useUnseenFilter), getBooleanString(!useUnseenFilter), getBooleanString(useImportantFilter), getBooleanString(useImportantFilter), minImportance, maxImportance, date1, date2, longitude1.toString(), latitude1.toString(), longitude2.toString(), latitude2.toString(), "1", startKey, OFFSET, function(reports)
		{
			var reportCount=parseInt($("#totalReportCountLabel>span").html());
			var unseenCount=parseInt($("#unseenReportCountLabel>span").html());
			var importantCount=parseInt($("#importantReportCountLabel>span").html());

			console.log(reports);
			if(reports!=null && reports.trim()!="")
			{
				var reportArray=reports.split("<br />");
				for(var i=0; i<reportArray.length; i++)
					if(reportArray[i]!="")
					{
						try
						{
							var report=JSON.parse(reportArray[i]);
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
										actions.push({
											type: report.reportAction[j].type,
											timestamp: report.reportAction[j].timestamp
											});
								}

							addReport(report.rowKey, report.realtime, report.importance, report.commandId, report.publisher, report.text, report.timestamp, report.receivedTimestamp, report.provider, locationX, locationY, locationAccuracy, isLocationGps, cgi, siteName, isSeen, isImportant, comments, actions, report.attachments, report.attachmentFiles);
								
							reportCount++;
							if(isImportant)
								importantCount++;
							if(!isSeen)
								unseenCount++;

							$("#totalReportCountLabel>span").html(reportCount);
							$("#importantReportCountLabel>span").html(importantCount);
							$("#unseenReportCountLabel>span").html(unseenCount);
						}
						catch(ex)
						{
							console.log(ex, "source: ", reportArray[i]);
						}
					}
			}
		});
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

	function addReport(rowKey, isRealtime, importance, commandId, publisher, text, timestamp, receivedTimestamp, provider, locationX, locationY, locationAccuracy, isLocationGps, cgi, siteName, isSeen, isImportant, comments, actions, attachments, attachmentFiles)
	{
		var publisherSet=setUsers[StropheAccess.getJid(publisher)]; 
		if(publisherSet==null)
			publisherSet=SetManager.getEmptyUser();	

		var publisherName=publisherSet.name;
		var setId=publisherSet.setId;
		var setName=publisherSet.setName;
		//var setNameSvg=getLimitedString(setName);
		var setColor=publisherSet.setColor;
		var setLogo=publisherSet.setLogo;

		var timestampMoment=moment(timestamp).fromNow();
		var receivedTimestampMoment=moment(receivedTimestamp).fromNow();
		var locationAddress;
		var cellCgi;
		var mediaCount=0;
		var mediaCountText="لا يوجد";
		var locationIcon;

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

		var markerId=addMarker("imgs/markers/marker_"+setColor.substring(1)+".png", locationX, locationY, locationAccuracy, isLocationGps, publisher, publisherName, timestamp, text);

		reportTemplate.attr("id", "report_"+rowKey);
		reportTemplate.attr("data-realtime", isRealtime?"1":"0");
		
		if(commandId!=null && commandId!="" && commandId!="-1")
		{
			reportTemplate.find("#commandLabel").removeClass("hide");
			reportTemplate.find("#commandLabel>a").attr("data-command", commandId);
		}
		else
			reportTemplate.find("#commandLabel").addClass("hide");

		reportTemplate.find("#userLink").attr("href", "reports.html?id="+publisher).attr("data-tooltip", "<i class='material-icons'>person</i>"+publisher).html(publisherName);
		reportTemplate.find("#userImage").attr("src", setLogo);
		reportTemplate.find("#reportLabel").html(text);
		reportTemplate.find("#timestampLabel").attr("data-timestamp", timestamp).attr("data-tooltip", moment(timestamp).format(DATE_ICON_FORMAT)).html(timestampMoment);	
		reportTemplate.find("#receivedTimestampLabel").attr("data-timestamp", receivedTimestamp).attr("data-tooltip", moment(receivedTimestamp).format(DATE_ICON_FORMAT)).html(receivedTimestampMoment);
		reportTemplate.find("#providerLabel").html(provider);	
		
		reportTemplate.find("#locationLink").attr("data-marker", markerId);
		reportTemplate.find("#locationLink>span").html(locationAddress);

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

		reportTemplate.find("#setLink").attr("href", "set.html?id="+setId);
                reportTemplate.find("#setLink>span").html(setName);
		//reportTemplate.find("#setSvg>a").attr("xlink:href", "set.html?id="+setId);
		//reportTemplate.find("#setSvg>a>text").html(setNameSvg);

		reportTemplate.find("#cgiLabel").html(cellCgi);
			
		reportTemplate.find(".content-report-svg").attr("id", "seenSvg_"+rowKey);
		if(isSeen)
			reportTemplate.find(".content-report-svg").addClass("hide");
		else
			reportTemplate.find(".content-report-svg").removeClass("hide");

		//color processor
		//reportTemplate.find("#setSvg>path:nth-child(1)").css("fill", setColor);
		//reportTemplate.find("#setSvg>path:nth-child(2), #setSvg>path:nth-child(3)").css("fill", ColorProcessor.getDarkColor(setColor));
		//reportTemplate.find("#unseenSvg").css("fill", setColor);
		reportTemplate.css("border-right-color", setColor);

		if(isImportant)
			reportTemplate.find("#importantButton").addClass("stream-button-active");
		else
			reportTemplate.find("#importantButton").removeClass("stream-button-active");
		
		//media processing
		reportTemplate.find("#reportCarousel").html("");
		reportTemplate.find(".report-media").css("display", "");
		if(attachmentFiles!=null && attachmentFils!="")
		{	
			var attachmentArray=attachmentFiles.split(";");
			for(var i=0; i<attachmentArray.length; i++)
				if(attachmentArray!="")
				{
					var seperator=attachmentArray[i].indexOf(':');
					var uri=attachmentArray[i].substring(0,seperator);
					var position=attachmentArray[i].substring(seperator+1);
					
					mediaCount++;

					carouselTemplate.attr("id", "a_"+hash(uri+"_"+position));
					carouselTemplate.attr("data-title", text);
					carouselTemplate.attr("data-lightbox", "light_"+rowKey);
					carouselTemplate.find(">img").addClass("status-loading").removeClass("status-exclamatin");

					reportTemplate.find("#reportCarousel").append(carouselTemplate.get(0).outerHtml);

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
		else if(attachments!=null && attachments!="")
		{
			var attachmentArray=attachments.split(";");
			for(var i=0; i<attachmentArray.length; i++)
				if(attachmentArray!="")
				{
					mediaCount++;
					carouselTemplate.attr("id", "a_"+rowKey);
					carouselTemplate.attr("data-title", text);
					carouselTemplate.attr("data-lightbox", "light_"+rowKey);
					carouselTemplate.find(">img").attr("src", "imgs/1.jpg" /*attachmentArray[i]*/).removeClass("status-loading").removeClass("status-exclamatino");

					reportTemplate.find("#reportCarousel").append(carouselTemplate.get(0).outerHTML);
				}	
		}

		if(mediaCount==0)
			reportTemplate.find(".report-media").css("display", "none");
		else
			mediaCountText=mediaCount;

		reportTemplate.find("#mediaCountLabel").html(mediaCountText);

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
			reportTemplate.find(".report-action").css("display" ,"");
			for(var i=0; i<actions.length; i++)
				reportTemplate.find("#actionDiv").prepend(getAction(actions[i]));
		}
		else
			reportTemplate.find(".report-action").css("display" ,"none");

		//command processing
		reportTemplate.find("div.report-comment input[type=text] + Label").attr("for", "commentText_"+rowKey);
		reportTemplate.find("div.report-comment input[type=text]").attr("id", "commentText_"+rowKey);

		//append report
		reportParent.append(reportTemplate.get(0).outerHTML);

		//materialize initalations
		if(mediaCount!=0)
			$("#report_"+rowKey+" .carousel").carousel({indicators: true});

		$("#report_"+rowKey+" .tooltipped").tooltip();
		$("#report_"+rowKey+" .collapsible").collapsible({accordion: false});
	}

	function addMarker(icon, locationX, locationY, locationAccuracy, isLocationGps, id, publisher, timestamp, text)
	{
		if(locationX!=0 && locationY!=0)
		{
			var icon = L.icon({iconUrl: icon, iconSize: [25, 41]});
			var marker = L.marker([locationY, locationX], {icon: icon});
			var markerText="";
			var locationIcon;

			if(isLocationGps)
				locationIcon="place";
			else
				locationIcon="settings_input_antenna";

			if(publisher!=null)
				markerText+="<i class='material-icons'>person</i>"+publisher+"<br>";

			if(id!=null)
				markerText+="<i class='material-icons'>phone_android</i>"+id+"<br>";
		
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
		commentTemplate.find(">span").attr("data-timestamp", comment.timestamp).html(moment(comment.timestamp).fromNow());
		return commentTemplate.get(0).outerHTML;
	}

	function getAction(action)
	{
		switch(action.type)
		{
			case "seen":
				actionTemplate.find(">i").html("visibility");
				actionTemplate.find(">label>span:first").html("تمت المشاهدة");
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

		actionTemplate.find(">label").attr("data-tooltip", moment(action.timestamp).format(DATE_ICON_FORMAT));
		actionTemplate.find(">label>span:last").attr("data-timestamp", action.timestamp).html(" "+moment(action.timestamp).fromNow());
		return actionTemplate.get(0).outerHTML;
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

		$("#setSelect").formSelect();
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

			return longitude>=longitude1 && longitude<longitude2 && latitude>=latitude2 && latitude<latitude1;
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
});
