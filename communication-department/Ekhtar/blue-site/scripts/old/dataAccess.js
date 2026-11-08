var DataAccess = 
{
	dataAdapterUrl : "php/DataAdapter.php",

	ajaxCall: function(ajaxData, callback)
	{
		$.ajax({
				url: DataAccess.dataAdapterUrl,
				type: 'POST',
				data: ajaxData,
				success: callback 
			});
	},

	dbConnect: function(user, password, callback)
	{
		DataAccess.ajaxCall({op: 'dbConnect', user: user, password: password}, callback);
	},

	createNodeTable: function(callback)
	{
		DataAccess.ajaxCall({op: 'createNodeTable'}, callback);
	},

	createAdminTable: function(callback)
	{
		DataAccess.ajaxCall({op: 'createAdminTable'}, callback);
	},

	createRoleTable: function(callback)
	{
		DataAccess.ajaxCall({op: 'createRoleTable'}, callback);
	},

	initialDatabase: function(callback)
	{
		DataAccess.ajaxCall({op: 'initialDatabase'}, callback);
	},

	saveNode: function(name, title, description, callback)
	{
		DataAccess.ajaxCall({op: 'saveNode', name: name, title: title, description: description}, callback);
	},

	editNode: function(id, title, description, callback)
	{
		DataAccess.ajaxCall({op: 'editNode', id: id, title: title, description: description}, callback);
	},

	deleteNode: function(id, callback)
	{
		DataAccess.ajaxCall({op: 'deleteNode', id: id}, callback);
	},

	loadNodes: function(callback)
	{
		DataAccess.ajaxCall({op: 'loadNodes'}, callback);
	},

	findNodeById: function(id, callback)
	{
		DataAccess.ajaxCall({op: 'findNodeById', id: id}, callback);
	},

	findNodeByName: function(name, callback)
	{
		DataAccess.ajaxCall({op: 'findNodeByName', name: name}, callback);
	},

	saveAdmin: function(name, tone, fullname, description, roleId, manageNode, manageAdmin, manageUser, viewUsers, viewNotification, viewStream, sendMessage, setProcessed, setComment, setImportant ,changeSetting ,callback)
	{
		DataAccess.ajaxCall({op: 'saveAdmin', name: name, tone: tone ,fullname: fullname, description: description, roleId: roleId, manageNode: manageNode, manageAdmin: manageAdmin, manageUser: manageUser, viewUsers: viewUsers, viewNotification: viewNotification, viewStream: viewStream, sendMessage: sendMessage, setProcessed: setProcessed,  setComment:  setComment, setImportant: setImportant, changeSetting: changeSetting}, callback);
	},

	editAdminInfo: function(id, fullname, description, callback)
	{
		DataAccess.ajaxCall({op: 'editAdminInfo', id: id, fullname: fullname, description: description}, callback);
	},

	editAdminPassword: function(oldTone, newTone, callback)
	{
		DataAccess.ajaxCall({op: 'editAdminPassword', oldTone: oldTone, newTone: newTone}, callback);
	},


	deleteAdmin: function(id, callback)
	{
		DataAccess.ajaxCall({op: 'deleteAdmin', id: id}, callback);
	},

	deleteAdminByName: function(name, callback)
	{
		DataAccess.ajaxCall({op: 'deleteAdminByName', name: name}, callback);
	},

	loadAdmins: function(callback)
	{
		DataAccess.ajaxCall({op: 'loadAdmins'}, callback);
	},

	loadHqAdmins: function(callback)
	{
		DataAccess.ajaxCall({op: 'loadHqAdmins'}, callback);
	},

	findAdminById: function(id, callback)
	{
		DataAccess.ajaxCall({op: 'findAdminById', id: id}, callback);
	},

	findAdminByName: function(name, callback)
	{
		DataAccess.ajaxCall({op: 'findAdminByName', name: name}, callback);
	},

	loadRoles: function(callback)
	{
		DataAccess.ajaxCall({op: 'loadRoles'}, callback);
	}
}
