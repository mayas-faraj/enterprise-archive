var DocumentExporter = 
{
	documentUrl : "php/DocumentExporter.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: DocumentExporter.documentUrl,
				type: 'POST',
				data: ajaxData,
				success: callback
			});
	},

	exportCsv: function(content, callback)
	{
		 DocumentExporter.ajaxCall({op: "exportCsv", content:content}, callback);
	},

	exportWord: function(admin, name, id, set, text, date, address, location, media, comments, actions, callback)
	{
		DocumentExporter.ajaxCall({op: "exportWord", admin: admin, name: name, id: id, set: set, text: text, date: date, address: address, location: location, media: media, comments: comments, actions: actions}, callback);
	}
};
