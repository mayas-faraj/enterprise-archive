$(document).ready(function()
{
	var name='';
	var tone='';
	var messages=[];

	Master.getHeader(function(header)
        {
		$('body').prepend(header);

		SessionAccess.getSessionUser(function(value)
		{
			jid=StropheAccess.getJid(value);

			//set jid and name
			$('#headerUserNameLabel').html(jid);

			DataAccess.findNodeByName(value, function(result)
			{
				try
				{
					$('#headerUserFullNameLabel').html(JSON.parse(result).title);
				}
				catch(ex)
				{
					console.log(ex);
				}
			});
			
			SessionAccess.getSessionRoleId(function(role)
			{
				if(role.trim()==2)
				{
					SessionAccess.getSessionNodeId(function(node)
					{
						$('#headerUserNameLabel').html(StropheAccess.getJid(node));

						DataAccess.findAdminByName(node, function(admin)
						{
							try
							{
								$('#headerUserFullNameLabel').html(JSON.parse(admin).full_name);
							}
							catch(ex)
							{
								console.log(ex);
							}
						});
					});

					$('#headerUserList>a').remove();
				}
			});

			

			SessionAccess.getSessionTone(function(value)
			{
				tone=value;

				StropheAccess.connection.connect(jid, tone, function(status)
				{
					//console.log('xmpp status: '+status);

					var statusLabel=$('#footerStatusLabel');
					var notificationCounter=$('#headerNotifyCount');
					var notificationList=$('#headerNotifyList');

					if (status == Strophe.Status.CONNECTING)
					{
						statusLabel.text('جاري الاتصال...');
					}
					else if (status == Strophe.Status.AUTHFAIL || status == Strophe.Status.DISCONNECTED)
					{
						statusLabel.text('غير متصل.');
					}
					else if (status == Strophe.Status.CONNECTED || status == Strophe.Status.ATTACHED)
					{
						$(document).trigger('connected');
						statusLabel.text('متصل');
						StropheAccess.connection.sendIQ($pres().c('priority').t('5').up().c('c',{xmlns: 'http://jabber.org/protocol/caps', node:'http://psi-im.org/caps', ver: 'caps-b75d8d2b25', ext: 'ca cs ep-notify-2 htm'}));

						setInterval(function() 
						{
							StropheAccess.connection.sendPresence($pres());
						},300000);

						//managing notification
						if($('#headerNotifyDiv').length==1)
						{
							InterfaceAccess.getRealtimeReportsByCoordinate("0", "7", "0", "0", "0", "0", function(result)
							{
								if(result!=null && result!="")
								{
									var reports=result.split('<br />');
									for(var i=0;i<reports.length;i++)
										if(reports[i]!="")
										{
											var report=JSON.parse(reports[i]);
											notificationList.append('<div class="page-banner-item"><a href="stream.html?id='+report.RowKey+'"><img class="page-banner-drop-image" src="imgs/node/'+report.Es+'.png"/><label class="page-banner-drop-text">'+report.Message+'</label></a></div>');
											var messageToken=report.Publisher+';'+report.Message+';'+(extractDate(report.Date)).getTime().toString();
											messages.push(messageToken);
											//notificationCounter.html('');
										}
								}
								else
									notificationList.html('<div class="page-banner-item">لا يوجد اشعارات.</div>');
							});

							SessionAccess.getReportNotification(function(result)
							{
								if(result!=null && result.trim()!="")
									notificationCounter.html(result);
							});

							StropheAccess.connection.addHandler(function(result)
							{
								//console.log('stanza has been received:');
								//console.log(result);

								if($(result).is('message') && $(result).attr('type')!='error')
								{
									var from=Strophe.getBareJidFromJid($(result).attr('from'));
									var body=$(result).find('body').text();
									if(from==StropheAccess.XMPP_SERVER
									|| from==StropheAccess.getJid('ehq'))
									{
										var regex=/\d+@\w+\.\w+/;
										if(regex.test(body))
										{
											var jidFrom=regex.exec(body)[0];
											StropheAccess.presenceSubscribe(jidFrom);
											console.log('presend subscribtion from ', jidFrom);

											if(from==StropheAccess.XMPP_SERVER)
											{
												StropheAccess.getNodes(function(nodes)
												{
													$(nodes).find('affiliation').each(function()
													{
														var node=$(this).attr('node');
														if(node!='commands' && node!='es_updates')
														{
															StropheAccess.getUsers(node, function(users)
															{
																$(users).find('affiliation').each(function()
																{
																		if(jidFrom==$(this).attr('jid'))
																			{
																				StropheAccess.sendMessage([node], body);
																				console.log("sending message:", node, body);
																			}
																});

															});
														}
													});
												});
											}
										}
									}
									else
									{
										try
										{
											var message=JSON.parse(body);
											var messageToken=message.publisher+';'+message.text+';'+message.timestamp.toString();
												
											if(messages.indexOf(messageToken)==-1)
											{
												messages.push(messageToken);
												var counter=parseInt(notificationCounter.text());
												if(isNaN(counter))
													counter=0;

												if(notificationList.find('a').length==0)
													notificationList.html('');

												notificationCounter.text(counter+1);
													//console.log(body);
													if(notificationList.find('div').length>=7)
														notificationList.find('div:last-child').remove();

													notificationList.prepend('<div class="page-wbanner-item"><a href="stream.html?id='+message.id+'"><img class="page-banner-drop-image" src="imgs/node/'+message.es+'.png"/><label class="page-banner-drop-text">'+message.text+'</label></a></div>');
													SessionAccess.saveReportNotification(notificationCounter.html());
											}
											//else
											//	console.log('message ignoded!');
										}
										catch(ex)
										{
											console.log(ex);
										}
									}
								}

								return true;
							});
						}
					}
				});
			});
		});

		//load messages
		if($('#headerCommandDiv').length==1)
			InterfaceAccess.getCommands("0","5",function(commands)
			{
				if(commands!=null && commands.length>0)
				{
					var commandArray=commands.split('<br />');
					for(var i=0;i<commandArray.length;i++)
						if(commandArray[i]!="")
						{
							var command=JSON.parse(commandArray[i]);
							//console.log(command);
							$('#headerCommandList').append('<div class="page-banner-item"><a href="commands.html?id='+command.RowKey+'"><img class="page-banner-drop-image" src="imgs/commands.png"/><label class="page-banner-drop-text">'+command.Message+'</label></a></div>');
						}
				}
			});

		$('#headerLogout').click(function()
		{
			StropheAccess.connection.sendPresence($pres({type: 'unavailable'}));
			StropheAccess.connection.disconnect();
			SessionAccess.destroySession();
			document.location='login.html';
		});

		$('html').click(function()
		{
			if($('#headerNotifyList').css('display')=='block')
				$('#headerNotifyList').slideUp();

			if($('#headerCommandList').css('display')=='block')
				$('#headerCommandList').slideUp();

			if($('#headerUserList').css('display')=='block')
				$('#headerUserList').slideUp();
		});

		$('#headerNotifyDiv').click(function(event)
		{
			event.stopPropagation();
			$('#headerNotifyList').slideToggle();
			$('#headerNotifyCount').html('');
			SessionAccess.saveReportNotification($('#headerNotifyCount').html());

			if($('#headerAdminList').css('display')=='block')
				$('#headerAdminList').slideUp();

			if($('#headerCommandList').css('display')=='block')
				$('#headerCommandList').slideUp();
		});

		$('#headerAdminDiv').click(function(event)
		{
			event.stopPropagation();
			$('#headerUserList').slideToggle();

			if($('#headerNotifyList').css('display')=='block')
				$('#headerNotifyList').slideUp();

			if($('#headerCommandList').css('display')=='block')
				$('#headerCommandList').slideUp();
		});

		$('#headerCommandDiv').click(function(event)
		{
			event.stopPropagation();
			$('#headerCommandList').slideToggle();

			if($('#headerNotifyList').css('display')=='block')
				$('#headerNotifyList').slideUp();

			if($('#headerAdminList').css('display')=='block')
				$('#headerAdminList').slideUp();
		});

		Master.getFooter(function(footer)
		{
			$('body').append(footer);
		});
	});
});

var Master=
{
	masterUrl : "php/Master.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: Master.masterUrl,
				type: 'POST',
				data: ajaxData,
				success: callback 
			});
	},

	getHeader: function(callback)
	{
		Master.ajaxCall({op: 'getHeader'}, callback);
	},

	getFooter: function(callback)
	{
		Master.ajaxCall({op: 'getFooter'}, callback);
	},

	getMainContent: function(callback)
	{
		Master.ajaxCall({op: 'getMainContent'}, callback);
	},

	validContent: function(page, callback)
	{
		Master.ajaxCall({op: 'validContent', page: page}, callback);
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
};

Master.validContent(window.location.pathname.substring(1), function(result)
{
	if(result!=null && result.trim()!='')
		document.write(result);
});

function extractDate(stringDate)
{
        try
        {
                var date=stringDate.split(' ')[0].split('-');
                var time=stringDate.split(' ')[1].split(':');

                return new Date(date[2],(parseInt(date[1])-1).toString(),date[0],time[0],time[1],time[2]);
        }
        catch(ex)
        {
                console.log(ex);
                return new Date();
        }
}
