$(document).ready(function() 
{
	//CONSTANT REGION
	var STATUS_OPERATION=0;
	var STATUS_SUCCESS=1;
	var STATUS_FAILED=2;

	//destroy session and set
	SessionAccess.destroySession(function(result) {console.log("session destroyed: ", result)});
	SetManager.setSet("{}");

	//initial element's state
	$("#settingsDiv, #loginDiv, #accessDiv").css("visibility", "hidden");

	$('.content-block').keyup(function(event)
	{
		if(event.keyCode==13)
			$('#loginButton').click();
	});

	function setState(stateDivId, status)
	{
		if(stateDivId==null)
		{
			$("#loginButton").attr("disabled","");
			$("#settingsDiv, #loginDiv, #accessDiv").css("visibility", "visible");
			$("#settingsDiv>i, #loginDiv>i, #accessDiv>i").removeClass("oscillating yellow-text red-text green-text");
			$("#settingsDiv>label, #loginDiv>label, #accessDiv>label").removeClass("yellow-text red-text green-text");
		}
		else
		{
			switch(status)
			{
				case STATUS_OPERATION:
					$("#"+stateDivId+">i").addClass("oscillating yellow-text");
					$("#"+stateDivId+">label").addClass("yellow-text");
				break;
				case STATUS_SUCCESS:
					$("#"+stateDivId+">i").removeClass("oscillating yellow-text").addClass("green-text");
					$("#"+stateDivId+">label").removeClass("yellow-text").addClass("green-text");
				break;
				case STATUS_FAILED:
					$("#"+stateDivId+">i").removeClass("oscillating yellow-text").addClass("red-text");
					$("#"+stateDivId+">label").removeClass("yellow-text").addClass("red-text");
					$("#loginButton").removeAttr("disabled");
				break;
					
			};
		}	
	}

	$('#loginButton').click(function() 
	{
		if(!FormValidation.checkJidLocal('nameText','result') || !FormValidation.checkNotEmpty('passwordText','result'))
			return false;

		setState();	
		setState("loginDiv", STATUS_OPERATION);

		//save session
		var name=$('#nameText').val();
		var jid=StropheAccess.getJid(name);
		var password=$('#passwordText').val();
			
		DataAccess.dbConnect(name, password, function(result)
		{
			if(result==1)
			{
				setState("loginDiv", STATUS_SUCCESS);
				setState("accessDiv", STATUS_OPERATION);
				//strophe authenticatin
				SessionAccess.getSessionUser(function(user)
				{
					jid=StropheAccess.getJid(user);
					SessionAccess.getSessionTone(function(tone)
					{
						status=Strophe.Status.CONNECTED;
						console.log('status: '+status);

						if (status == Strophe.Status.AUTHFAIL || status == Strophe.Status.DISCONNECTED)
						{
							setState("accessDiv", STATUS_FAILED);
						}
						else if (status == Strophe.Status.CONNECTED)
						{
							setState("accessDiv", STATUS_SUCCESS);
							setState("settingsDiv", STATUS_OPERATION);

							SetManager.initialize(function()
							{
								setState("settingsDiv", STATUS_SUCCESS)

								setTimeout(function() 
								{
									SetImporter.checkRoster(function(result)
									{
										if(result)
											window.location.replace('index.html');
										else
											window.location.replace('operation.html');
									});
								}, 2000);
							});
						}
					});
				});
			}
			else
			{
				setState("loginDiv", STATUS_FAILED);
			}
		});
	});
});

