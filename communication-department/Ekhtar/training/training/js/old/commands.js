$(document).ready(function()
{
	//constant region
        var IMAGE_PATH="imgs/group/";
	var SMS_MAX_LENGTH=190;
	var PUBLISH_MODE=1;
	var XMPP_MODE=2;
	var SMS_MODE=3;
	var XMPP_SMS_MODE=4;

        //materialize initial
        $("select").formSelect()
        $(".modal").modal();
	$(".tabs").tabs(/*{swipeable: true}*/);
	$(".dropdown-trigger").dropdown({autoTrigger: true, constrainWidth: false, coverTrigger: false, hover: true});
	$(".datepicker").datepicker(datepickerArgs);
	$(".timepicker").timepicker(timepickerArgs);
	$(".tooltipped").tooltip();

        //parsing template
	var userListElement=$("#userListElement>ul");
	var setListElement=$("#setListElement>ul");
	var commandListElement=$("#commandListElement>ul");
	var receiverListElement=$("#receiverListElement");
	var replayListElement=$("#replayListElement");

	var userElement=$.extend(true, {}, userListElement.find(">.collection-item"));
	var userHeaderElement=$.extend(true, {}, userListElement.find(".collection-header"));
	var setElement=$.extend(true, {}, setListElement.find(">li"));
	var commandElement=$.extend(true, {}, commandListElement.find(">li"));
	var receiverElement=$.extend(true, {}, receiverListElement.find(">div"));
	var replayElement=$.extend(true, {}, replayListElement.find(">div"));

        //initial values
        var setInfo=SetManager.getSetInfo();
        var set=SetManager.getSet();
	var setUsers=SetManager.getUsers();
	var users=SetManager.getUsers(); 
	var userKeys=Object.keys(users);
        var rowKey="";
	var commandSearchText="";
	var commandTimestamp1="0";
	var commandTimestamp2="0";
	var userArg=Master.getVariable("u");
	var setArg=Master.getVariable("s");
	var commandArg=Master.getVariable("c");
	var localArg=Master.getVariable("type");
	var selectedItems=[];

	//initial functions
	if(Master.getVariable("schema")==null)
	{	
		commandListElement.html("");
		receiverListElement.html("");
		if(Master.getVariable("c")!=null)
		{
			loadCommand(Master.getVariable("c"));
			commandStateDiv(true);
			$("#moreDiv>a").attr("href", "commands.html").find("span").html("عرض جميع الأوامر المرسلة");
		}
		else
		{
			$("#moreDiv").css("display", "none");
			commandStateDiv(false);
		}

		SessionAccess.getManageNodesPrivilege(function(result)
		{
			if(result=="0")
			{
				commandElement.find(".command-sender").remove();
				$("#ehqOption").remove();
			}
		});

		loadUsers();
		loadSet();
	}

	DataAccess.findSetting("ehqCommandFilter", function(configResult)
	{
		//console.log("config ehqCommandFilter: ", configResult);

		if(configResult.trim()!="null")
			$("#ehqCheckbox").prop("checked", JSON.parse(configResult).value=="true");


		$("#ehqCheckbox").change(function()
		{
			DataAccess.saveSetting("ehqCommandFilter", $(this).prop("checked"), function(result)
			{
				//console.log("saving ehqCommandFilter: ", result);
				commandListElement.html("");
				rowKey="";
				loadCommands();
			});
		});

		if(Master.getVariable("c")==null)
			loadCommands();
	});

	DataAccess.findSetting("reportReplayFilter", function(configResult)
	{
		//console.log("config reportReplayFilter: ", configResult);

		if(configResult.trim()!="null")
			$("#reportReplayCheckbox").prop("checked", JSON.parse(configResult).value=="true");


		$("#reportReplayCheckbox").change(function()
		{
			DataAccess.saveSetting("reportReplayFilter", $(this).prop("checked"), function(result)
			{
				//console.log("saving reportReplayFilter: ", result);
				commandListElement.find(".active").click();
			});
		});
	});

	$(document).on("click", "#userListElement>.collection>.collection-item, #setListElement>.collection>.collection-item", function()

	{
		if(!$(this).hasClass("active"))
			addSelectItem($(this).attr("id"));
		else
			removeSelectItem($(this).attr("id"));

		var userCount=$("#userListElement>.collection>.collection-item.active").length;
		var setCount=$("#setListElement>.collection>.collection-item.active").length;
		$("#userTab .command-badge").html(userCount);
		$("#setTab .command-badge").html(setCount);
		if(userCount==0)
			$("#userTab .command-badge").addClass("hide");
		else
			$("#userTab .command-badge").removeClass("hide");

		if(setCount==0)
			$("#setTab .command-badge").addClass("hide");
		else
			$("#setTab .command-badge").removeClass("hide");

		if(userCount+setCount==0)
			$("#messageButton").addClass("disabled");
		else
			$("#messageButton").removeClass("disabled");
		
	});

	$(document).on("click", "#commandListElement>.collection>.collection-item", function()
	{
		//set active state
		commandListElement.find("li.active").removeClass("active");
		$(this).addClass("active");
		commandStateDiv(true);	
		receiverListElement.html("");

		var id=$(this).attr("id").substring(8);
		var userData=$(this).attr("data-users");
		var setData=$(this).attr("data-sets");

		var users="";

		if($("#reportSearchUserText").val()!="")
		{
			if(userData!=null)
			{
				var value=$("#reportSearchUserText").val();
				var dataUserArray=userData.split(";");
				for(var i=0; i<dataUserArray.length; i++)
					if(dataUserArray[i]!="")
					{
						var dataId=dataUserArray[i].substring(0, dataUserArray[i].indexOf(":"));
						var setUser=setUsers[dataJid];
						
						if(dataId.indexOf("@")>=0)
							dataId=Strophe.getNodeFromJid(dataId);

						if(dataId.indexOf(value)>=0 || (setUser!=null && setUser.name.indexOf(value)>=0))
							users+=dataId;
					}	
			}
		}

		var keywords=$("#reportSearchText").val();
		
		var timestamp1=getTimestamp($("#reportSearchFromDate"), $("#reportSearchFromTime"));
                var timestamp2=getTimestamp($("#reportSearchToDate"), $("#reportSearchToTime"), true);	

		if(users!="" || $("#reportSearchUserText").val()=="")
			InterfaceAccess.loadReportsCommand(users, id, keywords, timestamp1, timestamp2, function(reports)
			{
				//console.log("reports: ", reports);
				var userReport={};
				if(reports.trim()!="")
				{
					var reportArray=reports.split("<br />");
					for(var k=0;k<reportArray.length;k++)
					if(reportArray[k]!="")
					{
						try
						{
							var reportObj=JSON.parse(reportArray[k]);

							if(userReport[reportObj.publisher]==null)
								userReport[reportObj.publisher]=[];

							var attachments;
							if(reportObj.attachments!=null)
								attachmentsCount=reportObj.attachments.split(";").length;
							else if(reportObj.attachmentFiles!=null)
								attachmentsCount=reportObj.attachmentFiles.split(";").length;
							else
								attachmentsCount=0;

							userReport[reportObj.publisher].push(
											{
												rowKey: reportObj.rowKey,
												text: reportObj.text,
												timestamp: reportObj.timestamp,
												attachments: reportObj.attachments, 
												attachmentFiles: reportObj.attachmentFiles
											});
						}
						catch(ex)
						{
							//console.log(ex);
						}
					}
				}

				var reportReplay=$("#reportReplayCheckbox").prop("checked");
				if(userData!=null && userData!="")
				{
					var userArray=userData.split(";");
					//console.log(userArray, users);
					for(var i=0; i<userArray.length; i++)
						if(userArray[i]!="")
						{
							var seperatorIndex=userArray[i].indexOf(":");
							var id=userArray[i].substring(0, seperatorIndex);
							var timestamp=parseInt(userArray[i].substring(seperatorIndex+1));

							if(id.indexOf("@")>=0)
								id=Strophe.getNodeFromJid(id);

							if((users=="" || users.indexOf(id)>=0) && (!reportReplay || userReport[id]!=null))
								addCommandReceiver(id, timestamp, userReport[id]);
						}
				}

				for(var userKey in userReport)
				{
					if(userData==null || userData.indexOf(userKey)==-1)
						addCommandReceiver(userKey, -2, userReport[userKey]);
				}

				if(userData=="" && Object.keys(userReport).length==0)
					receiverListElement.html("<div class='command-text center'>لا يوجد ردود أو مستلمين للأمر المرسل.</div>");
					
			});	
	});

	$(document).on("click", ".command-state-button", function()
	{
		var section=$(this).parent().parent().parent().find(".section-toggle");
		if(section.html()!="")
			section.toggleClass("section-active");
	});

	$("#closeCommandStateButton").click(function()
	{
		commandStateDiv(false);
	});

	$("#replayModal button").click(function()
	{
		$("#messageText").val($("#messageText").val() + " " + $(this).text().substring(4));
		M.updateTextFields();
	});

	$("#resetCommandButton").click(function()
	{
		$("#commandSearchText").val("");
		$("#commandSearchFromDate, #commandSearchToDate").val("").datepicker(datepickerArgs);
		$("#commandSearchFromTime, #commandSearchToTime").val("").timepicker(timepickerArgs);

		$("#commandSearchButton").click();
	});

	$("#commandSearchButton").click(function()
	{
		commandSearchText=$("#commandSearchText").val();
		commandTimestamp1=getTimestamp($("#commandSearchFromDate"), $("#commandSearchFromTime"));
                commandTimestamp2=getTimestamp($("#commandSearchToDate"), $("#commandSearchToTime"), true);

		rowKey="";
		commandListElement.html("");
		$("#moreDiv").css("display", "none");
		loadCommands();
	});

	$("#resetReportButton").click(function()
	{
		$("#reportSearchText, #reportSearchUserText").val("");
		$("#reportSearchFromDate, #reportSearchToDate").val("").datepicker(datepickerArgs);
		$("#reportSearchFromTime, #reportSearchToTime").val("").timepicker(timepickerArgs);		

		$("#reportSearchButton").click();
	});

	$("#reportSearchButton").click(function()
	{
		commandListElement.find(".active").click();
	});

	$("#publishMessageButton").click(function()
	{
		if(Validator.validateHasValue($("#publishText")))
		{	
			 InterfaceAccess.saveCommand(Strophe.getNodeFromJid(StropheAccess.connection.jid), $("#publishText").val(), setInfo.publishNode, "", function(commandId)
			{
				//console.log("Publihs has saved to db: ", commandId);

				if(commandId!=null)
				{
					StropheAccess.publish(commandId, setInfo.publishNode, $("#publishText").val(), function(publishResult)
					{
						//console.log("Command has published: ", publishResult);
						if($(publishResult).attr('type')=='error')
							M.toast({html: "لم يتم النشر, "+$(publishResult).find("type").text(), classes: "toast-error"});
						else
						{
							addCommand(commandId, Strophe.getNodeFromJid(StropheAccess.connection.jid), $("#publishText").val(), setInfo.publishNode, new Date().getTime(), null, true);

							M.toast({html: "تم نشر الأمر بنجاح.", classes: "toast-success"});
						}

						$("#closePublishButton").click();
						$("#publishModal").modal("close");
					});	
				}
			});
		}
	});

	$("#messageButton").click(function()
	{
		if(Validator.validateHasValue($("#messageText")))
		{
			var setArray=[];
			var userArray=[];

			for(var i=0; i<selectedItems.length; i++)
			{
				var selectedId=selectedItems[i];

				if(selectedId.startsWith("set_"))
				{
					var selectedSet=set[selectedId.substring(4)];
					setArray.push(selectedSet.name);

					var setUsers=selectedSet.users;

					for(var i=0; i<setUsers.length; i++)
						if(setUsers[i].available && userArray.indexOf(setUsers[i].jid)==-1)
							userArray.push(setUsers[i].jid);
				}
				else if(selectedId.startsWith("user_"))
				{
					var selectedUser=StropheAccess.getJid(selectedId.substring(5));
					if(userArray.indexOf(selectedUser)==-1)
						userArray.push(selectedUser);
				}
			}

			if(userArray.length==0)
			{
				M.toast({html: "لا يوجد مستخدمين فعالين للمراسلة.", classes: "toast-error"});
				return;
			}
			
			InterfaceAccess.saveCommand(Strophe.getNodeFromJid(StropheAccess.connection.jid), $("#messageText").val(), setArray.toString().replace(/,/g,';'), userArray.toString().replace("@ekhtar.sy", "").replace(/,/g, ';'), function(commandId)
			{
				//console.log("Command has saved to db: ", commandId);
				if(commandId!=null)
				{
					var mode=parseInt($("#configureButton").attr("data-mode"));
					var commandReaders=[];
					if(mode==2)
					{

						for(var i=0; i<userArray.length; i++)
							commandReaders.push({name: userArray[i], timestamp: 0});

						StropheAccess.sendMessage(commandId, userArray, $("#messageText").val());
					}
					else if(mode==3)
					{
						for(var i=0; i<userArray.length; i++)
							commandReaders.push({name: userArray[i], timestamp: -1});

						SmsAccess.sendMessage(commandId, userArray, $("#messageText").val(), function(sendResult)
						{
							console.log(sendResult);
							for(var i=0; i<userArray.length; i++)
								InterfaceAccess.setCommandRead(commandId, userArray[i], "-1", function(result)
								{
									//console.log("save sms user read: ", result);
								});
						});
					}
					else if(mode==4)
					{
						var onlineUserArray=[];
						var offlineUserArray=[];

						for(var i=0; i<userArray.length; i++)
							if(isOnline(userArray[i]))
							{
								onlineUserArray.push(userArray[i]);
								commandReaders.push({name: userArray[i], timestamp: 0});
							}
							else
							{
								offlineUserArray.push(userArray[i]);
								commandReaders.push({name: userArray[i], timestamp: -1});
							}
						
						SmsAccess.sendMessage(commandId, offlineUserArray, $("#messageText").val(), function(sendResult)
						{
							//console.log(sendResult);

							for(var i=0; i<offlineUserArray.length; i++)
								InterfaceAccess.setCommandRead(commandId, offlineUserArray[i], "-1", function(result)
								{
									//console.log("save sms user read: ", result);
								});
						});

						StropheAccess.sendMessage(commandId, onlineUserArray, $("#messageText").val());
					}

					addCommand(commandId, Strophe.getNodeFromJid(StropheAccess.connection.jid), $("#messageText").val(), setArray.toString().replace(/,/g,';'), new Date().getTime(), commandReaders, true);

					var audio=new Audio();
					audio.src="audio/Ding Notification.wav";
					audio.play();

					M.toast({html: "تم ارسال الأمر بنجاح.", classes: "toast-success"});
					$("#messageText").val("");
				}
				else
				{
					
				}
			});
		}
	});

	$('#idText').keyup(function()
	{
		if($(this).val()=="")
			$("#userListElement>ul>li, #setListElement>ul>li").show();
		else
		{
			var regexp=new RegExp($(this).val());
			$("#userListElement>ul>li, #setListElement>ul>li").show().each(function()
			{
				if(!regexp.test($(this).find(">#nameLabel").text())
				&& !regexp.test($(this).find(">#idLabel").text()))
					$(this).hide();
			});
		}
	});

	$("#configureUl>li").click(function()
	{
		var mode=parseInt($(this).attr("data-mode"));
		$("#configureButton").attr("data-mode", mode);
		$("#configureButton").html($(this).find(">a").html());

		setMode();
	});

	$("#selectAllCheckbox").change(function()
	{
		if($(this).prop("checked"))
			userListElement.find(">li").not(".active").click();
		else
			userListElement.find(">li.active").click();
	});


	$("#commandListElement").scroll(function(event)
	{
		if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight)
		{
			loadCommands();
        	}
	});

	StropheAccess.commandRead(function(event, commandId, from, timestamp)
	{
		M.toast({html: "تم استقبال الأمر من قبل المستخدم: "+from})
		var commandElement=$("#command_"+commandId);

		if(commandElement.length>0)
		{
			var userData=commandElement.attr("data-users");
			userData=userData.replace(from+":0", from+":"+timestamp);
			commandElement.attr("data-users", userData);
			
			var count=0;
			var receiverCount=0;
			var userArray=userData.split(";");

			for(var i=0; i<userArray.length; i++)
				if(userArray[i]!="")
				{
					var seperatorIndex=userArray[i].indexOf(":");
					var timestamp=parseInt(userArray[i].substring(seperatorIndex+1));

					count++;
					if(parseInt(timestamp)>0)
						receiverCount++;	
				}

			if(receiverCount>0)
				commandElement.find(".command-receiver").css("display", "").find(">span").html(receiverCount);
			else
				commandElement.find(".command-receiver").css("display", "none");

			if(count-receiverCount>0)
				commandElement.find(".command-receiver-none").css("display", "").find(">span").html(count-receiverCount);
			else
				commandElement.find(".command-receiver-none").css("display", "none");
			
			if(commandElement.hasClass("active"))
				commandElement.click();
		}
	});

	StropheAccess.messageReceived(function(event, id, publisher, es, text, timestamp, rcvTimestamp, commandId)
	{
			//console.log("Message has been received.", id, publisher, es, text, timestamp);

			if($("#command_"+commandId).length>0)
			{
				M.toast({html: "تم الرد على أمر مرسل من قبل المستخدم "+publisher});
				var commandElement=$("#command_"+commandId);
				if(commandElement.hasClass("active"))
					commandElement.click();
			}

	});

	StropheAccess.presenceReceived(function(event, from, type)
	{
		var id=Strophe.getNodeFromJid(from);

		if(type==null)
			$("#user_"+id+">#statusDiv").removeClass("command-selector-offline").addClass("command-selector-online");
		else
			$("#user_"+id+">#statusDiv").removeClass("command-selector-online").addClass("command-selector-offline");
			
	});

	setArgs();
	$("#configureUl>li:first").click();

	//function region
	function setMode()
	{
		var mode=parseInt($("#configureButton").attr("data-mode"));

		switch(mode)
		{
			case PUBLISH_MODE:
				$("#publishModal").modal("open");
			break;
			case XMPP_MODE:
				$("#messageText").attr("maxlength", null).attr("data-length", null);
				$(".character-counter").remove();
			break;
			case SMS_MODE:
				$("#messageText").attr("maxlength", SMS_MAX_LENGTH).attr("data-length", SMS_MAX_LENGTH).characterCounter();
			break;
			case XMPP_SMS_MODE:
				$("#messageText").attr("maxlength", SMS_MAX_LENGTH).attr("data-length", SMS_MAX_LENGTH).characterCounter();
			break;
			
		}
	}

	function commandStateDiv(open)
	{
		if(open)
		{
			$("#commandListContainer").removeClass("m12").addClass("m7");
               		$("#reportListContainer").css("display", "block").css("visibility", "visible");
		}
		else
		{
			$("#commandListContainer").removeClass("m7").addClass("m12");
			$("#reportListContainer").css("display", "none").css("visibility", "hidden");
		}
	}

	function isOnline(jid)
	{
		var index=userKeys.indexOf(jid);
		return $("#user_"+index).find("#statusDiv").hasClass("command-selector-online");
	}

	function addReceiverElement(jid, timestamp, replayTimestamp)
	{
		var deliveryReport="";
		var deliveryIcon;
		var deliveryIconColor;

		if(timestamp==0)
		{
			deliveryReport="لم يتم استقبال الرسالة حتى الآن";
			deliveryIcon="access_time";
			deliveryIconColor="grey-text";
		}
		else if(timestamp==-2)
		{
			deliveryReport="خطأ أثناء ارسال الرسالة";
			deliveryIcon="error";
			deliveryIconColor="red-text";
		}
		else 
		{
			if(timestamp==-1)
			{
				deliveryReport="تم استقبال الرسالة من خلال شبكات الخلوي";
				deliveryIcon="sim_card";
				deliveryIconColor="yellow-text";
			}
			else
			{
				deliveryReport="تم استقبال الرسالة بتاريخ "+ moment(timestamp).fromNow();
				deliveryIcon="done";
				deliveryIconColor="orange-text";
			}

			if(replayTimestamp!=null)
			{
				deliveryReport+=", وتم الرد على الرسالة بتاريخ "+ moment(replayTimestamp).fromNow();
				deliveryIcon="done_all";
				deliveryIconColor="green-text";
			}
		}

		deliveryReport+=".";
		
		var name="";
		var logo="imgs/admin.png";

		if(users[jid]!=null)
		{
			name=users[jid].name;
			logo=users[jid].logo;
		}
	}

	function addSelectItem(id)
	{
		selectedItems.push(id);
		$("#"+id).addClass("active");
	}

	function addCommand(commandId, es, text, sets, timestamp, readers, addToTop)
	{
		var setLogo;
		if(set[es]!=null)
			setLogo=set[es].logo;
		else
			setLogo=SetManager.getEmptyUser().setLogo;

		//remove html tag from text
		if(text.indexOf("<")>=0 || text.indexOf(">")>=0)
			text=text.replace("<", "&lt;").replace(">", "&gt;");

		//display result
		commandElement.attr("id", "command_"+commandId);
		commandElement.find("#commandTextElement").html(text);
		commandElement.find("#commandDateElement").html(moment(timestamp).fromNow()).attr("data-timestamp", timestamp).attr("data-tooltip", moment(timestamp).format(DATE_ICON_FORMAT));
		commandElement.find("#commandImageElement").attr("src", setLogo);
		commandElement.attr("data-sets", sets);

		if(commandElement.find(".command-sender").length>0)
		{
			if(sets==setInfo.publishNode)
			{
				commandElement.find(".command-sender>span").html("نشر");
				commandElement.find(".command-receiver").css("display", "none");
				commandElement.find(".command-receiver-none").css("display", "none");

			}
			else
			{
				commandElement.find(".command-sender>span").html(es);
			}
		}

		var count=0, receiverCount=0;
		if(readers!=null && readers.length>0)
		{
			var readerString="";
			for(var j=0;j<readers.length;j++)
			{
				var readerName=StropheAccess.getJid(readers[j].name);
				var readerTimestamp=readers[j].timestamp;

				if(readerString.indexOf(readerName)>=0)
					readerString=readerString.replace(readerName+":0;", readerName+":"+readerTimestamp+";");
				else
				{
					readerString+=readerName+":"+readerTimestamp+";";
					count++;
				}
				
				if(readers[j].timestamp!=0)
					receiverCount++;
			}

			commandElement.attr("data-users", readerString);

			if(receiverCount>0)
				commandElement.find(".command-receiver").css("display", "").find(">span").html(receiverCount);
			else
				commandElement.find(".command-receiver").css("display", "none");

			if(count-receiverCount>0)
				commandElement.find(".command-receiver-none").css("display", "").find(">span").html(count-receiverCount);
			else
				commandElement.find(".command-receiver-none").css("display", "none");
				
		}
		else
		{
			commandElement.attr("data-users", "")
			if(sets!=setInfo.publishNode)
				commandElement.find(".command-receiver-none").css("display", "").find(">span").html("الكل ");
			commandElement.find(".command-receiver, .command-receiver-none").css("display", "none");
		}
		
		if(addToTop)
			commandListElement.prepend(commandElement.wrapAll("<li>").parent().html());
		else
			commandListElement.append(commandElement.wrapAll("<li>").parent().html());

		$("#command_"+commandId+" .tooltipped").tooltip();

	}

	function addCommandReceiver(id, timestamp, reports)
	{
		var jid=StropheAccess.getJid(id);
		var userName;
		var setLogo;

		if(users[jid]!=null)
		{
			userName=users[jid].name;
			setLogo=users[jid].setLogo;

			if(userName==null || userName.length==0)
				userName=id;
		}
		else
		{
			userName=id;
			setLogo=SetManager.getEmptyUser().setLogo;
		}

		if(reports==null)
			receiverElement.find("#receiverReplayLabel").css("color", "#f90500").html("لا يوجد ردود");
		else
			receiverElement.find("#receiverReplayLabel").css("color", "#7bde70").html(reports.length + " ردود");

		receiverElement.attr("id", "receiver_"+id);
		receiverElement.find("#receiverNameElement").attr("href", "reports.html?id="+id).attr("data-tooltip", "<i class='material-icons'>person</i>"+id).html(userName);
		receiverElement.find("#receiverImageElement").attr("src", setLogo);

		if(timestamp==0)
			receiverElement.find("#receiverStateLabel").attr("data-tooltip", "لم يتم استقبال الأمر حتى الآن").html("<i class='material-icons orange-text'>done</i>");
		else if(timestamp==-1)
			receiverElement.find("#receiverStateLabel").attr("data-tooltip", "تم الارسال باستخدام الرسائل القصيرة").html("<i class='material-icons yellow-text'>sim_card</i>");
		else if(timestamp==-2)
			receiverElement.find("#receiverStateLabel").attr("data-tooltip", "رد على التعميم").html("<i class='material-icons orange-text'>settings_remote</i>");
		else
			receiverElement.find("#receiverStateLabel").attr("data-tooltip", "تم استقبال الأمر بتاريخ "+moment(timestamp).format(DATE_FORMAT)).html("<i class='material-icons green-text'>done_all</i>");

		receiverElement.find("#replayListElement").html("");

		receiverListElement.append(receiverElement.get(0).outerHTML);
		$("#receiver_"+id+" .tooltipped").tooltip();

		if(reports!=null)
			for(var i=0; i<reports.length; i++)
				addCommandReceiverReplay("receiver_"+id, reports[i].rowKey, reports[i].text, reports[i].timestamp, reports[i].attachments, reports[i].attachmentFiles);
	}

	function addCommandReceiverReplay(id, reportId, text, timestamp, attachments, attachmentFiles)
	{
		replayElement.attr("id", "replay_"+reportId);
		replayElement.find(">a").attr("href", "reports.html?r="+reportId);
		replayElement.find("#replayTextLabel").html(text);
		replayElement.find("#replayDateLabel").html(moment(timestamp).fromNow()).attr("data-timestamp", timestamp).attr("data-tooltip", moment(timestamp).format(DATE_ICON_FORMAT));

		if(attachmentFiles!=null && attachmentFiles!="")
		{
			var attachmentArray=attachmentFiles.split(";");
			var mediaCount=0;
	
			for(var i=0; i<attachmentArray.length; i++)
				if(attachmentArray[i]!="")
				{
					mediaCount++;

					var seperator=attachmentArray[i].indexOf(':');
					var uri=attachmentArray[i].substring(0,seperator);
					var position=attachmentArray[i].substring(seperator+1);

					MediaAccess.findMedia(uri, position, function(result)
					{
						var resultUri=result.substring(0,result.indexOf(';'));
						var resultContent=result.substring(result.indexOf(';')+1);

						try
						{
							if(!replayElement.find(".command-state-attachment").attr("href").startsWith("data:image"))
							{
								$("#replay_"+reportId).find(".command-state-attachment").attr("data-lightbox", "replay_"+reportId).attr("href", "data:image/png;base64, "+ resultContent).removeClass("hide");
							}
							else
								receiverListElement.prepend("<a href='data:image/png;base64, "+ resultContent+"' data-lightbox='replay_"+reportId+"'></a>");
						}
						catch(e)
						{
							//console.log("error fetch media",e);
						}
					});
				}

			if(mediaCount==0)
				replayElement.find(".command-state-attachment").addClass("hide").attr("href", "").attr("data-lightbox", "");
		
			replayElement.find("#replayMediaLabel").html(mediaCount);
		}
		else if(attachments!=null && attachments!="")
		{
			var attachmentArray=attachments.split(";");
			var mediaCount=0;
	
			for(var i=0; i<attachmentArray.length; i++)
				if(attachmentArray[i]!="")
				{
					mediaCount++;

					if(i!=0)
						receiverListElement.prepend("<a href='"+attachmentArray[i]+"' data-lightbox='replay_"+reportId+"'></a>");
				}

			if(mediaCount==0)
				replayElement.find(".command-state-attachment").addClass("hide").attr("href", "").attr("data-lightbox", "");
			else
				replayElement.find(".command-state-attachment").removeClass("hide").attr("href", attachmentArray[0]).attr("data-lightbox", "replay_"+reportId);
		
			replayElement.find("#replayMediaLabel").html(mediaCount);
			
		}
		else
			replayElement.find(".command-state-attachment").addClass("hide").attr("href", "").attr("data-lightbox", "");

		
		$("#"+id +" #replayListElement").append(replayElement.get(0).outerHTML);
		$("#replay_"+reportId + " .tooltipped").tooltip();
	}

	function addSet(id, name, usersLength, logo, color)
	{
		setElement.attr("id", "set_"+id);
		setElement.find(">#nameLabel").html(name);

		if(usersLength!="")
			setElement.find(">#countDiv").text(usersLength + " مستخدم");
		else
			setElement.find(">#countDiv").text("المستخدمين غير مسجلين");

		setElement.find(">#setImage").attr("src", logo)
		setElement.find(">#idLabel").val(id);
//console.log('color: ', color);
		setElement.css("background-color", ColorProcessor.getLightColor(color));
		setElement.css("border-color", color);
		setListElement.append(setElement.wrapAll("<li>").parent().html());
	}


	function removeSelectItem(id)
	{
		selectedItems.splice(selectedItems.indexOf(id), 1);
		$("#"+id).removeClass("active");
	}

	function loadUsers(startIndex=0, offset=0)
	{
		var set=SetManager.getSet();

		userListElement.html("");
		for(var key in set)
		{
			if(key!=SetManager.DELETED_SET_ID && set[key].users!=null && (set[key].users.length>0 || key!=SetManager.GENERAL_GROUP_ID))
			{
				var logo=set[key].logo;
				var color=set[key].color;
				userHeaderElement.attr("id", "header_"+set[key].name);
				userHeaderElement.html(set[key].name);
				userHeaderElement.css("color", "white");
				//console.log(set[key].color);
				userHeaderElement.css("background-color", ColorProcessor.getDarkColor(color));
				
				userListElement.append(userHeaderElement.wrapAll("<li>").parent().html());
				var hasChild=false;

				for(var i=0; i<set[key].users.length; i++)
				{
					var userItem=set[key].users[i];
					//if(userItem.available)
					{
						var id=Strophe.getNodeFromJid(userItem.jid);
						var name;

						if(userItem.name==null)
							userItem.name="غير معروف";
						userElement.attr("id", "user_"+id);
						userElement.find(">#idLabel").html(id);
						userElement.find(">#nameLabel").html(userItem.name);
						userElement.find(">#userImage").attr("src", logo);
						userElement.css("background-color", ColorProcessor.getLightColor(color));
						userElement.css("border-color", color);
						userListElement.append(userElement.wrapAll("<li>").parent().html());

						hasChild=true;
					}
				}

				if(!hasChild)
					$("#header_"+set[key].name).css("display", "none");
				else
					$("#header_"+set[key].name).css("display", "block");
			}
		}
	}

	function loadSet()
	{
		setListElement.html("");

		if(setInfo.publishNode==null || setInfo.publishNode=="")
		{
			$("#userToolDiv>div:nth-child(3)").remove();
			$("#userToolDiv>div:nth-child(2)").removeClass("s6").addClass("s9");
			$("#publishModal").remove();
		}

		var set=SetManager.getSet();
		var setItem=null;

		for(var key in set)
			if(key!=SetManager.DELETED_SET_ID)
			{
				setItem=set[key];
				var availableUserCount=0;

				for(var i=0; i<setItem.users.length; i++)
					if(setItem.users[i].available)
						availableUserCount++;

				addSet(key, setItem.name, availableUserCount, setItem.logo, setItem.color);
			}
	}

	function loadCommand(rowKey)
	{
		InterfaceAccess.findCommand(rowKey, function(command)
		{
			if(command.indexOf("Error")==-1)
			{
				var commandObj=JSON.parse(command);
				addCommand(rowKey, commandObj.es, commandObj.text, commandObj.sets, commandObj.timestamp, commandObj.readers, false);	
				commandListElement.find("li").click();
			}
			else
				$("#moreDiv>a>span").html("لا يمكن الوصول للبيانات, المحاولة مجدداً.");
		});
	}


	function loadCommands()
	{
		var ehq="0";

		if($("#ehqOption").length==1 && $("#ehqOption #ehqCheckbox").prop("checked"))
			ehq="1";
		
		//console.log("load commands: ", ehq, ", ", commandSearchText, ", ", commandTimestamp1, ", ", commandTimestamp2, ", ", rowKey);
		
		
		InterfaceAccess.loadCommands(ehq, commandSearchText, commandTimestamp1, commandTimestamp2, rowKey, 10, function(commands)
		{
			if(commands!=null && commands.trim()!="")
			{
				if(commands.indexOf("Error")==-1)
				{
					var commandArray=commands.split("<br />");
					for(var i=0;i<commandArray.length;i++)
						if(commandArray[i]!="")
						{
							try
							{
								commandObj=JSON.parse(commandArray[i]);
								rowKey=commandObj.rowKey;
								addCommand(rowKey, commandObj.es, commandObj.text, commandObj.sets, commandObj.timestamp, commandObj.readers, false);
							}
							catch(ex)
							{
								//console.log(ex);
							}
						}
				}
				else	
				{
					$("#moreDiv>a>span").html("لا يمكن الوصول للبيانات, المحاولة مجدداً.");
					$("#moreDiv").css("display", "");
				}
			}
			else
			{
				$("#moreDiv>a>span").html("لا يوجد المزيد من الأوامر, المحاولة مجدداً.");
				$("#moreDiv").css("display", "");
			}
		});
	
	}

	function setArgs()
	{
		var usersString=null;
		if(localArg!=null)
			usersString=localStorage.getItem("usersString");
		else if(userArg!=null)
			usersString=userArg;

		if(usersString!=null)
		{	
			var users=usersString.split(";");
			for(var i=0; i<users.length; i++)
			if(users[i]!="")
			{
				$("#user_"+users[i]).click();
				//console.log("selected: ", "#user_"+users[i]);
			}
		}

		if(setArg!=null)
		{
			var sets=setArg.split(";");
			var element;

			for(var i=0; i<sets.length; i++)
			if(sets[i]!="")
			{
				element=$("#set_"+sets[i]);

				if(element.length>0)
					element.click();
				//console.log("cann't find set: ", sets[i]);
			}
		}

		if(setArg!=null && userArg==null)
			$(".tabs").tabs("select", "setListElement")
	}
});
