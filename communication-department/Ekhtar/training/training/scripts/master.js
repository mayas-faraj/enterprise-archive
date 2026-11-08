var DATE_ICON_FORMAT="[<i class='material-icons'>date_range</i>]DD-MM-YYYY [<i class='material-icons'>access_time</i>]HH:mm:ss";
var DATE_FORMAT="DD-MM-YYYY HH:mm:ss";

$(document).ready(function()
{
	var NOTIFICATION_PAGE_LENGTH=7;
	var COMMAND_PAGE_LENGTH=7;

	var notifyAudio=new Audio('audio/attention-required.mp3');
	var name="";
	var connectionManager=null;
	var setUsers=SetManager.getUsers();
	var audio=new Audio();
	var startNotificationKey="";
	var startNotifyCommandKey="";
	var sets=SetManager.getSet();

	moment.locale("ar-ly");

	Master.getHeader(function(header)
   	{
		$("body>div:first").attr("id", "mainContentDiv");
		$("body").prepend(header);
		$(".input-field i").click(function(){$(this).nextAll("input").first().click()});

		$("#fullScreenButton").click(function()
		{
			Master.toggleFullScreen();
		});

		$("#sendReportButton").click(function()
		{
			testMessage(1);
		});

		var notificationDropdownTemplate=$("#notificationDropdown");
		var notificationDropdownItemTemplate=$.extend(true, {}, $("#notificationDropdownItem"));
		var notificationUnseenTemplate=notificationDropdownItemTemplate.find(".notify-unseen");
		var notificationReplayTemplate=notificationDropdownItemTemplate.find("#notificationTextLabel>i");

		var notifyCommandDropdownTemplate=$("#notifyCommandDropdown");
		var notifyCommandDropdownItemTemplate=$.extend(true, {}, $("#notifyCommandDropdownItem"));

		notificationUnseenTemplate.remove();
		notificationReplayTemplate.remove();
		notificationDropdownItemTemplate.remove();
		notificationDropdownItemTemplate.scrollTop(0);

		notifyCommandDropdownItemTemplate.remove();
		notifyCommandDropdownItemTemplate.scrollTop(0);

		loadNotifications();
		loadNotifyCommands();
		
		if(Master.getVariable("img")!=null)
			$(".user-view img").attr("src", "imgs/cover"+Master.getVariable("img")+".jpg");

		InterfaceAccess.countReportsByUnseen("0", function(count)
		{
			if(count.indexOf("Error")>=0)
				count=0;

			Master.updateNotificationCount(count);
		});

		if($("body").attr("id")=="indexPage")
		{
			$('.sidenav').addClass("sidenav-fixed");
			$('.sidenav-toggler').css("cursor", "default")
		}


		//materialize initialization
		$(".navbar-fixed .dropdown-trigger").dropdown({coverTrigger: false, constrainWidth: false, closeOnClick: false});
		$(".sidenav .collapsible").collapsible();
		$(".sidenav").sidenav({edge: 'right'});
		$(".tooltipped").tooltip();
		$("#visibilityAllModal").modal(
		{
			onOpenStart: function(modal)
			{
				$(modal).find("span").text($("#notificationCountLabel").html());
			}

		});

		//special materialize events
		$(".sidenav-toggler").click(function()
		{
			if($("body").attr("id")!="indexPage")
			{
				var target=$(this).attr("data-target");
				var sideNav=$("#"+target);
				audio.src="audio/knob.mp3";
				audio.play();
				
				if(sideNav.length>0)
				{
					var instance=M.Sidenav.getInstance(sideNav);
					if(instance.isOpen)
					{
						$("#mainContentDiv").removeClass("content-blur");
						instance.close();
					}
					else
					{
						$("#mainContentDiv").addClass("content-blur");
						instance.open();
					}
				}
			}
		});

		$(".sidenav-overlay").click(function()
		{
			audio.src="audio/knob.mp3";
			audio.play();
			$("#mainContentDiv").removeClass("content-blur");
		});

		$("#notificationShowMoreLi").click(function()
		{
			loadNotifications();
		});

		$("#visibilityAllButton").click(function()
		{
			InterfaceAccess.setReportsSeen(new Date().getTime(), function(result)
			{
				$(".notify-unseen").remove();
				Master.updateNotificationCount("0");
				//console.log("all seen result: ", result);

				$(".content-report-svg").each(function()
				{
					var reportId=$(this).parent().parent().parent().parent().parent().parent().attr("id").substring(7);
					addReportAction(reportId, "seen");
				});
			});
		});

		$("#notificationDropdown").scroll(function(event)
		{
			if($(this).scrollTop()!=0 && $(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight-5)
			{
				loadNotifications();
			}
		});

		$("#notifyCommandDropdown").scroll(function(event)
		{
			if($(this).scrollTop()!=0 && $(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight-5)
			{
				loadNotifyCommands();
			}
		});
		

		$(document).on("click", ".notify-unseen", function(e)
		{
			e.preventDefault();
			var report=$(this).parent().parent();
			var reportId=report.attr("id").substring(7);
			if($("#report_"+reportId.replace("*", "\\*")+" .content-report-svg").length==1)
				$("#report_"+reportId.replace("*", "\\*")+" .content-report-svg").click();
			else
			{
				var isRealtime=report.attr("data-realtime");
				var timestamp=(new Date()).getTime();
				var callback=function(resultId)
				{
					//console.log("set seen: ", resultId);

					if(resultId!=null && resultId!="")
					{
						$("#notify_"+resultId.replace("*", "\\*")).find(".notify-unseen").remove();
						Master.increaseNotificationCount(-1);
					}
				};

				if(reportId.indexOf("*")>=0)
					InterfaceAccess.setReportSeenById(reportId, "1", timestamp, callback);
                		else
                		{
                        		var isRealtime=report.attr("data-realtime");
					InterfaceAccess.setReportSeen(reportId, isRealtime, "1", timestamp, callback);
               			 }
			}
		});

		$(document).on("click", ".modal-trigger, .datepicker, .timepicker", function()
		{
			//if($(this).hasClass("modal-trigger"))
			$("#mainContentDiv").addClass("content-blur");
			var audio=new Audio("audio/gesture.mp3");
			audio.play();
		});


		$(document).on("click", ".modal-close, .modal-overlay, .datepicker-done, .datepicker-clear, .datepicker-cancel, .timepicker-close, .timepicker-clear", function()
		{
			$("#mainContentDiv").removeClass("content-blur");
			var audio=new Audio();

			if($(this).find(">i").hasClass("green-text"))
				audio.src="audio/Ding Notification.wav";
			else
				audio.src="audio/system-fault.mp3";
			audio.play();
		});

		$("input[data-button], textarea[data-button]").keydown(function(event)
		{
			if(event.keyCode==13)
			{
				var button=$($(this).attr("data-button"));
				button.click();
				event.preventDefault();
				return false;
			}
		});


		$(".set-theTypes, .set-types, .set-types, .set-type").each(function()
		{
			if($(this).hasClass("set-theTypes"))
				$(this).html(SetManager.getSetInfo()["theTypes"]);
			else if($(this).hasClass("set-theType"))
				$(this).html(SetManager.getSetInfo()["theType"]);
			else if($(this).hasClass("set-types"))
				$(this).html(SetManager.getSetInfo()["types"]);
			else if($(this).hasClass("set-type"))
				$(this).html(SetManager.getSetInfo()["type"]);
		});


		setInterval(function()
		{
			$(".timer").each(function()
			{
				var timestamp=$(this).attr("data-timestamp");
				var timetext=$(this).attr("data-timetext");

				if(timetext==null)
					timetext="";
				else
					timetext+=" ";

				if(timestamp!=null && timestamp!="0")
					$(this).html(timetext + moment(parseInt(timestamp)).fromNow());
			});
		}, 60000);			

		//functions region
		function loadNotifyCommands()
		{
			InterfaceAccess.loadCommands("1", "", "0", "0", startNotifyCommandKey, COMMAND_PAGE_LENGTH, function(result)
			{
				if(result!=null && result!="")
					if(result.indexOf("Error")==-1)
					{
						var commands=result.split('<br />');
						for(var i=0; i<commands.length; i++)
							if(commands[i].trim()!="")
							{
								var command=JSON.parse(commands[i]);
								startNotifyCommandKey=command.rowKey;

								var userCount=0;
								var receiverCount=0;

								if(command.readers!=null)
									for(var j=0; j<command.readers.length; j++)
									{
										userCount++;

										if(command.readers[j].timestamp!=0)
											receiverCount++;
									}
								
									addCommandItem(command.rowKey, command.es, command.text, userCount, receiverCount, command.timestamp, false);
							}
					}
					else
						addCommandItem(null, null, "لا يمكن الوصول للبيانات", 0, 0, new Date().getTime(), false);
			});
		}

		function loadNotifications()
		{
			InterfaceAccess.loadReportsNotification(startNotificationKey, NOTIFICATION_PAGE_LENGTH, function(result)
			{
				if(result!=null && result!="")
					if(result.indexOf("Error")==-1)
					{
						var reports=result.split('<br />');
						for(var i=0; i<reports.length; i++)
							if(reports[i].trim()!="")
							{
								var report=JSON.parse(reports[i]);
								startNotificationKey=report.rowKey;

								var isSeen=false;
								var realtime;

								if(report.realtime)
									realtime="1";
								else
									realtime="0";
								if(report.reportAction!=null)
									for(var j=0; j<report.reportAction.length; j++)
										if(report.reportAction[j].type=="currentSeen")
										{
											isSeen=true;
											break;
										}

								addNotificationItem(report.rowKey, report.publisher, report.text, report.timestamp, isSeen, realtime, report.commandId!=null && report.commandId!="-1", false);
							}
					}
					else
						addNotificationItem(null, "نظام إخطار", "لا يمكن الوصول للبيانات", new Date().getTime(), true, true, false, false);
						

				$("#notificationDropdown").scrollTop($("#notificationDropdown").scrollTop()-50);
			});
		}

		function addCommandItem(rowKey, es, text, userCount, receiverCount, timestamp, toTop)
		{
			var setLogo;
			if(sets[es]!=null)
				setLogo=sets[es].logo;
			else
				setLogo=SetManager.getEmptyUser().setLogo;

			if(notifyCommandDropdownTemplate.find("li").length>=200)
				if(toTop)
					notifyCommandDropdownTemplate.find('li.divider:last').prev().remove();
				else
					notifyCommandDropdownTemplate.find('li.divider:first').next().remove();

			if(text.length>=90)
				text=text.substring(0, 90)+"...";

			notifyCommandDropdownItemTemplate.find("#notifyCommandImage").attr("src", setLogo);

			notifyCommandDropdownItemTemplate.find("#notifyCommandDateLabel").html(moment(timestamp).fromNow()).attr("data-timestamp", timestamp).attr("data-tooltip", moment(timestamp).format(DATE_ICON_FORMAT));
			
			notifyCommandDropdownItemTemplate.attr("href", "#!");
			notifyCommandDropdownItemTemplate.attr("id", "notifyCommand_"+rowKey);
			notifyCommandDropdownItemTemplate.find("#notifyCommandTextLabel").html(text);
			notifyCommandDropdownItemTemplate.find(">a").attr("href", "commands.html?c="+rowKey);

			if(receiverCount!=0)
			{
				notifyCommandDropdownItemTemplate.find("#notifyCommandReceiverLabel>span").html(receiverCount);
				notifyCommandDropdownItemTemplate.find("#notifyCommandReceiverLabel").css("display", "");
			}
			else
			{
				notifyCommandDropdownItemTemplate.find("#notifyCommandReceiverLabel").css("cssText", "display:none !important");
			}
				

			if(userCount-receiverCount!=0)
			{
				notifyCommandDropdownItemTemplate.find("#notifyCommandNonReceiverLabel>span").html(userCount-receiverCount);
				notifyCommandDropdownItemTemplate.find("#notifyCommandNonReceiverLabel").css("display", "");
			}
			else
			{
				notifyCommandDropdownItemTemplate.find("#notifyCommandNonReceiverLabel").css("cssText", "display:none !important");
			}

			if(!toTop)
				notifyCommandDropdownTemplate.find("li.divider:last").before(notifyCommandDropdownItemTemplate.get(0).outerHTML);
			else
				notifyCommandDropdownTemplate.find("li.divider:first").after(notifyCommandDropdownItemTemplate.get(0).outerHTML);

			$("#notifyCommand_"+rowKey + " .tooltipped").tooltip();

		}

		function addNotificationItem(rowKey, publisher, text, timestamp, isSeen, realtime, hasCommand, toTop)
		{
			if(publisher!=null)
			{
				var id=StropheAccess.getJid(publisher);
				var userInfo=setUsers[id];
				var name;
				var logo;

				if(userInfo==null)
				{
					name=publisher;
					logo=SetManager.getEmptyUser().setLogo;
				}
				else
				{
					name=userInfo.name;
					logo=userInfo.setLogo;
				}

				if(notificationDropdownTemplate.find('li').length>=200)
					if(toTop)
						notificationDropdownTemplate.find('li.divider:last').prev().remove();
					else
						notificationDropdownTemplate.find('li.divider:first').next().remove();

				var date="";

				notificationDropdownItemTemplate.find("#notificationUserImage").css("visibility", "visible");
				notificationDropdownItemTemplate.find("#notificationUserImage").attr("src", logo);

				if(timestamp!=null)
				{
					notificationDropdownItemTemplate.find("#notificationDateLabel").html(moment(timestamp).fromNow()).attr("data-timestamp", timestamp).attr("data-tooltip", moment(timestamp).format(DATE_ICON_FORMAT));
				}

				notificationDropdownItemTemplate.find("#notificationUserLabel").html(name);
			}
			else
			{
				notificationDropdownItemTemplate.find("#notificationUserImage").css("visibility", "hidden");
				notificationDropdownItemTemplate.find("#notificationDateLabel").html("");
			}

			if(text.length>=90)
				text=text.substring(0, 90)+"...";

			notificationDropdownItemTemplate.attr("href", "#!");
			notificationDropdownItemTemplate.attr("id", "notify_"+rowKey);
			notificationDropdownItemTemplate.attr("data-realtime", realtime);
			notificationDropdownItemTemplate.find("#notificationTextLabel>span").html(text);

			if(hasCommand)
				notificationDropdownItemTemplate.find("#notificationTextLabel").prepend(notificationReplayTemplate);
			else
				notificationDropdownItemTemplate.find("#notificationTextLabel").find(notificationReplayTemplate).remove();

			notificationDropdownItemTemplate.find(">a").attr("href", "reports.html?r="+rowKey);

			if(!isSeen)
				notificationDropdownItemTemplate.find(".notify-time").after(notificationUnseenTemplate);
			else
				notificationDropdownItemTemplate.find(".notify-unseen").remove();

			if(!toTop)
				notificationDropdownTemplate.find("li.divider:last").before(notificationDropdownItemTemplate.get(0).outerHTML);
			else
				notificationDropdownTemplate.find("li.divider:first").after(notificationDropdownItemTemplate.get(0).outerHTML);

			$("#notify_"+rowKey+" .tooltipped").tooltip();
			var messageToken=publisher+';'+text+';'+timestamp;
		}

		//events area
		SessionAccess.getSessionUser(function(value)
		{
			jid=StropheAccess.getJid(value);

			//set jid and name
			$('#headerUserNameLabel').html(jid);
			
			 SessionAccess.getSessionNodeId(function(node)
			 {
				DataAccess.findNodeByName(node, function(result)
				{
					try
					{
						if(result.trim()!="null")
						$('#headerUserFullNameLabel').html(JSON.parse(result).description);
					}
					catch(ex)
					{
						//console.log(ex);
					}
				});
			});
		});

		$(document).on("connecting", function()
		{
			$('#footerStatusLabel').text('جاري الاتصال...');			
			$(".header-logo").addClass("rotating");
			$(".header-logo").attr("src", "imgs/ekhtar_orange.png");
			$(".header-reconnect").addClass("hide");
		});

		$(document).on("disconnected", function()
		{
			$('#footerStatusLabel').text('غير متصل');
			$(".header-logo").removeClass("rotating");
			$(".header-logo").attr("src", "imgs/ekhtar_red.png");
			$(".header-reconnect").removeClass("hide");
	
			connectionManager=setInterval(function()
			{
				StropheSession.initialize();
			}, 30000);
		});

		$(document).on("connected", function()
		{
			$('#footerStatusLabel').text('متصل');
			$(".header-logo").removeClass("rotating");
			$(".header-logo").attr("src", "imgs/ekhtar_green.png");
			$(".header-reconnect").addClass("hide");
	
			if(connectionManager!=null)
				clearInterval(connectionManager);
		});

		$(".header-reconnect").click(function()
		{
			StropheSession.initialize();
		});

		StropheAccess.messageReceived(function(event, id, publisher, es, text, timestamp, receivedTimestamp, commandId)
		{
			//playing audio sound
			notifyAudio.pause();notifyAudio.currentTime=0;	
			notifyAudio.play();
			
			//add message
			//console.log("Message has been received.", id, publisher, es, text, timestamp, commandId);
			Master.increaseNotificationCount(1);
			addNotificationItem(id, publisher, text, timestamp, false, "1", commandId!=null && commandId!="-1",true);
		});


		$('#logoutBarLi').click(function()
		{
			StropheAccess.connection.sendPresence($pres({type: 'unavailable'}));
			StropheAccess.connection.disconnect();
			SessionAccess.destroySession();
			document.location='login.html';
		});
	});
});

var Master=
{
	getHeader: function(callback)
	{
		callback(Master.getHeaderContent());
	},

	getFooter: function(callback)
	{
		callback("");
	},

	getMainContent: function(callback)
	{
		callback("");
	},

	validContent: function(page, callback)
	{
		callback();
	},

	getVariable: function(name)
	{
		var url = window.location.href;
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		results = regex.exec(url);
		if (!results) return null;
		if (!results[2]) return '';
		return decodeURIComponent(results[2].replace(/\+/g, " "));
	},

	toggleFullScreen: function()
	{
		if(Master.isFullScreen())
			Master.cancelFullScreen();
		else
			Master.requestFullScreen();
	},
	
	applyFullScreen: function()
	{
		Master.requestFullScreen();
	},

	isFullScreen: function()
	{
		return !((document.fullScreenElement && document.fullScreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen));
	},

	requestFullScreen: function()
	{
		if (document.documentElement.requestFullScreen)
			document.documentElement.requestFullScreen();
		else if(document.documentElement.mozRequestFullScreen)
			document.documentElement.mozRequestFullScreen();
		else if (document.documentElement.webkitRequestFullScreen)
			document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);

		$("footer").css("margin-top", "130px");	
	},

	cancelFullScreen: function()
	{
		if (document.cancelFullScreen)
			document.cancelFullScreen();
		else if (document.mozCancelFullScreen)
			document.mozCancelFullScreen();
		else if (document.webkitCancelFullScreen)
			document.webkitCancelFullScreen();

		$("footer").css("margin-top", "");
	},

	updateNotificationCount: function(notificationCount)
	{
		if(notificationCount<0)
			notificationCount=0;

		var count=notificationCount.toString();
		$("#notificationCountLabel").html(count);
		$("#notificationBadgeLabel").html(count);

		if(count!=null && count.trim()!="" && count.trim()!="0")
		{
			$("#notificationCountLabel, #notificationBadgeLabel").css("visibility", "visible");
			$("#notificationBarLi>a").css("color", "#F44336");
		}
		else
		{
			
			$("#notificationCountLabel, #notificationBadgeLabel").css("visibility", "hidden");
			$("#notificationBarLi>a").css("color", "");
		}

	},

	increaseNotificationCount: function(notificationIncreament)
	{
		var counter=parseInt($("#notificationCountLabel").text());
		if(isNaN(counter))
			counter=0;
		Master.updateNotificationCount(counter+notificationIncreament);
	},

	getHeaderContent: function()
	{
		var header="<body id=\"body\"> <div class=\"navbar-fixed\" style=\"z-index: 1001;\"> <nav><div class=\"nav-wrapper\"> <a href=\"#!\" data-target=\"mainSidenav\" class=\"right sidenav-toggler show-on-large\"><img class=\"header-logo\" src=\"imgs/ekhtar_grey.png\"></a> <a href=\"#!\" class=\"right hide header-reconnect\">إعادة الاتصال</a> <a class=\"left waves-effect waves-block waves-light dropdown-trigger header-profile\" data-target=\"profileDropdown\"><i class=\"material-icons\">account_circle</i><span id=\"headerUserFullNameLabel\">مدير إخطار</span></a> <ul id=\"profileDropdown\" class=\"dropdown-content collection with-header\"> <li class=\"collection-header no-padding\"> <a><i class=\"material-icons\">face</i><span id=\"headerUserNameLabel\">user@ekhtar.sy</span></a> </li> <li class=\"divider\"> <li class=\"collection-item no-padding\"> <a href=\"password.html\"><i class=\"material-icons\">lock_outline</i>تغيير كلمة المرور</a> </li> <li class=\"divider\"> <li id=\"logoutBarLi\" class=\"collection-item no-padding\"> <a href=\"#!\"><i class=\"material-icons reverse\">keyboard_tab</i>تسجيل الخروج</a> </li> </ul>";
		header+="<ul class=\"left hide-on-med-and-down\"> <li> <a id=\"fullScreenButton\" class=\"tooltipped\" data-tooltip=\"&lt;i class='material-icons'&gt;info&lt;/i&gt;ملئ الشاشة\"><i class=\"material-icons\">settings_overscan</i></a> </li> <li> <a href=\"index.html\" class=\"tooltipped\" data-tooltip=\"&lt;i class='material-icons'&gt;info&lt;/i&gt;لوحة التحكم\"><i class=\"material-icons\">dashboard</i></a> </li> <li id=\"mapUsersBarLi\"> <a href=\"mapUsers.html\" class=\"tooltipped\" data-tooltip=\"&lt;i class='material-icons'&gt;info&lt;/i&gt;خارطة المستخدمين\"><i class=\"material-icons\">person_pin_circle</i></a> </li> <li id=\"reportsBarLi\"> <a href=\"reports.html\" class=\"tooltipped\" data-tooltip=\"&lt;i class='material-icons'&gt;info&lt;/i&gt;بلاغات إخطار\"><i class=\"material-icons\">view_list</i></a> </li> </ul> <ul class=\"left hide-on-small-and-down\"> <li id=\"commandBarLi\"> <a data-tooltip=\"&lt;i class='material-icons'&gt;info&lt;/i&gt;الأوامر المرسلة\" class=\"waves-effect waves-block waves-light dropdown-trigger tooltipped\" data-target=\"notifyCommandDropdown\"><i class=\"material-icons\">mail</i><i class=\"material-icons icon-extend\">arrow_drop_down</i></a> <ul id=\"notifyCommandDropdown\" class=\"dropdown-content collection with-header width-medium\"> <li class=\"collection-header\" style=\"cursor: default\"> <span style=\"padding: 9px\">الأوامر الأخيرة</span> </li> <li class=\"divider\"> </li> <li id=\"notifyCommandDropdownItem\" class=\"collection-item avatar\"> <a href=\"commands.html\" i class=\"no-padding\"> <img id=\"notifyCommandImage\" class=\"circle responsive-img profile-image\" src=\"imgs/ekhtar.png\"><div id=\"notifyCommandTextLabel\" class=\"notify-text\">نص الأمر</div> <p class=\"notify-time\"><i class=\"material-icons\">access_time</i><span id=\"notifyCommandDateLabel\" class=\"tooltipped timer\">منذ ٣ أيام</span></p> <span id=\"notifyCommandReceiverLabel\" class=\"notify-receiver\"><i class=\"material-icons\">done_all</i><span>0</span> مستلم</span> <span id=\"notifyCommandNonReceiverLabel\" class=\"notify-receiver-none\"><i class=\"material-icons\">done</i><span>0</span> غير مستلم</span> </a> </li> <li class=\"divider\"> </li> <li id=\"notificationShowMoreLi\" class=\"collection-header\" style=\"display: none\"> <a href=\"#!\"><i class=\"material-icons\" style=\"margin-right: -20px\">sync</i>مشاهدة المزيد</a> </li> </ul>";
		header+="</li> <li id=\"notificationBarLi\"> <a data-tooltip=\"&lt;i class='material-icons'&gt;info&lt;/i&gt;الاشعارات الجديدة\" class=\"waves-effect waves-block waves-light dropdown-trigger tooltipped\" data-target=\"notificationDropdown\"><i class=\"material-icons\">notifications_none</i><i class=\"material-icons icon-extend\">arrow_drop_down</i><small id=\"notificationCountLabel\" class=\"notification-badge\"></small></a> <ul id=\"notificationDropdown\" class=\"dropdown-content collection with-header width-medium\"> <li class=\"collection-header\" style=\"cursor: default\"> <span style=\"padding: 9px\">آخر الإشعارات<span id=\"notificationBadgeLabel\" class=\"new badge\"></span></span><a href=\"#visibilityAllModal\" class=\"notify-allseen modal-trigger\"><i class=\"material-icons\">visibility</i>الكل كمقروء </a> </li> <li class=\"divider\"> </li> <li id=\"notificationDropdownItem\" class=\"collection-item avatar\"> <a href=\"reports.html?map\"> <img id=\"notificationUserImage\" class=\"circle responsive-img profile-image\" src=\"imgs/admin.png\"><div id=\"notificationTextLabel\" class=\"notify-text\"> <i class=\"material-icons blue-text\">call_missed</i><span>نص البلاغ</span> </div> <!--p id=\"notificationUserLabel\">اسم المستخدم</p--> <span class=\"notify-time\"><i class=\"material-icons\">access_time</i><span id=\"notificationDateLabel\" class=\"tooltipped timer\">10-12-2018</span></span> <span class=\"notify-user\"><i class=\"material-icons\">person</i><span id=\"notificationUserLabel\">مرسل البلاغ</span> <span class=\"notify-unseen\"><i class=\"material-icons\">visibility_off</i></span> </span></a> </li> <li class=\"divider\"> </li> <li id=\"notificationShowMoreLi\" class=\"collection-header\" style=\"display: none\"> <a href=\"#!\"><i class=\"material-icons\" style=\"margin-right: -20px\">sync</i>مشاهدة المزيد</a> </li> </ul> </li> </ul> </div> </nav>";
		header+="</div> <div> <aside><ul id=\"mainSidenav\" class=\"sidenav\" style=\"z-index: 9999;\"> <li> <div class=\"user-view\" style=\"height: 180px\"> <div class=\"background\" style=\"opacity: .9\"> <img src=\"imgs/cover4.jpg\"> </div> </div> </li> <li> </li> <li id=\"dataLi\" class=\"no-padding\"> <ul class=\"collapsible\"> <li class=\"bold\"> <a class=\"collapsible-header waves-effect waves-light\"> <i class=\"material-icons\">assignment</i> <span class=\"nav-text\">البلاغات</span> </a> <div class=\"collapsible-body\"> <ul class=\"collapsible\"> <li id=\"reportsLi\"> <a href=\"reports.html\"> <i class=\"material-icons\">view_list</i> <span>قائمة البلاغات</span> </a> </li> <li id=\"commandLi\"> <a href=\"commands.html\"> <i class=\"material-icons\">mail</i> <span>المراسلات</span> </a> </li> </ul> </div> </li> </ul> </li> <li id=\"mapLi\" class=\"no-padding\"> <ul class=\"collapsible\"> <li class=\"bold\"> <a class=\"collapsible-header waves-effect waves-light\"> <i class=\"material-icons\">public</i> <span class=\"nav-text\">خرائط</span> </a> <div class=\"collapsible-body\"> <ul class=\"collapsible\"> <li id=\"mapUsersLi\"> <a href=\"mapUsers.html\"> <i class=\"material-icons\">person_pin_circle</i> <span>خارطة المستخدمين</span> </a> </li> <li id=\"reportsLi\"> <a href=\"reports.html?map\"> <i class=\"material-icons\">pin_drop</i> <span>خارطة البلاغات</span> </a> </li> </ul> </div> </li> </ul> </li> <li> </li> <li id=\"usersLi\" class=\"no-padding\"> <ul class=\"collapsible\"> <li class=\"bold\"> <a class=\"collapsible-header waves-effect waves-light\"> <i class=\"material-icons\">group</i> <span class=\"nav-text\">شبكة أخطار</span> </a> <div class=\"collapsible-body\"> <ul class=\"collapsible\"> <li id=\"userLi\"> <a href=\"users.html\"> <i class=\"material-icons\">person_outline</i> <span>المستخدمون</span> </a> </li> <li id=\"groupLi\"> <a href=\"groups.html\"> <i class=\"material-icons\">people_outline</i> <span>المجموعات</span> </a> </li> </ul> </div>";
		header+="</li> </ul> </li> <li id=\"toolsLi\" class=\"no-padding\"> <ul class=\"collapsible\"> <li class=\"bold\"> <a class=\"collapsible-header waves-effect waves-light\"> <i class=\"material-icons\">widgets</i> <span class=\"nav-text\">إدارة أخطار</span> </a> <div class=\"collapsible-body\"> <ul class=\"collapsible\"> <li> <a href=\"index.html\"> <i class=\"material-icons\">dashboard</i> <span>لوحة التحكم</span> </a> </li> <li id=\"settingLi\"> <a href=\"setting.html\"> <i class=\"material-icons\">settings</i> <span>الإعدادات</span> </a> </li> </ul> </div> </li> </ul> </li> </ul></aside> </div> <div id=\"visibilityAllModal\" class=\"modal\"> <div class=\"modal-content\"> <h4>تأكيد تعيين جميع البلاغات كمقروءة</h4> <p>سوف يتم تعيين جميع البلاغات المستقبلة في نظام إخطار كمقروءة وعددها <span id=\"allseenConfirmReadLabel\">23</span> بلاغ.</p> </div> <div class=\"modal-footer\"> <a id=\"visibilityAllButton\" href=\"#!\" class=\"modal-close waves-effect waves-green btn-flat tooltipped\" data-tooltip=\"موافق\"><i class=\"material-icons green-text\">done</i></a> <a href=\"#!\" class=\"modal-close waves-effect waves-green btn-flat tooltipped\" data-tooltip=\"إلغاء\"><i class=\"material-icons red-text\">close</i></a> </div> </div> </body>";
		return header;
	}
};

Master.validContent(window.location.pathname.substring(1), function(result)
{
	if(result!=null && result.trim()!="")
	{
		document.write(result)
	}
});
