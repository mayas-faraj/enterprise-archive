var DocumentAccess = 
{
	documentUrl : "php/Document.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: DocumentAccess.documentUrl,
				type: 'POST',
				data: ajaxData,
				success: callback
			});
	},

	toDoc: function(node, admin, user, phone, text, date, address, ip, imei, imsi, cell, type, ssn, mac, os, longitude, latitude, callback)
	{
		 DocumentAccess.ajaxCall({template: '../documents/'+node+'.docx', admin: admin, user: user, phone: phone, text: text, date: date, address: address, ip: ip, imei: imei, imsi: imsi, cell: cell, type: type, ssn: ssn, mac: mac, os: os, longitude: longitude, latitude: latitude}, callback);
	}

};
