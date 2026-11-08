$(document).ready(function()
{
	DataAccess.findSetting("displayJid", function(configResult)
	{
		 console.log("config displayJid: ", configResult);

                 if(configResult.trim()!="null")
                         $("#displayJidCheckbox").prop("checked", JSON.parse(configResult).value=="true");
	});

	$("#saveButton").click(function()
	{
		DataAccess.saveSetting("displayJid", $("#displayJidCheckbox").prop("checked"), function(result)
		{
			console.log("save displayJid: ", result);
		});
	});	
});
