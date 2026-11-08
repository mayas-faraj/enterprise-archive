var InterfaceAccess = 
{
	interfaceUrl : "php/Interface.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: InterfaceAccess.interfaceUrl,
				type: 'POST',
				data: ajaxData,
				success: callback 
			});
	},

	addUser: function(name, callback)
        {
                InterfaceAccess.ajaxCall({op: 'addUser', name: name}, callback);
        },

	addCommand: function(id, admin, node, text, users, callback)
	{
		InterfaceAccess.ajaxCall({op: 'addCommand', id: id, admin: admin, node: node, text: text, users: users}, callback);
	},

	getKeywords: function(callback)
	{
		InterfaceAccess.ajaxCall({op: 'getKeywords'}, callback);
	},
	
	getReportsStream: function(rowKey, offset, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getReportsStream', rowKey: rowKey, offset: offset}, callback);
        },

	getCommands: function(rowKey, offset, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getCommands', rowKey: rowKey, offset: offset}, callback);
        },

	getRealtimeReportsByCoordinate: function(rowKey, offset, longitude1, latitude1, longitude2, latitude2, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getRealtimeReportsByCoordinate', rowKey: rowKey, offset: offset, longitude1: longitude1, latitude1: latitude1, longitude2: longitude2, latitude2: latitude2}, callback);
        },

	getReportsByArgs: function(user, keywords, date1, date2, longitude1, latitude1, longitude2, latitude2, startKey, emaStartKey, offset, callback)
	{
		InterfaceAccess.ajaxCall({op: 'getReportsByArgs', user: user, keywords: keywords, date1: date1, date2: date2, longitude1: longitude1, latitude1: latitude1, longitude2: longitude2, latitude2: latitude2, startKey: startKey, emaStartKey: emaStartKey, offset: offset}, callback);
	},

	getReportsByImportanceRange: function(user, lowestImportance, maxImportance, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getReportsByImportanceRange', user: user, lowestImportance: lowestImportance, maxImportance: maxImportance}, callback);
        },

	getReportsByClassification: function(name, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getReportsByClassification', name: name}, callback);
        },

	getReportsByReviewState: function(reviewed, processed, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getReportsByReviewState', reviewed: reviewed, processed: processed}, callback);
        },

	setReportComment: function(rowKey, text, callback)
        {
                InterfaceAccess.ajaxCall({op: 'setReportComment', rowKey: rowKey, text: text}, callback);
        },

	setReportImportant: function(rowKey, value, callback)
        {
                InterfaceAccess.ajaxCall({op: 'setReportImportant', rowKey: rowKey, value: value}, callback);
        },

	getUsers: function(callback)
        {
                InterfaceAccess.ajaxCall({op: 'getUsers'}, callback);
        },
	
	getUserNavigations:function(name, callback)
	{
		InterfaceAccess.ajaxCall({op: 'getUserNavigations', name: name}, callback);
	},

	getUserSim: function(name, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getUserSim', name: name}, callback);
        },

	getUserDevices: function(name, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getUserDevices', name: name}, callback);
        },

	getUserReports: function(rowKey, offset, name, callback)
        {
                InterfaceAccess.ajaxCall({op: 'getUserReports', rowKey: rowKey, offset: offset, name: name}, callback);
        },

	getUsersLastPoint: function(users, callback)
	{
		InterfaceAccess.ajaxCall({op: 'getUsersLastPoint', users: users}, callback);
	},

	getUsersLastPointByCoordinate: function(users, date1, date2, longitude1, latitude1, longitude2, latitude2, callback)
	{
		InterfaceAccess.ajaxCall({op: 'getUsersLastPointByCoordinate', users: users, date1: date1, date2: date2, longitude1: longitude1, latitude1: latitude1, longitude2: longitude2, latitude2: latitude2}, callback);
	}
}
