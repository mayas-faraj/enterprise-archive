jQuery(document).ready(function()
{
	jQuery("#authButton").click(function()
	{
		jQuery("#idText").removeClass("is-invalid");
		jQuery("#secretText").removeClass("is-invalid");

		var appId=jQuery("#idText").val().trim();
		var appSecret=jQuery("#secretText").val().trim();

		if(appId=="")
			jQuery("#idText").addClass("is-invalid");
		else if(appSecret=="")
			jQuery("#secretText").addClass("is-invalid");
		else
		{
			jQuery.post(window.location.protocol+"//"+window.location.host+"/"+window.location.pathname+ "/process.php", {"app-id": appId, "app-secret": appSecret}, function(serverResult) {
			console.log("result: ", serverResult);
			});
		}
	});

	jQuery("#tokenButton").click(function()
	{
		var authCode=jQuery("#authText").val().trim();

		if(authCode=="")
			jQuery("#authText").addClass("is-invalid");
		else
		{
			jQuery("#authText").removeClass("is-invalid");
			jQuery.post(window.location.protocol+"//"+window.location.host+"/"+window.location.pathname+ "/process.php", {"auth-code": authCode}, function(serverResult) {
			console.log("result: ", serverResult);
			});
		}
	});

	jQuery("#runButton").click(function()
	{
		var accessToken=jQuery("#tokenText").val().trim();

		if(accessToken=="")
			jQuery("#tokenText").addClass("is-invalid");
		else
		{
			jQuery("#tokenText").removeClass("is-invalid");
			jQuery.post(window.location.protocol+"//"+window.location.host+"/"+window.location.pathname+ "/process.php", {"access-token": accessToken}, function(serverResult) {
			console.log("result: ", serverResult);
			});
		}
	});
});
