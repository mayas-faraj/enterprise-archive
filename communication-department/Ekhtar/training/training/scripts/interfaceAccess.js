var InterfaceAccess = 
{
	ajaxCall: function(args, callback)
	{
		callback(ReportGenerator.operates(args));
	},

	saveUser: function(name, callback)
        {
		callback("1");
        },

	saveCommand: function(es, text, sets, users, callback)
	{
		callback(Math.random().toString().substring(2));
	},

	loadKeywords: function(callback)
	{
		callback("VIP;أماكن;أماكن ساخنة;إرهاب;اتصالات;حربي;شخصيات هامة;فساد;مخدرات;");

	},

	loadCommands: function(ehq, keywords, startTimestamp, endTimestamp, rowKey, offset, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadCommands', ehq: ehq, keywords: keywords, startTimestamp: startTimestamp, endTimestamp: endTimestamp, rowKey: rowKey, offset: offset}, callback);
	},
	
	loadReportsNotification: function(startKey, offset, callback)
        {
                InterfaceAccess.ajaxCall({op: 'loadReportsNotification', startKey: startKey, offset: offset}, callback);
        },

	loadReportsCommand: function(users, commandId, keywords, startTimestamp, endTimestamp, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadReportsCommand', users: users, commandId: commandId, keywords: keywords, startTimestamp: startTimestamp, endTimestamp: endTimestamp}, callback);
	},

	loadReportsByArgs: function(user, hasCommand, keywords, classify, useSeenFilter, isSeenFilter, useImportantFilter, isImportantFilter, minImportance, maxImportance, startTimestamp, endTimestamp, longitude1, latitude1, longitude2, latitude2, includeEmptyLocation, startKey, offset, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadReportsByArgs', user: user, keywords: keywords, hasCommand: hasCommand, classify: classify, minImportance: minImportance, maxImportance: maxImportance, useSeenFilter: useSeenFilter, isSeenFilter: isSeenFilter, useImportantFilter: useImportantFilter, isImportantFilter: isImportantFilter, startTimestamp: startTimestamp, endTimestamp: endTimestamp, longitude1: longitude1, latitude1: latitude1, longitude2: longitude2, latitude2: latitude2, includeEmptyLocation: includeEmptyLocation, startKey: startKey, offset: offset}, callback);
	},

	loadReportsById: function(id, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadReportsById', id: id}, callback);
	},

	loadReportsRealtime: function(callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadReportsRealtime'}, callback);
	},

	saveReportCommentById: function(id, comment, timestamp, callback)
	{
		callback(id);
	},

	saveReportComment: function(rowKey, realtime, comment, timestamp, callback)
        {
		callback(rowKey);
        },

	setReportImportantById: function(id, isImportant, timestamp ,callback)
	{
		callback(id);
	},

	setReportImportant: function(rowKey, realtime, isImportant, timestamp ,callback)
	{
		callback(rowKey);
	},

	setReportSeenById: function(id, isSeen, timestamp, callback)
	{
		callback(id);
	},

	setReportSeen: function(rowKey, realtime, isSeen, timestamp, callback)
	{
		callback(rowKey);
	},

	setReportsSeen: function(timestamp, callback)
	{
		callback("1");
	},

	deleteComment: function(rowKey, realtime, commentId, callback)
	{
		callback(rowKey);
	},

	setCommandRead: function(rowKey, reader, timestamp, callback)
	{
		callback(rowKey);
	},

	loadUsers: function(callback)
        {
		callback("");
        },
	
	loadUserNavigations:function(name, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadUserLocations', name: name}, callback);
	},

	loadShortNavigations:function(name, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadUserShortLocations', name: name}, callback);
	},

	loadUsersLastPoint: function(users, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadUsersLastLocation', users: users}, callback);
	},

	loadUsersLastPointByCoordinate: function(users, startTimestamp, endTimestamp, longitude1, latitude1, longitude2, latitude2, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadUsersLastLocationByCoordinate', users: users, startTimestamp: startTimestamp, endTimestamp: endTimestamp, longitude1: longitude1, latitude1: latitude1, longitude2: longitude2, latitude2: latitude2}, callback);
	},

	loadRealtimeUserLogin: function(publisher, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadRealtimeLogin', publisher: publisher}, callback);
	},

	loadUserLogin: function(publisher, rowKey, offset, callback)
	{
		InterfaceAccess.ajaxCall({op: 'loadLogin', publisher: publisher, rowKey: rowKey, offset: offset}, callback);
	},

	findReport: function(rowKey, callback)
	{
		InterfaceAccess.ajaxCall({op: 'findReport', rowKey: rowKey}, callback);
	},

	findCommand: function(rowKey, callback)
	{
		InterfaceAccess.ajaxCall({op: 'findCommand', rowKey: rowKey}, callback);
	},

	findStatistic: function(name, callback)
	{
		callback("");
	},

	countReportsByUnseen: function(replayOnly, callback)
	{
		InterfaceAccess.ajaxCall({op: 'countReportsByUnseen', replayOnly}, callback);
	},

	countReportsByCoverage: function(hasGps, hasCell, callback)
        {
		callback("");
        },

	countReportsByCoordinate: function(longitude1, latitude1, longitude2, latitude2, callback)
        {
		callback("");
        },

	countReportsByUsers: function(users, onlyImportant, callback)
        {
		callback("3");
        },

	getStem: function(keywords, callback)
	{
		callback(keywords);
	}
};
