var SessionAccess = 
{
	sessionUrl : "php/Session.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: SessionAccess.sessionUrl,
				type: 'POST',
				data: ajaxData,
				success: callback
			});
	},

	saveReportNotification: function(count, callback)
	{
		 SessionAccess.ajaxCall({query: 'saveReportNotification', count: count}, callback);
	},

	getReportNotification: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getReportNotification'}, callback);
	},

	saveUserNotification: function(count, callback)
	{
		 SessionAccess.ajaxCall({query: 'saveUserNotification', count: count}, callback);
	},

	getUserNotification: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getUserNotification'}, callback);
	},

	getSessionUserId: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSessionUserId'}, callback); 
	},

	getSessionUser: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSessionUser'}, callback);
	},

	getSessionTone: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSessionTone'}, callback);
	},

	getSessionRoleId: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSessionRoleId'}, callback);
	},

	getSessionNodeId: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSessionNodeId'}, callback);
	},

	getManageNodePrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getManageNodePrivilege'}, callback);
	},

	getManageAdminPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getManageAdminPrivilege'}, callback);
	},

	getManageUserPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getManageUserPrivilege'}, callback);
	},

	getViewUsersPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getViewUsersPrivilege'}, callback);
	},
	getViewStreamPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getViewStreamPrivilege'}, callback);
	},
	getViewNotificationPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getViewNotificationPrivilege'}, callback);
	},
	getSendMessagePrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSendMessagePrivilege'}, callback);
	},
	getSetProcessedPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSetProcessedPrivilege'}, callback);
	},
	getSetCommentPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSetCommentPrivilege'}, callback);
	},
	getSetImportantPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getSetImportantPrivilege'}, callback);
	},
	getChangeSettingPrivilege: function(callback)
	{
		SessionAccess.ajaxCall({query: 'getChangeSettingPrivilege'}, callback);
	},

	destroySession: function(callback)
	{
		SessionAccess.ajaxCall({query: 'destroySession'}, callback);
	}
};

