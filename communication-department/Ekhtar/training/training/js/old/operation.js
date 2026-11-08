$(document).ready(function()
{
	var userContent=$(".content-items");
	var userContentItems=userContent.find(">ul");
	var userElement=$.extend(true, {}, $("#userElement"));

	userContentItems.html("");
	userContent.addClass("status-loading");

	StropheAccess.connected(function()
	{
		SetImporter.importRoster(function(jid, name)
		{
			console.log("import: ", jid, name);
			var nameText;
			if(name==null)
				nameText="بدون اسم.";
			else
				nameText="بأسم: "+name;
			
	
			userElement.attr("id", "userElement_"+jid);
			userElement.find("#nameElement").text(jid);
			userElement.find("#textElement").text("حفظ المستخدم بالمعرف ( "+jid+" ) "+ nameText);
			userContentItems.append(userElement.wrapAll("<li>").parent().html());

			if(userContent.hasClass("status-loading"))
				userContent.removeClass("status-loading");
		}, function()
		{
			SetManager.initialize();

			M.toast({html: "تم استيراد معلومات مستخدمي جهة إخطار."});
		//	setTimeout(function() {window.location.replace('index.html');}, 5000);	
			if(userContent.hasClass("status-loading"))
				userContent.removeClass("status-loading");

			$("#nextButton").removeClass("disabled");
		});
	});

	/*StropheAccess.rosterUpdated(function(event,jid, name, group, isAvailable)
	{
		if(isAvailable==null || !isAvailable)
		{
			StropheAccess.presenceSubscribe(jid);
			console.log("presense subscribe: ", jid);
		}

	});
	*/
});
