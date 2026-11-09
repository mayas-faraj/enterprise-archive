jQuery(document).ready(function()
{
	var resultBlockTemplate=jQuery("#resultBlock").clone();
	var resultBlockRowTemplate=resultBlockTemplate.find("tbody>tr").clone();

	resultBlock.remove();
	
	jQuery("#progressBar").css("width", "0");
	jQuery("#operationLabel").html("Idle.");
	jQuery("#runButton").click(function()
	{
		var sitesGroupArray=jQuery("#sitesGroupText").val().split("\n");
		var scrapySite=jQuery("#scrapySiteText").val();
		for(var i=0; i<sitesGroupArray.length; i++)
			if(sitesGroupArray[i].trim()=="")
				sitesGroupArray.splice(i, 1);

		jQuery("#progressBar").css("width", 100/(sitesGroupArray.length+1)+"%")
		jQuery("#operationLabel").html("Initialization...");

		jQuery.post(window.location.protocol+"//"+window.location.host+"/"+window.location.pathname+ "/process.php", {"scrapysite": scrapySite, "sitesgroup": sitesGroupArray}, function(serverResult) {
			console.log("result: ", serverResult);
			var resultObject=JSON.parse(serverResult);
			var resultBlock=resultBlockTemplate.clone();
			resultBlock.find("tr").remove();
			var resultBlockRow=resultBlockRowTemplate.clone();
console.log(resultObject);
			resultBlock.find("h3").html(resultObject.site_url);
			for(var i=0; i<resultObject.links.length; i++)
			{
				resultBlockRow.find("th").html(i+1);
				resultBlockRow.find("td:nth-child(2)").html(resultObject.links[i].source);
				resultBlockRow.find("td:nth-child(3)").html(resultObject.links[i].destination);
				resultBlockRow.find("td:nth-child(4)").html(resultObject.links[i].title);
				resultBlock.find("tbody").append(resultBlockRow.clone());
			}

			jQuery("#resultsBlock").append(resultBlock);

		});

	});
});
