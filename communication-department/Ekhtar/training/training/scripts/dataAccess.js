var DataAccess = 
{
	SEPERATOR: "<br />",	

	dbConnect: function(user, password, callback)
	{
		var result;

		if(user=="ehq" && password=="ehq0000")
		{
			result=true;
			localStorage.setItem('id','1');
			localStorage.setItem('user','ehq');
			localStorage.setItem('tone','ehq0000');
			localStorage.setItem('node','ehq');
			localStorage.setItem('role','1');
			localStorage.setItem('manageNodes','1');
			localStorage.setItem('manageAdmins','1');
			localStorage.setItem('manageUsers','0');
			localStorage.setItem('sendCommand','1');
			localStorage.setItem('viewUsers','1');
			localStorage.setItem('viewReports','1');
			localStorage.setItem('setImportant','1');
			localStorage.setItem('setComment','1');
			localStorage.setItem('setSeen','1');
			localStorage.setItem('changeSetting','1');
			localStorage.setItem('support','0');

		}
		else if(user=="es-force" && password=="qwer1234")
		{
			result=true;
			localStorage.setItem('id','3');
			localStorage.setItem('user','es-force');
			localStorage.setItem('tone','1234');
			localStorage.setItem('node','es-force');
			localStorage.setItem('role','3');
			localStorage.setItem('manageNodes','0');
			localStorage.setItem('manageAdmins','0');
			localStorage.setItem('manageUsers','1');
			localStorage.setItem('sendCommand','1');
			localStorage.setItem('viewUsers','1');
			localStorage.setItem('viewReports','1');
			localStorage.setItem('setImportant','1');
			localStorage.setItem('setComment','1');
			localStorage.setItem('setSeen','1');
			localStorage.setItem('changeSetting','1');
			localStorage.setItem('support','0');
		}
		else if(user=="es-recon" && password=="qwer1234")
		{
			result=true;
			localStorage.setItem('id','2');
			localStorage.setItem('user','es-recon');
			localStorage.setItem('tone','1234');
			localStorage.setItem('node','es-recon');
			localStorage.setItem('role','3');
			localStorage.setItem('manageNodes','0');
			localStorage.setItem('manageAdmins','0');
			localStorage.setItem('manageUsers','1');
			localStorage.setItem('sendCommand','1');
			localStorage.setItem('viewUsers','1');
			localStorage.setItem('viewReports','1');
			localStorage.setItem('setImportant','1');
			localStorage.setItem('setComment','1');
			localStorage.setItem('setSeen','1');
			localStorage.setItem('changeSetting','1');
			localStorage.setItem('support','0');
		}
		else
		{
			result=false;
		}

		callback(result?"1":"0");
	},

	createNodeTable: function(callback)
	{
		callback("1");
	},

	createAdminTable: function(callback)
	{
		callback("1");
	},

	createGroupTable: function(callback)
	{
		callback("1");
	},

	createRoleTable: function(callback)
	{
		callback("1");
	},

	createSettingTable: function(callback)
	{
		callback("1")
	},


	initialDatabase: function(callback)
	{
		callback("1")
	},

	saveNode: function(name, description, color, logo, callback)
	{
		callback("1")
	},

	editNode: function(id, description, color, logo, callback)
	{
		callback("1")
	},

	deleteNode: function(id, callback)
	{
		callback("1")
	},

	deleteNodeByName: function(name, callback)
	{
		callback("1")
	},

	loadNodes: function(callback)
	{
		callback(DataAccess.nodes);
	},

	findNodeById: function(id, callback)
	{
		callback("Not implemented function")
	},

	findNodeByName: function(name, callback)
	{
		var nodes=DataAccess.nodes.split(DataAccess.SEPERATOR);
		for(var i=0;i<nodes.length;i++)
			if(nodes[i]!="")
			{
				var nodeObj=JSON.parse(nodes[i]);
				if(nodeObj.name==name)
					return JSON.stringify(nodeObj);
			}

		return null;
	},

	saveAdmin: function(name, tone, description, roleId, manageNodes, manageAdmins, manageUsers, viewUsers, viewReports, sendCommand, setImportant, setComment, setSeen ,changeSetting ,support ,callback)
	{
		callback("1");
	},

	editAdmin: function(id, description, roleId, manageNodes, manageAdmins, manageUsers, viewUsers, viewReports, sendCommand, setImportant, setComment, setSeen ,changeSetting ,support ,callback)
	{
		callback("1")
	},

	editAdminPassword: function(oldTone, newTone, callback)
	{
		callback("1")
	},


	deleteAdmin: function(id, callback)
	{
		callback("1")
	},

	deleteAdminByName: function(name, callback)
	{
		callback("1")
	},

	loadAdmins: function(callback)
	{
		callback(admins)
	},

	loadHqAdmins: function(callback)
	{
		loadAdmins(callback);
	},

	saveGroup: function(name, description, color, logo, callback)
	{
		callback("1")
	},

	saveSetting: function(name, value, callback)
	{
		callback("1")
	},

	editGroup: function(id, name, description, color, logo, callback)
	{
		callback("1")
	},

	deleteGroup: function(id, callback)
	{
		callback("1")
	},

	loadGroups: function(callback)
	{
		callback(DataAccess.groups1);
	},

	findGroup: function(groupId, callback)
	{
		loadGroups(callback);
	},

	findAdminById: function(id, callback)
	{
		loadAdmins(callback);
	},

	findAdminByName: function(name, callback)
	{
		loadAdmins(callback);
	},

	findSetting: function(name, callback)
	{
		callback("1")
	},

	loadRoles: function(callback)
	{
		callback("1")
	},


	nodes: '{"node_id":"2","name":"es-recon","description":"\u0627\u0644\u0627\u0633\u062a\u0637\u0644\u0627\u0639","logo":"imgs\/node\/es-recon.jpg","color":"#0A0","date":"1558121275"}<br />{"node_id":"3","name":"es-force","description":"\u0642\u0648\u0627\u062a \u062a\u0646\u0641\u064a\u0630\u064a\u0629","logo":"imgs\/node\/es-force.jpg","color":"#A00","date":"1558121319"}',
	admins: '{"admin_ID":"1","name":"ehq","description":"\u0645\u062f\u064a\u0631 \u0625\u062e\u0637\u0627\u0631","date":"1503852533","role_id":"1","manageNodes":"1","manageAdmins":"1","manageUsers":"0","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"1","setComment":"1","setSeen":"1","changeSetting":"1","support":"0"}<br />{"admin_ID":"60","name":"es-eazy","description":"eazy","date":"1544085271","role_id":"3","manageNodes":"0","manageAdmins":"0","manageUsers":"1","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"1","setComment":"1","setSeen":"1","changeSetting":"1","support":"0"}<br />{"admin_ID":"61","name":"es-hard","description":"hard","date":"1544085296","role_id":"3","manageNodes":"0","manageAdmins":"0","manageUsers":"1","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"1","setComment":"1","setSeen":"1","changeSetting":"1","support":"0"}<br />{"admin_ID":"316","name":"es-crowd","description":"crowd node","date":"1554479606","role_id":"3","manageNodes":"0","manageAdmins":"0","manageUsers":"1","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"1","setComment":"1","setSeen":"1","changeSetting":"1","support":"0"}<br />{"admin_ID":"321","name":"es-yyy","description":"yyy","date":"1555610120","role_id":"3","manageNodes":"0","manageAdmins":"0","manageUsers":"1","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"1","setComment":"1","setSeen":"1","changeSetting":"1","support":"0"}<br />{"admin_ID":"322","name":"Watcher","description":"\u0645\u0631\u0627\u0642\u0628 \u0627\u0644\u0628\u0644\u0627\u063a\u0627\u062a","date":"1557792308","role_id":"2","manageNodes":"0","manageAdmins":"0","manageUsers":"0","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"1","setComment":"1","setSeen":"1","changeSetting":"1","support":"0"}<br />{"admin_ID":"323","name":"Commander","description":"\u0623\u0631\u0633\u0627\u0644 \u0623\u0648\u0627\u0645\u0631 \u0641\u0642\u0637 \u0644\u0644\u0645\u0633\u062a\u062e\u062f\u0645\u064a\u0646","date":"1557792368","role_id":"2","manageNodes":"0","manageAdmins":"0","manageUsers":"0","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"0","setComment":"0","setSeen":"0","changeSetting":"0","support":"0"}<br />{"admin_ID":"324","name":"Manager","description":"\u0627\u0636\u0627\u0641\u0629 \u0627\u0644\u062c\u0647\u0627\u062a \u0648\u0645\u0633\u062a\u062e\u062f\u0645\u064a \u0627\u0644\u0645\u0642\u0631 \u0627\u0644\u0631\u0626\u064a\u0633\u064a","date":"1557792422","role_id":"2","manageNodes":"1","manageAdmins":"1","manageUsers":"0","viewUsers":"0","viewReports":"0","sendCommand":"0","setImportant":"0","setComment":"0","setSeen":"0","changeSetting":"0","support":"0"}<br />{"admin_ID":"325","name":"es-recon","description":"\u0627\u0644\u0627\u0633\u062a\u0637\u0644\u0627\u0639","date":"1558121275","role_id":"3","manageNodes":"0","manageAdmins":"0","manageUsers":"1","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"1","setComment":"1","setSeen":"1","changeSetting":"1","support":"0"}<br />{"admin_ID":"326","name":"es-force","description":"\u0642\u0648\u0627\u062a \u062a\u0646\u0641\u064a\u0630\u064a\u0629","date":"1558121319","role_id":"3","manageNodes":"0","manageAdmins":"0","manageUsers":"1","viewUsers":"1","viewReports":"1","sendCommand":"1","setImportant":"1","setComment":"1","setSeen":"1","changeSetting":"1","support":"0"}',
	groups1: '{"group_id":"76","name":"\u0648\u062d\u062f\u0627\u062a \u0627\u0644\u0627\u0633\u062a\u0637\u0644\u0627\u0639","description":"\u0642\u0648\u0627\u062a \u0645\u062c\u0647\u0632\u0629 \u0628\u062a\u062c\u0647\u064a\u0632\u0627\u062a \u0627\u0633\u062a\u0637\u0644\u0627\u0639","color":"#AA0","logo":"imgs\/group\/recon-unit.jpg","date":"1558121408"}<br />{"group_id":"77","name":"\u0642\u0648\u0627\u062a \u0627\u0644\u0627\u0633\u062a\u0637\u0644\u0627\u0639","description":"\u0627\u0644\u0639\u0646\u0627\u0635\u0631 \u0627\u0644\u0645\u0633\u0644\u062d\u0629 \u0641\u064a \u0627\u0644\u062e\u0637\u0648\u0637 \u0627\u0644\u0645\u062a\u0642\u062f\u0645\u0629","color":"#A00","logo":"imgs\/group\/recon-force.jpg","date":"1558121447"}<br />{"group_id":"78","name":"\u0645\u0647\u0646\u062f\u0633\u064a \u0627\u0644\u0645\u0639\u0644\u0648\u0645\u0627\u062a\u064a\u0629","description":"\u0645\u0647\u0627\u0645 \u062c\u0645\u0639 \u0627\u0644\u0645\u0639\u0644\u0648\u0645\u0627\u062a \u0639\u0628\u0631 \u0627\u0644\u0627\u0646\u062a\u0631\u0646\u062a \u0648\u0627\u0644\u0627\u062e\u062a\u0631\u0627\u0642","color":"#00A","logo":"imgs\/group\/recon-engineer.jpg","date":"1558121503"}',
	groups2: '{"group_id":"79","name":"\u0639\u0646\u0627\u0635\u0631 \u0627\u0644\u062d\u0648\u0627\u062c\u0632","description":"\u0639\u0646\u0627\u0635\u0631 \u0627\u0644\u062d\u0648\u0627\u062c\u0631 \u0627\u0644\u0645\u0646\u062a\u0634\u0631\u0629 \u0627\u0644\u062e\u0627\u0635\u0629 \u0628\u0627\u0644\u062a\u0634\u0643\u064a\u0644","color":"#0AA","logo":"imgs\/group\/7121988239426678.png","date":"1558121697"}<br />{"group_id":"80","name":"\u0627\u0644\u0645\u0647\u0627\u0645 \u0627\u0644\u062e\u0627\u0635\u0629","description":"\u0639\u0646\u0627\u0635\u0631 \u0627\u0644\u0645\u0647\u0627\u0645 \u0627\u0644\u062e\u0627\u0635\u0629 \u0628\u0627\u0644\u062a\u0634\u0643\u064a\u0644","color":"#A00","logo":"imgs\/group\/05227830866733241.png","date":"1558121726"}'
}
