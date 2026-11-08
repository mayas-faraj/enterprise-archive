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
	$(".dropdown-trigger").dropdown();
	$(".datepicker").datepicker();
	$(".timepicker").timepicker();
	$(".tooltipped").tooltip();

        //parsing template
        var selectedListElement=$("#selectedListElement");
	var userListElement=$("#userListElement>ul");
	var setListElement=$("#setListElement>ul");
	var commandListElement=$("#commandListElement>ul");
	var reportListElement=$("#reportListElement>ul");
	var receiverListElement=$("#receiverListElement>ul");

	var selectedElement=$.extend(true, {}, selectedListElement.find(">.content-icon"));
	var userElement=$.extend(true, {}, userListElement.find(">.collection-item"));
	var userHeaderElement=$.extend(true, {}, userListElement.find(".collection-header"));
	var setElement=$.extend(true, {}, setListElement.find(">li"));
	var ehqCommandElement=$.extend(true, {}, commandListElement.find(">li"));
	var userCommandElement=$.extend(true, {}, reportListElement.find(">li"));
	var receiverElement=$.extend(true, {}, receiverListElement.find(">li"));

        //initial values
        var setInfo=SetManager.getSetInfo();
        var set=SetManager.getSet();
	var users=SetManager.getUsers(); 
	var userKeys=Object.keys(users);
        var rowKey="";
	var searchText="";
	var userArg=Master.getVariable("u");
	var setArg=Master.getVariable("s");
	var commandArg=Master.getVariable("c");

	//initial functions
	if(Master.getVariable("schema")==null)
	{	
		loadCommands();
		loadUsers();
		loadSet();
		clearSelected(true);
		clearReceiver();
		commandStateDiv(false);
	}

	$(document).on("click", "#userListElement>.collection>.collection-item, #setListElement>.collection>.collection-item", function()

	{
		if(!$(this).hasClass("active"))
			addSelectItem($(this).attr("id"), $(this).find(">#nameLabel").html(), $(this).find(">img").attr("src"));
		else
			removeSelectItem($(this).attr("id"));
	});

	$(document).on("click", "#commandListElement>.collection>.collection-item", function()
	{
		commandStateDiv(true);	
		reportListElement.html("");
		var id=$(this).attr("id").substring(11);
		InterfaceAccess.loadReportsCommand(id, function(reports)
		{
			if(reports.trim()!="")
			{
				var reportArray=reports.split("<br />");
				for(var k=0;k<reportArray.length;k++)
				if(reportArray[k]!="")
				{
					try
					{
						var reportObj=JSON.parse(reportArray[k]);
						addReportCommand(reportObj.commandId, reportObj.publisher, reportObj.text, reportObj.timestamp);
					}
					catch(ex)
					{
						console.log(ex);
					}
				}
			}
			else
				addReportCommand();
		});	
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

	$("#searchButton").click(function()
	{
		searchText=$("#searchText").val();
		rowKey="";
		loadCommands();
	});

	$("#messageButton").click(function()
	{
		if(FormValidation.checkNotEmpty("messageText"))
		{
			var setArray=[];
			var userArray=[];

			if(!publishMode)
			{
				selectedListElement.find(">.content-icon").each(function()
				{
					var selectedId=$(this).attr("id");

					if(selectedId.startsWith("selected_set_"))
					{
						var selectedSet=set[selectedId.substring(13)];
						setArray.push(selectedSet.name);

						var setUsers=selectedSet.users;

						for(var i=0; i<setUsers.length; i++)
							if(userArray.indexOf(setUsers[i].jid)==-1)
								userArray.push(setUsers[i].jid);
					}
					else if(selectedId.startsWith("selected_user_"))
					{
						var selectedUser=StropheAccess.getJid(selectedId.substring(14));
						if(userArray.indexOf(selectedUser)==-1)
							userArray.push(selectedUser);
					}
				});
			}
			else
				setArray=[setInfo.publishNode];

			InterfaceAccess.saveCommand(Strophe.getNodeFromJid(StropheAccess.connection.jid), $("#messageText").val(), setArray.toString().replace(/,/g,';'), userArray.toString().replace(/,/g, ';'), function(commandId)
			{
				console.log("Command has saved to db: ", commandId);
				var commandReaders=[];

				for(var i=0; i<userArray.length; i++)
					commandReaders.push({name: userArray[i], timestamp: 0});

				addCommand(commandId, Strophe.getNodeFromJid(StropheAccess.connection.jid), $("#messageText").val(), setArray.toString().replace(/,/g,';'), new Date().getTime(), commandReaders, true);

				if(commandId!=null)
				{
					if(publishMode)
					{
						StropheAccess.publish(commandId, setInfo.publishNode, $("#messageText").val(), function(publishResult)
						{
							console.log("Command has published: ", publishResult);
						});
					}
					else if($("#sendXmppRadio").prop("checked"))
					{
						StropheAccess.sendMessage(commandId, userArray, $("#messageText").val());
					}
					else if($("#sendSmsRadio").prop("checked"))
					{
						SmsAccess.sendMessage(commandId, userArray, $("#messageText").val(), function(sendResult)
						{
							console.log(sendResult);

							for(var i=0; i<userArray.length; i++)
								InterfaceAccess.setCommandRead(commandId, userArray[i], "-1", function(result)
								{
									console.log("save sms user read: ", result);
								});
						});
					}
					else if($("#sendAllRadio").prop("checked"))
					{
						var onlineUserArray=[];
						var offlineUserArray=[];

						for(var i=0; i<userArray.length; i++)
							if(isOnline(userArray[i]))
								onlineUserArray.push(userArray[i]);
							else
								offlineUserArray.push(userArray[i]);
						
						SmsAccess.sendMessage(commandId, offlineUserArray, $("#messageText").val(), function(sendResult)
						{
							console.log(sendResult);

							for(var i=0; i<offlineUserArray.length; i++)
								InterfaceAccess.setCommandRead(commandId, offlineUserArray[i], "-1", function(result)
								{
									console.log("save sms user read: ", result);
								});
						});

						StropheAccess.sendMessage(commandId, onlineUserArray, $("#messageText").val());
					}

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
		setMode(mode);

		$("#configureButton").html($(this).find(">a").html());
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

	$("#receiverModal").modal(
	{
		onOpenStart: function(modal, trigger)
		{
			var userData=$(trigger).attr("data-users");
			var setData=$(trigger).attr("data-sets");
			var replayData=$(trigger).attr("data-replay");
			
			var userArray=userData.split(";");
			var replayDataArray=replayData.split(";");
			var replayArray={};

			for(var i=0; i<replayDataArray.length; i++)
			if(replayDataArray[i]!="")
			{
				var seperatorIndex=replayDataArray[i].indexOf(":");
				var jid=replayDataArray[i].substring(0, seperatorIndex);
				var timestamp=parseInt(replayDataArray[i].substring(seperatorIndex+1));

				replayArray[jid]=timestamp;
			}

			var resultReplayArray=[]; //name:received:replay
			var resultReadArray=[]; //name:received
			var resultSmsArray=[]; //name
			var resultOtherArray=[]; //name

			for(var i=0; i<userArray.length; i++)
			if(userArray[i]!="")
			{
				var seperatorIndex=userArray[i].indexOf(":");
				var jid=userArray[i].substring(0, seperatorIndex);
				var timestamp=parseInt(userArray[i].substring(seperatorIndex+1));

				if(timestamp!=0)
				{
					if(replayArray[jid]!=null)
						resultReplayArray.push({jid: jid, timestamp: timestamp, replay:replayArray[jid]});
					else
						if(timestamp!=-1)
							resultReadArray.push({jid: jid, timestamp: timestamp});
						else
							resultSmsArray.push(jid);
				}
				else
					resultOtherArray.push(jid);
			}

			for(var i=0; i<resultReplayArray.length; i++)
				addReceiverElement(resultReplayArray[i].jid, resultReplayArray[i].timestamp, resultReplayArray[i].replay);

			for(var i=0; i<resultReadArray.length; i++)
				addReceiverElement(resultReadArray[i].jid, resultReadArray[i].timestamp);

			for(var i=0; i<resultSmsArray.length; i++)
				addReceiverElement(resultSmsArray[i], -1);

			for(var i=0; i<resultOtherArray.length; i++)
				addReceiverElement(resultOtherArray[i], 0);

		
			if(setData!=null && setData!="")	
				$("#receiverSetLabel").html("تم إرسال الأمر للمجموعات التالية: "+setData);
			else
				$("#receiverSetLabel").html("");
		},

		onCloseEnd: function()
		{
			clearReceiver();
		}
	});

	StropheAccess.commandRead(function(event, commandId, from, timestamp)
	{
		M.toast({html: "تم قراءة الأمر من قبل المستخدم: "+from})
		var commandElement=$("#ehqCommand_"+commandId);
		var reader=commandElement.attr("data-users");
		reader=reader.replace(from+":0", from+":"+timestamp);
		commandElement.attr("data-users", reader);
	});

	StropheAccess.messageReceived(function(event, id, publisher, es, text, timestamp, rcvTimestamp, commandId)
	{
			console.log("Message has been received.", id, publisher, es, text, timestamp);

			if($("#ehqCommand_"+commandId).length>0)
			{
				M.toast({html: "تم الرد على أمر مرسل من قبل المستخدم "}+publisher);
				addReportCommand(commandId, publisher, text, rcvTimestamp);
			}

	});

	StropheAccess.presenceReceived(function(event, from, type)
	{
		var index=userKeys.indexOf(Strophe.getBareJidFromJid(from));
		var icon=$("#user_"+index);

		if(type==null)
			$("#user_"+index+">#statusDiv").removeClass("command-selector-offline").addClass("command-selector-online");
		else
			$("#user_"+index+">#statusDiv").removeClass("command-selector-online").addClass("command-selector-offline");
			
	});

	setArgs();
	$("#configureUl>li:first").click();

	//function region
	function setMode(mode)
	{
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
               		$("#reportListContainer").css("display", "block");
		}
		else
		{
			$("#commandListContainer").removeClass("m7").addClass("m12");
			$("#reportListContainer").css("display", "none");
		}
	}

	function isOnline(jid)
	{
		var index=userKeys.indexOf(jid);
		return $("#user_"+index).find("#statusDiv").hasClass("command-selector-online");
	}

	function clearSelected(useText)
	{
		var text;

		if(useText)
			text="<p class='content-info'>لم يتم تحديد أي مستخدم</p>";
		else	
			text="";
			
		selectedListElement.html(text);
		$("#messageButton").addClass("disabled");
	}

	function clearReceiver()
	{
		receiverListElement.html("");
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
			deliveryIconColor="black-text";
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
				deliveryIconColor="blue-text";
			}
			else
			{
				deliveryReport="تم استقبال الرسالة بتاريخ "+ DateProcessor.formatDate(new Date(timestamp));
				deliveryIcon="done";
				deliveryIconColor="green-text";
			}

			if(replayTimestamp!=null)
			{
				deliveryReport+=", وتم الرد على الرسالة بتاريخ "+ DateProcessor.formatDate(new Date(replayTimestamp));
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

		receiverElement.attr("id","");
		receiverElement.find(">#idLabel").html(Strophe.getNodeFromJid(jid) + " ("+name+").");
		receiverElement.find(">#reportLabel").html(deliveryReport);
		receiverElement.find(">#userImage").attr("src", logo);
		receiverElement.find(">#statusDiv>i").removeClass().addClass("material-icons").addClass(deliveryIconColor).html(deliveryIcon);

		receiverListElement.append(receiverElement.wrapAll("<li>").parent().html());
	}

	function addSelectItem(id, name, logo)
	{
		if(selectedListElement.has("p").length>0)
			clearSelected();

		var idPrefix="selected_";

		selectedElement.attr("id", idPrefix+id);
		selectedElement.find(">#selectedImage").attr("src", logo);
		selectedElement.find(">#selectedName").html(name);

		selectedListElement.append(selectedElement.wrapAll("<div>").parent().html());
		$("#"+id).addClass("active");

		if($("#messageButton").hasClass("disabled"))
			$("#messageButton").removeClass("disabled");
	}

	function addCommand(commandId, es, text, sets, timestamp, readers, addToTop)
	{
		ehqCommandElement.attr("id", "ehqCommand_"+commandId);
		ehqCommandElement.find(">#commandTextElement").html(text);
		ehqCommandElement.find(">#commandDateElement").html(DateProcessor.formatDate(new Date(timestamp)));
		if(readers!=null && readers.length>0)
		{
			var readerTokenString="";
			var readerString="";
			var userCount=2;

			for(var j=0;j<readers.length;j++)
			{
				var readerName=readers[j].name;
				var readerTimestamp=readers[j].timestamp;

				readerString+=readerName+":"+readerTimestamp+";";
			}

			ehqCommandElement.attr("data-users", readerString);
			ehqCommandElement.attr("data-sets", sets);
			ehqCommandElement.attr("data-replay", "");
		}
		
		if(addToTop)
			commandListElement.prepend(ehqCommandElement.wrapAll("<li>").parent().html());
		else
			commandListElement.append(ehqCommandElement.wrapAll("<li>").parent().html());

	}

	function addReportCommand(commandId, publisher, text, timestamp)
	{
		if(commandId!=null || publisher!=null || text!=null)
		{
			var jid=StropheAccess.getJid(publisher);
			var logo;

			if(users[jid]!=null)
				logo=users[jid].setLogo;
			else
				logo=SetManager.getEmptyUser().setLogo;

			userCommandElement.find(">#reportImageElement").attr("imgs", logo);
			userCommandElement.find(">#reportSenderElement").html(publisher);
			userCommandElement.find(">#reportTextElement").html(text);
			userCommandElement.find(">#reportDateElement").html(DateProcessor.formatDate(new Date(timestamp)));
			reportListElement.append(userCommandElement.wrapAll("<li>").parent().html());
		}
		else
			reportListElement.append("<p>لا يوجد ردود على الأمر المرسل</p>");
		
	}

	function  addSet(id, name, usersLength, logo, color)
	{
		setElement.attr("id", "set_"+id);
		setElement.find(">#nameLabel").html(name);

		if(usersLength!="")
			setElement.find(">#countDiv").text(usersLength + " مستخدم");
		else
			setElement.find(">#countDiv").text("");

		setElement.find(">#setImage").attr("src", logo)
		setElement.find(">#idLabel").val(id);
		setElement.css("background-color", ColorProcessor.getLightColor(color));
		setElement.css("border-color", color);
		setListElement.append(setElement.wrapAll("<li>").parent().html());
	}


	function removeSelectItem(id)
	{
		if(id.startsWith("selected_"))
			id=id.substring(9);

		selectedListElement.find("#selected_"+id).remove();
		$("#"+id).removeClass("active");

		if(selectedListElement.html()=="")
			clearSelected(true);
	}

	function loadUsers(startIndex=0, offset=0)
	{
		var set=SetManager.getSet();

		userListElement.html("");
		for(var key in set)
		{
			if(set[key].users!=null && set[key].users.length>0)
			{
				var logo=set[key].logo;
				var color=set[key].color;
				userHeaderElement.html(set[key].name);
				userHeaderElement.css("color", "white");
				console.log(set[key].color);
				userHeaderElement.css("background-color", ColorProcessor.getDarkColor(color));
				
				userListElement.append(userHeaderElement.wrapAll("<li>").parent().html());

				for(var i=0; i<set[key].users.length; i++)
				{
					var userItem=set[key].users[i];
					if(true /*userItem.available*/)
					{
						var id=Strophe.getNodeFromJid(userItem.jid);
						userElement.attr("id", "user_"+id);
						userElement.find(">#idLabel").html(id);
						userElement.find(">#nameLabel").html(userItem.name);
						userElement.find(">#userImage").attr("src", logo);
						userElement.css("background-color", ColorProcessor.getLightColor(color));
						userElement.css("border-color", color);
						userListElement.append(userElement.wrapAll("<li>").parent().html());
					}
				}
			}
		}
	}

	function loadSet()
	{
		$("#setTab>a").html(setInfo.types);
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
		{
			setItem=set[key];
			if(setItem.users.length>0)
				addSet(key, setItem.name, setItem.users.length, setItem.logo, setItem.color);
		}
	}


	function loadCommands()
	{
		if(rowKey=="")
		{
			commandListElement.html("");
			reportListElement.html("");
		}

		InterfaceAccess.loadCommands(searchText, rowKey, 10, function(commands)
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
						console.log(ex);
					}
				}
		});
	
	}

	function setArgs()
	{
		if(userArg!=null)
		{
			var users=userArg.split(";");
			var index;

			for(var i=0; i<users.length; i++)
			if(users[i]!="")
			{
				index=userKeys.indexOf(StropheAccess.getJid(users[i]));
				if(index>=0)
					$("#user_"+index).click();
				else
					console.log("cann't find user: ", users[i]);
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
				else
					console.log("cann't find set: ", sets[i]);
			}
		}

		if(setArg!=null && userArg==null)
			$(".tabs").tabs("select", "setListElement")
	}
});
