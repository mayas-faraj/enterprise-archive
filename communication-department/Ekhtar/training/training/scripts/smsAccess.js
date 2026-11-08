var SmsAccess=
{
        smsAccessUrl : "php/SmsAccess.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: SmsAccess.smsAccessUrl,
				type: 'POST',
				data: ajaxData,
				success: callback
			});
	},

	sendMessage: function(id, users, text, callback)
	{
		SmsAccess.ajaxCall({id: id, users: SmsAccess.toJsonArray(users), text: text}, callback);
	},

	toJsonArray: function(users)
	{
		var userArrayObject='[';
		for(var i=0;i<users.length;i++)
		{
			userArrayObject+=SmsAccess.addPrefix(Strophe.getNodeFromJid(users[i]));
			if(i!=users.length-1)
				userArrayObject+=',';
		}
		userArrayObject+=']';
		return userArrayObject;
	},


	prefix: "963",

	sendMessage2: function(id, users, text)
	{
		var messageObject='{"i":"'+id+'", "t":"'+text+'"}';
		var userArrayObject='[';

		for(var i=0;i<users.length;i++)
		{
			userArrayObject+=addPrefix(users[i]);
			if(i!=users.length-1)
				userArrayObject+=',';
		}
		userArrayObject+=']';
		var packedObject='{"numbers":"", "message":""}';

		console.log("SMS has been sent!");

	},

	addPrefix: function(number)
	{
		if(number[0]=='0')
			number=number.substring(1);

		return SmsAccess.prefix+number;
	}
};
