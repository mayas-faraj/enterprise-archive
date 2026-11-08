$(document).ready(function()
{
	//constant region
	var SMS_MAX_LENGTH=190;
	var XMPP_MODE=1;
	var SMS_MODE=2;

	//materialize initial
	$("select").formSelect()
	$(".dropdown-trigger").dropdown({autoTrigger: true, constrainWidth: false, coverTrigger: false, hover: true});
	$('#deleteModal').modal(
	{
		onOpenStart: function(modal, trigger)
		{
			$(modal).find("span").html($("#nameText").val());
		}
	});

	$('#sendCommandModal').modal(
	{
		onOpenStart: function(modal, trigger)
		{
			$("#configureUl>li:first").click();
			var receiver=$(trigger).attr("data-user");
			if(receiver.startsWith("set:"))
			{
				var setId=receiver.substring(4);
				$("#commandUserLabel").attr("data-set", setId);
				$(modal).find("#commandUserLabel").html(SetManager.getSetInfo().theType+ " " +sets[setId].name);
			}
			else
			{
				$("#commandUserLabel").attr("data-set", "");
				$(modal).find("#commandUserLabel").html(receiver);
			}

				
		}
	});



	//default values
	defaultUserImage=$("#userImage").attr("src");
	var initialTitleCard=$("#titleCardLabel").html();
	var initialImageCard=$("img.content-set-card-image").attr("src");
	var sets=SetManager.getSet();
	var setUsers=SetManager.getUsers();
	var querySchema=Master.getVariable("schema");
	var querySet=Master.getVariable("set");
	var queryUser=Master.getVariable("id");

	//parsing template
	var setListElement=$("#setListElement");
	var setElement=setListElement.find(">#setElement");
	var userListElement=setElement.find(">#userListElement");
	var iconUser=$.extend(true, {}, setElement.find(".content-icon"));

	//initial values	
	$("#setListElement .left.orange-text").css("display", "none");

	if(querySchema==null)
	{
		var node;
		setMode();
		initialSets();
		setupCard(querySet);
		setupSets(querySet);

		if(querySet!=null)
		{
			toggleEditable();
			if(sets[querySet]!=null)
				addSet(querySet, sets[querySet].name, sets[querySet].color, sets[querySet].logo, sets[querySet].users);
			else
				window.location.href="nonePrivileges.html";

			$("#setListElement.collapsible").collapsible("open", "0")
			$("#displayAllDiv span").html(SetManager.getSetInfo().theTypes);
		}
		else
		{
			addSets();
			$("#displayAllDiv").remove();

			if(queryUser!=null)
			{
				var queryIcon=$("#user_"+queryUser);
				setMode(queryIcon.attr("id").substring(5),
					queryIcon.find("label:first").text(),
					queryIcon.find("input").val(),
					queryIcon.find("img").attr("src"));
			}
		}
	
		SessionAccess.getManageUsersPrivilege(function(hasUserPrivilege)
		{
			if(hasUserPrivilege!="1")
			{
				$("#editUserDiv").remove();
				$("#selectUserDiv").removeClass("m6").removeClass("l7");
				$(".content-icon").css("cursor", "auto");
				$("#editButton").remove();
			}
		});

		SessionAccess.getSessionUser(function(user)
		{
			node=user;
		});

		Validator.validateInputNumber($("#idText"));
	}

	//click event
	$(document).on('click', '.content-icon', function()
	{
		if(!$("#editUserDiv").hasClass("hide"))
			setMode($(this).attr("id").substring(5),
				$(this).find("label:first").text(),
				$(this).find("input").val(),
				$(this).find("img").attr("src"));
	});

	$(document).on("mouseenter", ".content-collapsible .content-icon-panel", function()
	{
		$(this).addClass("content-icon-panel-active")
	});

	$(document).on("mouseleave", ".content-collapsible .content-icon-panel", function()
	{
		$(this).removeClass("content-icon-panel-active")
	});

	$(document).bind("searchCompleted", function()
	{
		var collapsible=M.Collapsible.getInstance($("#setListElement.collapsible"));

		if($("#searchText").val()=="")
		{
			collapsible.options.accordion=true;
			$("#setListElement .left.orange-text").css("display", "none");

			for(var i=0; i<$("#setListElement>li").length; i++)
				collapsible.close(i);

			$("#setListElement>li").removeClass("filter-jid");
		}
		else
		{
			$("#setListElement .left.orange-text").css("display", "");
			collapsible.options.accordion=false;


			$("#setListElement>li").each(function(index)
			{
				var resultCount=$(this).find(".content-icon:not(.hide)").length;
				$(this).find(".left.orange-text>span").html(resultCount);

				if(resultCount>0)
				{
					collapsible.open(index);
					$(this).removeClass("filter-jid");
				}
				else
				{
					collapsible.close(index);
					$(this).addClass("filter-jid");
				}
			});
		}
	});


	$("#createButton").click(function()
	{
		setMode();
	});

	$("#editButton").click(function()
	{
		toggleEditable();
	});

	$("#confirmDeleteButton").click(function()
	{
		var jid=StropheAccess.getJid($("#idText").val());
		var name=$("#nameText").val();
		
		if(jid!="")
		{
			StropheAccess.unRegisterUser(node, jid, function(nodeResult)
			{
				StropheAccess.sendMessage((new Date()).getTime(), ["ehq@ekhtar.sy"], '<roster>{"id":"'+(new Date()).getTime()+'", "jid":"'+jid+'", "name": "'+name+'","command": "delete"}');
				InterfaceAccess.countReportsByUsers(Strophe.getNodeFromJid(jid), "0", function(count)
				{	
					if(count!="0")
						StropheAccess.saveRosterItem(jid, name, "-1", function()
						{
							setMode();
							M.toast({html: "<i class='material-icons'>check_circle</i>تم حجب المستخدم ("+name+") بنجاح لوجود بلاغات مرسله من قبله.", classes: "toast-success"});
							StropheAccess.presenceUnsubscribed(jid, function()
							{
								//console.log("jid unsubscribe from presence:", jid);
							});
						});
					else
						StropheAccess.deleteRosterItem(jid, function()
						{
							setMode();
							M.toast({html: "<i class='material-icons'>check_circle</i>تم حذف المستخدم ("+name+") بنجاح.", classes: "toast-success"});
							//console.log("jid deleted completely: ", jid);
						});
				});
			});
		}
		else
		{
			M.toast({html: "<i class='material-icons'>cancel</i>لم يتم تحديد مستخدم.", classes: "toast-error"});	
		}
	});

	$("#sendCommandButton").click(function()
	{
		if(Validator.validateHasValue($("#commandText")))
		{
			var commandText=$("#commandText").val();
			var commandSet=$("#commandUserLabel").attr("data-set");
			if(commandSet==null)
				commandSet="";

			var commandUsers=[];
			if(commandSet!="")
			{
				var users=sets[commandSet].users;

				for(var i=0; i<users.length; i++)
					if(users[i].available)
						commandUsers.push(Strophe.getNodeFromJid(users[i].jid));
			}
			else
				commandUsers=[$("#commandUserLabel").html()];

			if(commandUsers.length>0)
				InterfaceAccess.saveCommand(Strophe.getNodeFromJid(StropheAccess.connection.jid), commandText, commandSet, commandUsers.toString().replace(/,/g, ";"), function(commandId)
				{
					//console.log("Command has saved to db: ", commandId);
					if(commandId!=null)
					{
						var mode=parseInt($("#configureButton").attr("data-mode"));
						if(mode==XMPP_MODE)
						{
							StropheAccess.sendMessage(commandId, commandUsers, commandText);
						}
						else if(mode==SMS_MODE)
						{
							SmsAccess.sendMessage(commandId, commandUsers, commandText, function(sendResult)
							{
								//console.log(sendResult);

								for(var i=0; i<commandUsers.length; i++)
									InterfaceAccess.setCommandRead(commandId, commandUsers[i], "-1", function(result)
									{
										//console.log("save sms user read: ", result);
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
			else
				M.toast({html: "لا يوجد مستخدمين فعالين لإستقبال الأمر", classes: "toast-error"});
				
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

	$("#displayAllDiv a").click(function()
	{
		setupCard();
		setupSets();
		initialSets();
		addSets();
		
		$("#displayAllDiv").remove();
	});

		StropheAccess.presenceReceived(function(event, from, type)
		{
//console.log("event: ",from, type);
			//console.log("pres", from, type);
			var id=Strophe.getNodeFromJid(from);
			var increamental=0;

			if(type==null)
			{
				$("#user_"+id+">#statusDiv").removeClass("content-icon-exclamation").removeClass("content-icon-offline").addClass("content-icon-online");
				increamental=1;
			}
			else if(type=="unavailable")
			{
				$("#user_"+id+">#statusDiv").removeClass("content-icon-exclamation").removeClass("content-icon-online").addClass("content-icon-offline");
				increamental=-1;
			}

			var setUser=setUsers[StropheAccess.getJid(id)]
			var setId;

			if(setUser!=null)
				setId=setUser.setId;
			else
				setId=null;

			if(increamental!=0)
				updateOnlineUserCountStatistics(setId, increamental);

		});

		StropheAccess.rosterUpdated(function(event, jid, name, setId, isAvailable, isRemoved)
		{

			//console.log("roster updated:" ,jid, name, setId, isAvailable, isRemoved);
			var id=Strophe.getNodeFromJid(jid);
			var userIcon=$("#user_"+id);

			//validate set id
			if(isRemoved)
				setId=setUsers[jid].setId;
			else
				if(setId==null || setId=="")
					setId=0;

			setUsers=SetManager.getUsers();
			sets=SetManager.getSet();	
			
			if(!isRemoved)
			{
				var logo=sets[setId].logo;

				if(userIcon.length>0)
				{
					var isOnline=userIcon.find("#statusDiv").hasClass("content-icon-online");
					var currentSetId=userIcon.find("input").val();
					if(currentSetId!=setId)
					{
						//remove the user icon
						userIcon.remove();
						updateUserCountStatistics(currentSetId, isAvailable, -1);
						if(isOnline)
							updateOnlineUserCountStatistics(currentSetId, -1);

						//add new user icon
						addSetUser(setId, id, name, isAvailable, logo)
						updateUserCountStatistics(setId, isAvailable, 1);

						if(isOnline)
							updateOnlineUserCountStatistics(setId, 1);

						if(isAvailable && isOnline)
							$("#user_"+id).find("#statusDiv").removeClass("content-icon-exclamation").removeClass("content-icon-offline").addClass("content-icon-online");
					}
					else
					{
						userIcon.find("label").html(name);
						var currentAvailable=!userIcon.find("#statusDiv").hasClass("content-icon-exclamation");

						if(!currentAvailable && isAvailable)
						{
							var amount=currentAvailable?-1:1;
							updateUserCountStatistics(null, false, -amount);
							updateUserCountStatistics(null, true, amount);
						}

//console.log("st2: ", isAvailable, isOnline, id);
						if(isAvailable)
						{
							userIcon.find("#statusDiv").removeClass("content-icon-exclamation");
							if(isOnline)
								userIcon.find("#statusDiv").addClass("content-icon-online");
							else
								userIcon.find("#statusDiv").addClass("content-icon-offline");
						}
						else
							userIcon.find("#statusDiv").removeClass("content-icon-offline").removeClass("content-icon-online").addClass("content-icon-exclamation");
					}
				}
				else
				{
					addSetUser(setId, id, name, isAvailable, logo)
					updateUserCountStatistics(setId, isAvailable, 1);
				}
			}
			else
			{

				var isOnline=userIcon.find("#statusDiv").hasClass("content-icon-online");

				userIcon.remove();	
				updateUserCountStatistics(setId, isAvailable, -1);
				if(isOnline)
					updateOnlineUserCountStatistics(setId, -1);
			}
		});

		$("#saveButton, #unblockButton").click(function()
		{
			if(Validator.validatePhoneId($("#idText")) && Validator.validateHasValue($("#nameText")))
			{
				var id=$("#idText").val();
				var name=$("#nameText").val();
				var group=$("#groupSelect").val();

				var selectedId=$("#selectedIdInput").val();
				var selectedName=$("#selectedNameInput").val();
				var selectedGroup=$("#selectedGroupInput").val();

				var saveMode=$(this).attr("id")=="saveButton";

				if(!saveMode)
				{
					name=selectedName;
					group="";
				}
				else if($("#groupSelect").attr("disabled"))
				{
					group=selectedGroup=SetManager.DELETED_SET_ID;
				}

				if(name!=selectedName || group!=selectedGroup)
				{
					var jid=StropheAccess.getJid(id);

					XmppAccess.checkJidInNodes(jid, function(exists)
					{
						if(exists.indexOf('1')==-1 || (selectedId!="" && (selectedGroup!=SetManager.DELETED_SET_ID || saveMode)))
						{
							$("#saveButton").addClass("disabled");
							StropheAccess.saveRosterItem(jid, name, group, function(rosterResult)
							{
								//console.log("Roster has been saved: ", rosterResult);

								if((name!=selectedName && selectedGroup!=SetManager.DELETED_SET_ID) || (group!=selectedGroup && selectedGroup==SetManager.DELETED_SET_ID && name==selectedName))
									StropheAccess.sendMessage((new Date()).getTime(), ["ehq@ekhtar.sy"], '<roster>{"id":"'+(new Date()).getTime()+'", "jid":"'+jid+'", "name":"'+name+'", "available":'+(selectedId!="" && selectedGroup!=SetManager.DELETED_SET_ID).toString()+'}');
								else if(name!=selectedName && selectedGroup==SetManager.DELETED_SET_ID && exists.indexOf('1')==-1)
									StropheAccess.sendMessage((new Date()).getTime(), ["ehq@ekhtar.sy"], '<roster>{"id":"'+(new Date()).getTime()+'", "jid":"'+jid+'", "name":"'+name+'", "command":"delete"}');

								if(selectedId=="" || (selectedGroup==SetManager.DELETED_SET_ID && !saveMode))
								{
									StropheAccess.presenceSubscribe(jid, function(subscribeResult)
									{
										//console.log("Presence subscribe");
									});

									InterfaceAccess.saveUser(id,function(result)
									{
										//console.log("interface callback: "+result);
									});

									StropheAccess.registerUser(node, jid, function(iq)
									{
										//console.log("User has been registerd to node: ", iq);
										//setMode();
										$("#user_"+id).click();
										$("#saveButton").removeClass("disabled")

										if(selectedGroup==SetManager.DELETED_SET_ID)
											M.toast({html: "<i class='material-icons'>check_circle</i>تم استعادة المستخدم ("+name+") بنجاح.", classes: "toast-success"});
										else
											M.toast({html: "<i class='material-icons'>check_circle</i>تم إضافة المستخدم ("+name+") بنجاح.", classes: "toast-success"});
									});
								}
								else
								{
									$("#saveButton").removeClass("disabled");

									M.toast({html: "<i class='material-icons'>check_circle</i>تم تعديل المستخدم ("+name+") بنجاح.", classes: "toast-success"});
									//setMode();
									$("#user_"+id).click();
								}
							});
						}
						else
							if(setUsers[jid]!=null && setUsers[jid].setId!=SetManager.DELETED_SET_ID)
								M.toast({html: "<i class='material-icons'>cancel</i>المستخدم "+id+" مضاف مسبقاُ.", classes: "toast-error"});
							else
								M.toast({html: "<i class='material-icons'>cancel</i>المستخدم "+id+" ينتمي إلى جهة أُخرى حالياً.", classes: "toast-error"});
					});
				}
				else
					M.toast({html: "<i class='material-icons'>info</i>لم يتم إجراء أي تغيير على المستخدم (" + id + ").", classes: "toast-exclamation"});
			}
			
		});

		function setupSets(querySet)
		{
			$("#groupSelect>option.circle").remove();
			$("#filterSetSelect>option.circle").remove();

			if(Object.keys(sets).length>0)
				for(var set in sets)
				{
					if(set>0)
						if(querySet==null || querySet==set)
						$("#groupSelect").append("<option class='left circle' value='"+set+"' data-icon='"+sets[set].logo+"'>"+sets[set].name+"</option>");
					$("#filterSetSelect").append("<option selected class='left circle' value='"+set+"' data-icon='"+sets[set].logo+"'>"+sets[set].name+"</option>");
				}
			else
			{
				$("#groupSelect").append("<option>لا يوجد مجموعات</option>");
				$("#filterSetSelect").append("<option>لا يوجد "+SetManager.getSetInfo().types()+"</option>");
			}

			if(querySet==null)
			{
				$("#groupSelect").val("").prop("disabled", false).formSelect();	
				$(".filter-field").css("display", "");
			}
			else
			{
				$("#groupSelect").val(querySet).prop("disabled", true).formSelect();	
				$(".filter-field").css("display", "none");
			}

			$("#filterSetSelect").formSelect();
			addSelectAll($("#filterSetSelect"));
		}

		function setupCard(setId)
		{
			$("#userCardCountLabel").html("0");
			$("#registeredCardCountLabel").html("0");
			$("#onlineCardCountLabel").html("0");

			if(setId==null)
			{
				$("#titleCardLabel").html(initialTitleCard);
				$("#dateCardLabel").css("display", "none");
				$("#descriptionCardLabel").css("display", "none");
				$("img.content-set-card-image").attr("src", initialImageCard);
//console.log(initialImageCard);
				
			}
			else
			{
				$("img.content-set-card-image").attr("src", sets[setId].logo);
				$("#titleCardLabel").html(sets[setId].name);
				$("#descriptionCardLabel").html(sets[setId].description);
				$("#dateValueCardLabel").attr("data-tooltip", moment(sets[setId].date).format(DATE_ICON_FORMAT)).html(moment(sets[setId].date).fromNow());

			}
		}

		function updateUserCountStatistics(setId, isAvailable, amount)
		{
//console.log(setId, isAvailable, amount);
			if(setId!=null)
			{
				var setElement=$("#set_"+setId);
				if(setElement.length>0)
				{
					var setUserCountLabel=setElement.find("#setUserCountLabel");
					var count=parseInt(setUserCountLabel.html());
					setUserCountLabel.html(count+amount);

					
					if(setId!=SetManager.DELETED_SET_ID)
						if(count+amount>0)
							setElement.find("#setCommandButton, #setReportButton").removeClass("disabled");
						else
							setElement.find("#setCommandButton, #setReportButton").addClass("disabled");
				}
			}

			if(setId!=SetManager.DELETED_SET_ID)
			{
				var userCardCountLabel=$("#userCardCountLabel");
				userCardCountLabel.html(parseInt(userCardCountLabel.html())+amount);

				if(isAvailable)
				{
					var registeredCardCountLabel=$("#registeredCardCountLabel");
					registeredCardCountLabel.html(parseInt(registeredCardCountLabel.html())+amount);
				}
			}
		}

		function updateOnlineUserCountStatistics(setId, amount)
		{
			if(setId!=SetManager.DELETED_SET_ID)
			{
				//update set status
				if(setId!=null)
				{
					var setElement=$("#set_"+setId);
					if(setElement.length>0)
					{
						var onlineLabel=setElement.find("#setOnlineUserCountLabel");
						onlineLabel.html(parseInt(onlineLabel.html()) +amount);
					}
				}

				//update card status
			var onlineCardCountLabel=$("#onlineCardCountLabel");
			onlineCardCountLabel.html(parseInt(onlineCardCountLabel.html()) +amount);
		}
	}

	function initialSets()
	{
		setListElement.html("");
		setListElement.collapsible();
	}

	function addSets()
	{
		for(var key in sets)
			if(key!=SetManager.DELETED_SET_ID)
				addSet(key, sets[key].name, sets[key].color, sets[key].logo, sets[key].users);

		if(sets[SetManager.DELETED_SET_ID]!=null)
			addSet(SetManager.DELETED_SET_ID, sets[SetManager.DELETED_SET_ID].name, sets[SetManager.DELETED_SET_ID].color, sets[SetManager.DELETED_SET_ID].logo, sets[SetManager.DELETED_SET_ID].users);

		//special block set status
		var blockSetElement=$("#set_"+SetManager.DELETED_SET_ID);
		if(blockSetElement.length>0)
		{
			blockSetElement.find(".content-collapsible-button, .left:nth-child(5)").remove();
		}
	}

	function addSet(id, name, color, logo, users)
	{
		setElement.attr("id", "set_"+id);
		setElement.find("#setName").html(name);
		setElement.find("#setReportButton").attr("href", "reports.html?set="+id).addClass("disabled");
		setElement.find("#setCommandButton").attr("data-user", "set:"+id).addClass("disabled");
		setElement.find("#userListElement").html("<p class='content-collapsible-body-note'>لا يوجد مستخدمين</p>");

		setListElement.append(setElement.get(0).outerHTML);

		if(users!=null)
		{
			for(var i=0; i<users.length; i++)
			{
				addSetUser(id, Strophe.getNodeFromJid(users[i].jid), users[i].name, users[i].available, logo);
				updateUserCountStatistics(id, users[i].available, 1);
			}
		}
	}

	function addSetUser(setId, id, name, available, logo)
	{
		var userSetElement=$("#set_"+setId);
		
		if(userSetElement.length>0)
		{
			if(name==null || name=="")
				name=id;

			iconUser.attr("id", "user_" + id);
			iconUser.find(">label").attr("data-tooltip", id).text(name);
			iconUser.find(">img").attr("src", logo)
			iconUser.find(">input").val(setId);

			iconUser.find(">#panelDiv>#reportsButton").attr("href", "reports.html?id="+id);
			iconUser.find(">#panelDiv>#commandButton").attr("data-user",id);
//console.log("add set: ", setId, name);
			if(available && setId!=SetManager.DELETED_SET_ID)
			{
				iconUser.find(">#statusDiv").removeClass("content-icon-exclamation").addClass("content-icon-offline");
				iconUser.find(">#panelDiv>#commandButton").removeClass("disabled");
			}
			else
			{
				iconUser.find(">#statusDiv").removeClass("content-icon-offline").addClass("content-icon-exclamation");
				iconUser.find(">#panelDiv>#commandButton").addClass("disabled");
			}


			var iconUserCount=userSetElement.find(".content-icon").length;

			//remove note item
			if(iconUserCount==0)
				userSetElement.find("#userListElement").html("");

			userSetElement.find("#userListElement").append(iconUser.get(0).outerHTML);

			$("#user_"+id).find(">label").tooltip();
		}
	}

	function toggleEditable()
	{
		if(!$("#editUserDiv").hasClass("hide"))
		{
			$("#editUserDiv").addClass("hide");
			$("#selectUserDiv").removeClass("m6").removeClass("l7");
			$(".content-icon").css("cursor", "auto");
		}
		else
		{
			$("#editUserDiv").removeClass("hide");
			$("#selectUserDiv").addClass("m6").addClass("l7");
			$(".content-icon").css("cursor", "");
		}
	}

});

function setMode(id, name, groupId, groupLogo)
{
	if(id==null)
	{
		$("#idText").val("");
		$("#nameText").val("");
		$("#userImage").attr("src", defaultUserImage);
		$("#groupSelect").val(null);

		$("#selectedIdInput").val("");
		$("#selectedNameInput").val("");
		$("#selectedGroupInput").val("");

		$("#idText").removeAttr("readonly");

		$("#createButton").addClass("disabled");
		$("#deleteButton").addClass("disabled");
		$("#viewButton").addClass("disabled");

		$("#unblockButton").addClass("hide");
		$("#deleteButton").removeClass("hide");

		$("#groupSelect").prop("disabled", false);
	}
	else
	{
		$("#idText, #selectedIdInput").val(id);
		$("#nameText, #selectedNameInput").val(name);
		$("#userImage").attr("src", groupLogo);

		if(groupId!=SetManager.DELETED_SET_ID)
		{
			$("#groupSelect").val(groupId);
			$("#unblockButton").addClass("hide");
			$("#deleteButton").removeClass("hide");
			$("#groupSelect").prop("disabled", false);
		}
		else
		{
			$("#groupSelect").val(null);
			$("#unblockButton").removeClass("hide");
			$("#deleteButton").addClass("hide");
			$("#groupSelect").prop("disabled", true);
		}

		$("#selectedGroupInput").val(groupId);

 		$("#idText").attr("readonly", true);

		$("#createButton").removeClass("disabled");
		$("#deleteButton").removeClass("disabled");
		$("#viewButton").removeClass("disabled");
	}

	M.updateTextFields();
	$("#groupSelect").formSelect();
}

