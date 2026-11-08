var MediaAccess = 
{
	interfaceUrl : "php/Interface.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: MediaAccess.interfaceUrl,
				type: 'POST',
				data: ajaxData,
				success: callback 
			});
	},

	findMedia: function(uri, position, callback)
        {
                InterfaceAccess.ajaxCall({op: 'findMedia', uri: uri, position: position}, callback);
        }
}
