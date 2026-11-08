$(document).ready(function()
{
	var name='';
	var tone='';
	var messages=[];

	Master.getHeader(function(header)
        {
		$('#banner').html(header);

		SessionAccess.getSessionUser(function(value)
		{
			jid=StropheAccess.getJid(value);

			//set jid and name
			$('#headerUserNameLabel').html(jid);
			
			SessionAccess.getSessionRoleId(function(role)
			{
				if(role.trim()==2)
					$('#headerUserNameLabel').html('');
			});

			SessionAccess.getSessionTone(function(value)
			{
				tone=value;

				StropheAccess.connection.connect(jid, tone, function(status)
				{
					console.log('xmpp status: '+status);

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
						StropheAccess.connection.sendIQ($pres().c('priority').t('1').up().c('c',{xmlns: 'http://jabber.org/protocol/caps', node:'http://psi-im.org/caps', ver: 'caps-b75d8d2b25', ext: 'ca cs ep-notify-2 htm'}));

						//managing notification
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
										notificationCounter.html('');
									}
							}
							else
								notificationList.html('<div class="page-banner-item">لا يوجد اشعارات.</div>');
						});

						SessionAccess.getSessionNotificationCount(function(result)
						{
							if(result!=null && result.trim()!="")
								notificationCounter.html(result);
						});

						StropheAccess.connection.addHandler(function(result)
						{
							console.log('stanza has been received:');
							console.log(result);
							StropheAccess.connection.send($pres(5));

							if($(result).is('message') && $(result).attr('type')!='error')
							{
console.log('a');
								var from=Strophe.getBareJidFromJid($(result).attr('from'));
								var body=$(result).find('body').text();
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
												console.log(body);
												if(notificationList.find('div').length>=7)
													notificationList.find('div:last-child').remove();

												notificationList.prepend('<div class="page-banner-item"><a href="stream.html?id='+message.id+'"><img class="page-banner-drop-image" src="imgs/node/'+message.es+'.png"/><label class="page-banner-drop-text">'+message.text+'</label></a></div>');
												SessionAccess.saveSessionNotification(notificationList.html(), notificationCounter.html());
										}
										else
											console.log('message ignoded!');
									}
									catch(ex)
									{
										console.log(ex);
									}
								}

							return true;
						});
					}
				});
			});

			DataAccess.findNodeByName(value, function(result)
                        {
                                $('#headerUserFullNameLabel').html(JSON.parse(result).title);
                        });
		});

		//load messages
		InterfaceAccess.getCommands("0","5",function(commands)
		{
			if(commands!=null && commands.length>0)
			{
				var commandArray=commands.split('<br />');
				for(var i=0;i<commandArray.length;i++)
					if(commandArray[i]!="")
					{
						var command=JSON.parse(commandArray[i]);
						console.log(command);
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
			SessionAccess.saveSessionNotification('', $('#headerNotifyCount').html());

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
			$('#footer').html(footer);
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

	getVariable: function(name)
	{
		var url = window.location.href;
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		results = regex.exec(url);
		if (!results) return null;
		if (!results[2]) return '';
		return decodeURIComponent(results[2].replace(/\+/g, " "));
	}
};

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
