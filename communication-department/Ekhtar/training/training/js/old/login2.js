$(document).ready(function() 
{

	SessionAccess.destroySession();

	$('.login-box').keyup(function(event)
	{
		if(event.keyCode==13)
			$('#loginButton').click();
	});

	$('#loginButton').click(function() 
	{
		if(!FormValidation.checkJidLocal('nameText','result') || !FormValidation.checkNotEmpty('passwordText','result'))
			return false;
	
		$('#loginButton').attr('disabled','true');

		$('#stateImage').removeClass('status-lock').removeClass('status-unlock').addClass('status-loading');
		$('.status-text, .status-image').removeClass('visibility-hidden');
					
		//save session
		var name=$('#nameText').val();
		var jid=StropheAccess.getJid(name);
		var password=$('#passwordText').val();
			
		DataAccess.dbConnect(name, password, function(result)
		{
			if(result==1)
			{
				$('#privilegeStateImage').removeClass('status-exclamation').removeClass('status-error').addClass('status-success');
				//strophe authenticatin
				SessionAccess.getSessionUser(function(user)
				{
					jid=StropheAccess.getJid(user);
					SessionAccess.getSessionTone(function(tone)
					{
						StropheAccess.connection.connect(jid, tone, function(status)
						{
							console.log('status: '+status);

							if (status == Strophe.Status.AUTHFAIL || status == Strophe.Status.DISCONNECTED)
							{
								$('#authenticationStateImage').removeClass('status-exclamation').removeClass('status-success').addClass('status-error');
								$('#stateImage').removeClass('status-unlock').removeClass('status-loading').addClass('status-lock');
								$('#loginButton').removeAttr('disabled');
							}
							else if (status == Strophe.Status.CONNECTED)
							{
								$('#authenticationStateImage').removeClass('status-exclamation').removeClass('status-error').addClass('status-success');
								SetManager.initialize(function(){console.log('=======set done========')});

								setTimeout(function() 
								{
									SetImporter.checkRoster(function(result)
									{
										result=true;
										if(result)
											window.location.replace('index.html');
										else
											window.location.replace('operation.html');
									});
								}, 2000);
							}
						});
					});
				});
			}
			else
			{
				$('#privilegeStateImage').removeClass('status-exclamation').removeClass('status-success').addClass('status-error');
				$('#stateImage').removeClass('status-unlock').removeClass('status-loading').addClass('status-lock');
				$('#nameText #passwordText').addClass('input-error');
				$('#loginButton').removeAttr('disabled');
			}
		});
	});
});

