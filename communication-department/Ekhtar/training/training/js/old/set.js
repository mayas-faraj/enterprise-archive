$(document).ready(function()
{
	//templates
	var userListElement=$("#userListElement");
	var userElement=$.extend(true, {}, $("#userElement"));	

	//initial values
	var id=Master.getVariable("id");
	userListElement.html("");

	//initial functions
	fillIcons();

	$("#messageLink").attr("href", "commands.html?s="+id);

	//public functions region
	function fillIcons()
	{
		var sets=SetManager.getSet();
		var set=sets[id];

		if(set==null)
			document.location.replace("nonePrivileges.html");
		else
		{
			$("#nameLabel").html(set.name);

			if(set.description!=null && set.description!="")
				$("#descriptionLabel").html(set.description);
			else
				$("#descriptionLabel").remove();

			if(set.date!=null && set.date!="")
				$("#dateLabel").append(set.date);
			else
				$("#dateLabel").remove();

			$("#setImage").attr("src", set.logo);
			
			var user;

			if(set.users.length>0)
				for(var i=0; i<set.users.length; i++)
				{
					user=set.users[i];
					addUserIcon(user.jid, user.name, set.logo, user.available);
				}
			else
				userListElement.html("<p class='content-info'>لا تحوي المجموعة أية عناصر</p>");
		}
	}

	function addUserIcon(jid, name, img, isAvailabel)
	{
		var id=Strophe.getNodeFromJid(jid);
		userElement.attr("href", "reports.html?id="+id);
		userElement.find("#jidLabel").html(id);
		userElement.find("#nameLabel").html(name);
		userElement.find("#image").attr("src", img);

		if(isAvailabel)
			userElement.find("#statusDiv").removeClass("content-icon-exclamation").addClass("content-icon-offline");
		else
			userElement.find("#statusDiv").removeClass("content-icon-offline").addClass("content-icon-exclamation");

		userListElement.append(userElement.wrapAll("<div>").parent().html());
	}
	
});
