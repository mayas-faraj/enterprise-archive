var SessionAccess = 
{
	getSessionUserId: function(callback)
	{
		callback(localStorage.getItem("id"));
	},

	getSessionUser: function(callback)
	{
		callback(localStorage.getItem("user"));
	},

	getSessionTone: function(callback)
	{
		callback(localStorage.getItem("tone"));
	},

	getSessionRoleId: function(callback)
	{
		callback(localStorage.getItem("role"));
	},

	getSessionNodeId: function(callback)
	{
		callback(localStorage.getItem("node"));
	},

	getManageNodesPrivilege: function(callback)
	{
		callback(localStorage.getItem("manageNodes"));
	},

	getManageAdminsPrivilege: function(callback)
	{
		callback(localStorage.getItem("ManageAdmins"));
	},

	getManageUsersPrivilege: function(callback)
	{
		callback(localStorage.getItem("manageUsers"));
	},

	getViewUsersPrivilege: function(callback)
	{
		callback(localStorage.getItem("viewUsers"));
	},

	getViewReportsPrivilege: function(callback)
	{
		callback(localStorage.getItem("viewReports"));
	},

	getSendCommandPrivilege: function(callback)
	{
		callback(localStorage.getItem("sendCommand"));
	},

	getSetSeenPrivilege: function(callback)
	{
		callback(localStorage.getItem("setSeen"));
	},

	getSetCommentPrivilege: function(callback)
	{
		callback(localStorage.getItem("setComment"));
	},

	getSetImportantPrivilege: function(callback)
	{
		callback(localStorage.getItem("setImportant"));
	},

	getChangeSettingPrivilege: function(callback)
	{
		callback(localStorage.getItem("changeSetting"));
	},

	getSupportPrivilege: function(callback)
	{
		callback(localStorage.getItem("support"));
	},

	saveVariable: function(name, value, callback)
	{
		localStorage.setItem(name, value);

		if(callback!=null)
			callback("1");
	},

	getVariable: function(name, callback)
	{
		var value=localStorage.getItem("name");
		if(value==null)
			value="";
		if(callback!=null)
			callback(value);
	},

	saveControlList: function()
	{
		if(arguments!=null)
			for(var i=0; i<arguments.length; i++)
			{
				var control=arguments[i];
					
				if(control.is("input[type='checkbox']"))
				{
					SessionAccess.saveVariable(control.attr("id"), control.prop("checked"));
				}
				else if(control.is("input[type='radio']"))
				{
					control.each(function(i)
					{
						if($(this).prop("checked")) 
							SessionAccess.saveVariable(control.attr("name"), i);
					})
				}
				else if(control.is("select"))
				{
					SessionAccess.saveVariable(control.attr("id"), control.val().toString());
				}
				else
				{
					SessionAccess.saveVariable(control.attr("id"), control.val());
				}
			}
	},

	getControlList: function()
	{
		var controlArguments=arguments;
		var getControlValue=function(index)
		{
			if(index==controlArguments.length-1 && typeof controlArguments[index]==="function")
			{
				controlArguments[index]();
			}
			else if(index<controlArguments.length)
			{
				var controlId=controlArguments[index].attr("id");
				if(controlId==null)
					controlId=controlArguments[index].attr("name");

				SessionAccess.getVariable(controlId, function(value)
				{
					var control=controlArguments[index];

					if(control.is("input[type='checkbox']"))
					{
						control.prop("checked", value=="true");
					}
					else if(control.is("input[type='radio']"))
					{
						control.eq(parseInt(value)).click();
					}
					else if(control.is("select"))
					{
						if(value=="[]")
							control.val([]);
						else if(value!="")
							control.val(value.split(","));
					}
					else
					{
						control.val(value);
					}

					getControlValue(++index);
				});
			}
		};

		getControlValue(0);
	},

	destroySession: function(callback)
	{
		localStorage.setItem("id", null);
		localStorage.setItem("user", null);
		localStorage.setItem("tone", null);
		localStorage.setItem("role", null);
		localStorage.setItem("node", null);
		localStorage.setItem("manageNodes", null);
		localStorage.setItem("manageAdmins", null);
		localStorage.setItem("manageUsers", null);
		localStorage.setItem("viewUsers", null);
		localStorage.setItem("viewReports", null);
		localStorage.setItem("sendCommand", null);
		localStorage.setItem("setComment", null);
		localStorage.setItem("setImportant", null);
		localStorage.setItem("setSeen", null);
		localStorage.setItem("changeSetting", null);
		localStorage.setItem("support", null);
		if(callback!=null)
			callback("1");
	}
};

