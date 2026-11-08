$(document).ready(function()
{
	var icon=$('#iconsDiv>.input-icon');
	var user=$('#userList>.command-selector');
	var message=$('.command-outbox>.command-outbox-message');
	var command=$('#messagesDiv>.command-message');
	var publishMode=false;
	var allUsers="";

	$('#userList').html('<img class="status-loading input-loading"/>');
	$('#messagesDiv').html('<img class="status-loading input-loading"/>');
	$('#iconsDiv').html('');

	var node=Master.getVariable('n');
	var b1=Master.getVariable('b1');
	var b2=Master.getVariable('b2');
	var b3=Master.getVariable('b3');
	var b4=Master.getVariable('b4');

	if(node!=null && node!="")
		setPublishMode("commands");

	var names=[];

	StropheAccess.connected(function()
	{
		StropheAccess.connection.addHandler(function(result)
		{
			if($(result).attr('type')=='error' && $(result).find('error').text()!='')
				FormValidation.writeError($(result).find('error').text(), 'resultLabel');
			console.log(result);
			return true;
		}, null, 'message'); 
                          
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

	$('#sendButton').click(function()
	{
		if(FormValidation.checkNotEmpty('sendText','resultLabel') && FormValidation.checkNotEmpty('iconsDiv','resutlLabel'))
		{
			var sendText=$('#sendText').val();
			if(publishMode)
			{
				var targetNode=$('#iconsDiv').find('label').html();
				StropheAccess.publish(targetNode, sendText, function(result)
				{
					if($(result).attr('type')=='error')
						FormValidation.writeError($(result).find('error').text(), 'resultLabel');
				});
				InterfaceAccess.addCommand("-1", Strophe.getNodeFromJid(StropheAccess.connection.jid), targetNode, sendText, "");
				FormValidation.writeLog('تم نشر الأمر بنجاح.','resultLabel');
			}
			else
			{
				//FormValidation.writeLog('جاري الإرسال.','resultLabel');
				var max=100;
				var usersArray;

				var phaseCount=Math.ceil(names.length/max);
				console.log(phaseCount);

				//send message
				phase=0;
				
				function send()
				{
console.log('send');
					if(phase>=phaseCount)
						return;
console.log('continue');
						
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
						StropheAccess.sendMessage(usersArray, sendText);
					}

					phase++;
					setTimeout(function(){send();}, 1000);
				}
				send();
/*
				for(var phase=0;phase<phaseCount;phase++)
				{
					usersArray=[];

					for(var i=phase*max;i<max*(phase+1);i++)
					{
						if(i>=names.length)
							break;
						usersArray.push(names[i]);
					}
	
					console.log('names(',usersArray.length,'):',usersArray);

					if(usersArray.length>0)
						StropheAccess.sendMessage(usersArray, $('#sendText').val());
				}
*/
				var usersString='';
				for(var i=0;i<names.length;i++)
					usersString+=names[i]+';';

				InterfaceAccess.addCommand("-1", Strophe.getNodeFromJid(StropheAccess.connection.jid), "", sendText, usersString);
				FormValidation.writeLog('تم الإرسال بنجاح.','resultLabel');
			}

			$('#sendText').val('');
		}
	});

	//load messages
	InterfaceAccess.getCommands("0","0", function(result)
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
					command.find('.command-message-text').html(commandObj.Message);
					command.find('.command-message-date').html(commandObj.Date);
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
