var DataXmpp = 
{
	dataAdapterUrl : "php/DataXmpp.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: DataXmpp.dataAdapterUrl,
				type: 'POST',
				data: ajaxData,
				success: callback 
			});
	},

	searchUsers: function(value, nodes, callback)
	{
		var nodeString="(";

		for(var i=0;i<nodes.length;i++)
		{
			nodeString+="\'" + nodes[i] + "\'";

			if(i!=nodes.length-1)
				nodeString+=",";
		}

		nodeString+=")";

		DataXmpp.ajaxCall({value: value, nodes: nodeString}, callback);
	}
}
