	var MAX_SMS_CHAR=180;
	var MAX_XMPP_CHAR=100000000;

	$(document).ready(function()
	{
		var icon=$('#iconsDiv>.input-icon');
		var user=$('#userList>.command-selector');
		var message=$('.command-outbox>.command-outbox-message');
		var command=$('#messagesDiv>.command-message');
		var publishMode=false;
		var allUsers="";
		var onlineUsers=[];
		var messageMode=0;

		$('#userList').html('<img class="status-loading input-loading"/>');
		$('#messagesDiv').html('<img class="status-loading input-loading"/>');
		$('#iconsDiv').html('');

		var b1=Master.getVariable('b1');
		var b2=Master.getVariable('b2');
		var b3=Master.getVariable('b3');
		var b4=Master.getVariable('b4');

		var names=[];

		$('#modal').modal();
		$('#xmppRadio').prop('checked',true)

		StropheAccess.connected(function()
		{
			StropheAccess.connection.addHandler(function(result)
			{
				try
				{
					if($(result).attr('type')=='error' && $(result).find('error').text()!='')
						FormValidation.writeError($(result).find('error').text(), 'resultLabel');
					console.log(result);
				}
				catch(ex)
				{
					console.log(ex);
				}
				return true;
			}, null, 'message'); 

			StropheAccess.connection.addHandler(function(pres)
			{
				var from=Strophe.getNodeFromJid($(pres).attr('from'));
				var type=$(pres).attr('type');

				if(type==undefined)
				{
					if(onlineUsers.indexOf(from)==-1)			
					{
						onlineUsers.push(from);
						console.log(from+" switched to online");
					}

					$('#user_'+from+'>div').removeClass('command-selector-offline').addClass('command-selector-online');
				}
				else if(type=="unavailable")
				{
					if(onlineUsers.indexOf(from)>=0)
					{
						onlineUsers.splice(onlineUsers.indexOf(from), 1);
						console.log(from+" switched to offline");
					}

					$('#user_'+from+'>div').removeClass('command-selector-online').addClass('command-selector-offline');
				}

				return true;
			}, null, 'presence');
				  
		});

		$('#iconsDiv').on('click','.input-icon', function()
		{
			if(!publishMode)
			{
				var name=$(this).find('label').html();
				var index=names.indexOf(name);
				if(index>=0)
					names.splice(index,1);
				$('#'+$(this).attr('id').substring(4)).removeClass('command-selector-selected');
				$(this).remove();
				//console.log(names);
			}
			else
			{
				setMessageMode();
			}
		});

		$('#userList').on('click', '.command-selector',function()
		{
			if(publishMode) return;

			var name=$(this).find('label').html();
			var index=names.indexOf(name);
			if(index==-1)
			{
				$(this).addClass('command-selector-selected');
				icon.attr('id','sel_'+$(this).attr('id'));
				icon.find('label').html(name);
				icon.find('img').attr('src',$(this).find('img').attr('src'));
				$('#iconsDiv').append(icon.wrapAll('<div>').parent().html());
				names.push(name);
			}
			else
			{
				$(this).removeClass('command-selector-selected');
				$('#sel_'+$(this).attr('id')).remove();
				names.splice(index,1);
			}

			//console.log(names);
		});

		$('.command-outbox').on('click', '.command-outbox-message', function()
		{
			var node=$(this).find('label').html();
			setPublishMode('commands');
		});

		$('#searchText').keyup(function()
		{
			if($(this).val()=="")
				$('.command-selector').show();
			else
			{
				var regexp=new RegExp($(this).val());
				$('.command-selector').show().each(function()
				{
					if(!regexp.test($(this).find('label').text()))
						$(this).hide();
				});
			}
		});

		$('#selectAllCheck').click(function()
		{
			if(publishMode) return false;

			$('#iconsDiv').html('');
			$('.command-selector').removeClass('command-selector-selected');
			names=[];

			if($(this).prop('checked'))
				$('.command-selector:visible').click();

			//console.log(names);
		});

		$('#smsRadio').click(function()
		{
			messageMode=1;
			$('#sendButton>img').attr('src','imgs/sms.png');
			$('#sendText').prop('maxlength', MAX_SMS_CHAR);
		});

		$('#xmppRadio').click(function()
		{
			messageMode=0;
			$('#sendButton>img').attr('src','imgs/xmpp.png');
			$('#sendText').prop('maxlength', MAX_XMPP_CHAR);
		});

		$('#smsXmppRadio').click(function()
		{
			messageMode=2;
			$('#sendButton>img').attr('src','imgs/sms_xmpp.png');
			$('#sendText').prop('maxlength', MAX_SMS_CHAR);
		});

		$('#settingButton').click(function()
		{
			$('#modal').modal('open');
		});

		$('#sendText').on('input', function()
		{
			if(messageMode!=0)
			{
				$('#resultLabel').html($(this).val().length + '/' + MAX_SMS_CHAR);
			}
			else
				$('#resultLabel').html('');
		});

		$('#sendButton').click(function()
		{
			if(FormValidation.checkNotEmpty('sendText','resultLabel') && FormValidation.checkNotEmpty('iconsDiv','resutlLabel'))
			{
				var sendText=$('#sendText').val();
				var commandId=(new Date()).getTime();
				if(publishMode)
				{
					var targetNode=$('#iconsDiv').find('label').html();
					StropheAccess.publish(commandId, targetNode, sendText, function(result)
					{
						if($(result).attr('type')=='error')
							FormValidation.writeError($(result).find('error').text(), 'resultLabel');
						console.log('result: ',result);
					});
					InterfaceAccess.addCommand(commandId, Strophe.getNodeFromJid(StropheAccess.connection.jid), targetNode, sendText, "");
					FormValidation.writeLog('تم نشر الأمر بنجاح.','resultLabel');
				}
				else
				{
					//FormValidation.writeLog('جاري الإرسال.','resultLabel');
					if(messageMode==0)
					{
						var max=100;
						var usersArray;

						var phaseCount=Math.ceil(names.length/max);
						console.log(phaseCount);

						//send message
						phase=0;
						
						function send()
						{
							if(phase>=phaseCount)
								return;
								
							usersArray=[];
							for(var i=phase*max;i<max*(phase+1);i++)
							{
								if(i>=names.length)
									break;
								
								usersArray.push(names[i]);
							}
							
							if(usersArray.length>0)
							{
								console.log(sendText);
								console.log('sending to names(',usersArray.length,'):',usersArray);
								StropheAccess.sendMessage(commandId, usersArray, sendText);
							}

							phase++;
							setTimeout(function(){send();}, 1000);
						}
						send();

						var usersString='';
						for(var i=0;i<names.length;i++)
							usersString+=names[i]+';';

						InterfaceAccess.addCommand(commandId, Strophe.getNodeFromJid(StropheAccess.connection.jid), "", sendText, usersString);
						FormValidation.writeLog('تم الإرسال بنجاح.','resultLabel');
					}
					else if(messageMode==1)
					{
						SmsAccess.sendMessage(commandId, names, sendText, function(result)
						{
							console.log(result);
						});

						InterfaceAccess.addCommand(commandId, Strophe.getNodeFromJid(StropheAccess.connection.jid), "", sendText, usersString);
					}
					else if(messageMode==2)
					{
						InterfaceAccess.addCommand(commandId, Strophe.getNodeFromJid(StropheAccess.connection.jid), "", sendText, usersString);
						var onlineList=[];
						var offlineList=[];

						for(var i=0;i<names.length;i++)
							if(onlineUsers.indexOf(names[i])>=0)
								onlineList.push(names[i]);
							else
								offlineList.push(names[i]);

						SmsAccess.sendMessage(commandId, offlineList, sendText, function(result)
						{
							console.log(result);
						});

						StropheAccess.sendMessage(commandId, onlineList, sendText);

								
					}
				}

				$('#sendText').val('');
			}
		});

		//load messages
		InterfaceAccess.loadCommands("0","0", function(result)
		{
			$('#messagesDiv').html('');
			if(result!=null && result.trim()!="")
			{
				if(result=='There are no privileges!')
					window.location.replace('nonePrivileges.html');
				var commands=result.split("<br />");
				for(var i=0;i<commands.length;i++)
					if(commands[i]!="")
					{
						var commandObj=JSON.parse(commands[i]);
						command.find('.command-message-text').html(commandObj.text);
						command.find('.command-message-date').html(commandObj.date);
						$('#messagesDiv').append(command.wrapAll('<div>').parent().html());
					}
			}
		});

		SessionAccess.getSessionRoleId(function(role)
		{
			if(role!=1)
				$('.command-outbox-message').remove();
				
		});

		//load users
		StropheAccess.connected(function()
		{
			var paramUsers=Master.getVariable('u');
			
			if(Master.getVariable('type')!=null)
				paramUsers=localStorage.getItem('usersString');

			StropheAccess.getNodes(function(nodes)
			{
				$('#userList').html('');
				//$('.command-outbox').html('');
				var nodesCount=$(nodes).find('affiliation').length;
				$(nodes).find('affiliation').each(function(index1)
				{
					var node=$(this).attr('node');
					console.log('node:'+node);
					//add icons area
					if(true)
					{
						//add node
						//message.find('label').html(node);
						//message.find('img').attr('src','imgs/node/'+node+'.png');	
						//$('.command-outbox').append(message.wrapAll('<div>').parent().html());					
						//add users to area
						StropheAccess.getUsers(node, function(users)
						{
							var usersCount=$(users).find('affiliation').length;
							$(users).find('affiliation').each(function(index2)
							{
								if($(this).attr('affiliation')=='publisher' && $(this).attr('jid')!='updater@ekhtar.sy')
								{
									var jid=$(this).attr('jid');
									var name=Strophe.getNodeFromJid(jid);
									user.attr('id','user_'+name);
									user.find('label').html(name);
									user.find('img').attr('src','imgs/node/'+node+'.png');
									$('#userList').append(user.wrapAll('<div>').parent().html());

									if(onlineUsers.indexOf(name)>=0)
										user.find('>div').removeClass('command-selector-offline').addClass('command-selector-online');
									else
										user.find('>div').removeClass('command-selector-online').addClass('command-selector-offline');

									allUsers+=name+";";

									//check user param
									if(paramUsers!=null && paramUsers!="")
										if(paramUsers.indexOf(name+';')>=0)
											$('#user_'+name).click();
								}

								if(index1==nodesCount-1 && index2==usersCount-1 && b1!=null && b2!=null && b3!=null && b4!=null)
								{
									$('#iconsDiv').html("<img class='status-loading input-loading'/>");
									InterfaceAccess.getUsersLastPointByCoordinate(allUsers, '1-1-1970 12:00:00', '1-1-2018 12:00:00', b1, b2, b3, b4, function(responseText)
									{
										console.log(responseText);
										myarr = responseText.split('<br />');

										$('#iconsDiv').html("");

										if (myarr.length > 0)
										{
											for (var i = 0; i < myarr.length; i++)
											if(myarr[i]!='')
											{
												console.log(myarr[i]);
												obj = JSON.parse(myarr[i]);
												var name=obj.Publisher;
												$('#user_'+name).click();
											}
										}
									});
								}
							});
						});
					}
				});
			});
		});

		function setPublishMode(node)
		{
			publishMode=true;

			$('#selectAllCheck').prop("checked",false)
			names=[];
			$('.command-selector').removeClass('command-selector-selected');

			icon.attr('id','publish');
			icon.find('label').html(node);
			icon.find('img').attr('src','imgs/node/'+node+'.png');

			$('#iconsDiv').html(icon.wrapAll('<div>').parent().html());
			$('#sendButton').find('img').attr('src','imgs/publish.png');
			$('#sendButton').find('label').html('نشر');
		}

		function setMessageMode()
		{
			publishMode=false;
		$('#iconsDiv').html('');
		$('#sendButton').find('img').attr('src','imgs/command.png');		
		$('#sendButton').find('label').html('ارسال');
	}

});
