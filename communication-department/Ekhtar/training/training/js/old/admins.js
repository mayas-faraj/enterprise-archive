$(document).ready(function()
{
	//materialize initial
	$('.modal').modal();

	defaultNodeImage=$("#image").attr("src");

	//parsing template
	var contentIconAdmins=$(".content-icon-sets");
	var iconAdmin=$.extend(true, {}, contentIconAdmins.find(">.content-icon"));

	//initial values	
	if(Master.getVariable("schema")==null)
	{
		setMode();

		//load admins
		loadAdmins();
		$("#roleSelect").val(2).formSelect();
	}

	function loadAdmins()
	{
		contentIconAdmins.html("");
		DataAccess.loadHqAdmins(function(result)
		{
			console.log("admins: ", result);
			if(result!=null && result.trim()!="null")
			{
				var admins=result.trim().split("<br />");
				contentIconAdmins.html("");
				for(var i=0;i<admins.length;i++)
					if(admins[i]!="")
					{
						var adminObj=JSON.parse(admins[i]);
						iconAdmin.find(">label").text(adminObj.name);
						iconAdmin.find(">#id").val(adminObj.admin_ID);
						iconAdmin.find(">#role").val(adminObj.role_id);
						iconAdmin.find(">#description").val(adminObj.description);
						
						iconAdmin.find(">#manageNodes").val(adminObj.manageNodes);
						iconAdmin.find(">#manageAdmins").val(adminObj.manageAdmins);
						iconAdmin.find(">#viewUsers").val(adminObj.viewUsers);
						iconAdmin.find(">#viewReports").val(adminObj.viewReports);
						iconAdmin.find(">#sendCommand").val(adminObj.sendCommand);
						iconAdmin.find(">#setImportant").val(adminObj.setImportant);
						iconAdmin.find(">#setComment").val(adminObj.setComment);
						iconAdmin.find(">#setSeen").val(adminObj.setSeen);
						iconAdmin.find(">#changeSetting").val(adminObj.changeSetting);
						iconAdmin.find(">#support").val(adminObj.support);
						contentIconAdmins.append(iconAdmin.get(0).outerHTML);
					}
			}
			else
			{
			}

			$("select").formSelect();
		});
	}

	$("#createButton").click(function()
	{
		setMode();
	});
	
	$("#saveButton").click(function()
	{
		if(Validator.validateHasValue($("#nameText"))
		&& Validator.validateEkhtarId($("#nameText"))
		&& Validator.validateHasValue($("#descriptionText")))
			if($('#manageNodesCheckbox').prop('checked') || $('#manageAdminsCheckbox').prop('checked') || $('#viewUsersCheckbox').prop('checked') || $('#viewReportsCheckbox').prop('checked') || $('#sendCommandCheckbox').prop('checked') || $('#setImportantCheckbox').prop('checked') || $('#setCommentCheckbox').prop('checked') || $('#setSeenCheckbox').prop('checked') || $('#changeSettingCheckbox').prop('checked') || $('#supportCheckbox').prop('checked'))
			{
				var name=$('#nameText').val();
				var jid=StropheAccess.getJid(name);
				var description=$('#descriptionText').val();
				var password=$('#passwordText').val();
				var role=$("#roleSelect").val();

				if($("#adminId").val()=="")
				{
					if(Validator.validateHasValue($("#passwordText")) && Validator.validatePassword($("#passwordText")) && Validator.validatePasswordMatch($("#passwordText, #confirmPasswordText")))
					{
						DataAccess.saveAdmin(name, password, description, parseInt($('#roleSelect').val()) , $('#manageNodesCheckbox').prop('checked')+0, $('#manageAdminsCheckbox').prop('checked')+0, 0 , $('#viewUsersCheckbox').prop('checked')+0 , $('#viewReportsCheckbox').prop('checked')+0 , $('#sendCommandCheckbox').prop('checked')+0 , $('#setImportantCheckbox').prop('checked')+0 , $('#setCommentCheckbox').prop('checked')+0 , $('#setSeenCheckbox').prop('checked')+0, $('#changeSettingCheckbox').prop('checked')+0, $('#supportCheckbox').prop('checked')+0, function(result)
						{
							if(result.trim()=="1")
							{
								console.log('admin has been saved in mysql.');

								StropheAccess.createUser(jid, description, '', password, function(userResult)
								{
									console.log('create user callback:');
									console.log(userResult);

									if($(userResult).attr('type')!='result')
									{
										M.toast({html: "<i class='material-icons'>cancel</i>"+$(userResult).find('error').find('text').html(), classes: "toast-error"});
										return false;
									}

									setMode();
									loadAdmins();
									M.toast({html: "<i class='material-icons'>check_circle</i>تم إدخال مستخدم المقر " + $("#nameText").val() + " بنجاح.", classes: "toast-success"});
								});
							}
							else
							{
								if(result.toLowerCase().indexOf("duplicate"))
									M.toast({html: "<i class='material-icons'>cancel</i>اسم مستخدم المقر موجود مسبقاً, اختيار اسم آخر.", classes: "toast-error"});
								else if(result.toLowerCase().indexOf("permission"))
									M.toast({html: "<i class='material-icons'>cancel</i>لا تملك الصلاحية لتنفيذ الأمر.", classes: "toast-error"});
								else
									M.toast({html: "<i class='material-icons'>cancel</i>خطأ أثناء حفظ مستخدم المقر, "+result, classes: "toast-error"});
							}
						});
					}
				}
				else
				{
					DataAccess.editAdmin($("#adminId").val(), description, parseInt($('#roleSelect').val()) , $('#manageNodesCheckbox').prop('checked')+0, $('#manageAdminsCheckbox').prop('checked')+0, 0 , $('#viewUsersCheckbox').prop('checked')+0 , $('#viewReportsCheckbox').prop('checked')+0 , $('#sendCommandCheckbox').prop('checked')+0 , $('#setImportantCheckbox').prop('checked')+0 , $('#setCommentCheckbox').prop('checked')+0 , $('#setSeenCheckbox').prop('checked')+0, $('#changeSettingCheckbox').prop('checked')+0, $('#supportCheckbox').prop('checked')+0, function(result)
					{
						console.log("edit admin result: ", result);
						if(result.trim()=="1")
						{
							M.toast({html: "<i class='material-icons'>check_circle</i>تم تعديل مستخدم المقر " + $("#nameText").val() + " بنجاح.", classes: "toast-success"});
							loadAdmins();
							StropheAccess.sendMessage((new Date()).getTime(), [StropheAccess.getJid('ehq')], '<privilege>');
						}
						else
						{
							M.toast({html: "<i class='material-icons'>cancel</i>خطأ أثناء تعديل مستخدم المقر " + $("#nameText").val() + " ("+ result +")", classes: "toast-error"});
						}
					});
				}
			}
			else
				M.toast({html: "<i class='material-icons'>cancel</i>يجب اختيار صلاحية ممنوحة واحدة على الأقل.", classes: "toast-error"});
	});

	$("#confirmDeleteButton").click(function(result)
	{
			var adminName=$("#nameText").val();
			DataAccess.deleteAdminByName(adminName, function(dbAdminResult)
			{
				if(dbAdminResult.trim()=="1")
				{
					console.log('admin has been deleted from mysql');
					StropheAccess.deleteUser(StropheAccess.getJid(adminName), function(adminResult)
					{
						if($(adminResult).attr('type')=='result')	
						{
							M.toast({html: "<i class='material-icons'>check_circle</i>تم حذف مستخدم المقر ("+adminName+") بنجاح.", classes: "toast-success"});
							setMode();
							loadAdmins();
							StropheAccess.sendMessage((new Date()).getTime(), [StropheAccess.getJid('ehq')], '<privilege>');
						}
						else
							M.toast({html: "<i class='material-icons'>cancel</i>خطأ أثناء حذف مستخدم المقر "+adminName+"("+$(adminResult).find('error').find('text').html()+")", classes: "toast-error"});
					});
				}
				else
				{
					M.toast({html: "<i class='material-icons'>cancel</i>خطأ أثناء حذف مدير مستخدم المقر "+adminName+"("+dbAdminResult+")", classes: "toast-error"});
				}
			});
	});

	$("#roleSelect").change(function()
	{
		switch($(this).val())
		{
			case "1":
				$('#manageNodesCheckbox').prop('checked', true);
				$('#manageAdminsCheckbox').prop('checked', true);
				$('#viewUsersCheckbox').prop('checked', true);
				$('#viewReportsCheckbox').prop('checked', true);
				$('#sendCommandCheckbox').prop('checked', true);
				$('#setImportantCheckbox').prop('checked', true);
				$('#setCommentCheckbox').prop('checked', true);
				$('#setSeenCheckbox').prop('checked', true);
				$('#changeSettingCheckbox').prop('checked', true);
				$('#supportCheckbox').prop('checked', false);

				$("input[type=checkbox]").prop("disabled", "disabled");
			break;
			case "2":
				$('#manageNodesCheckbox').prop('checked', false);
				$('#manageAdminsCheckbox').prop('checked', false);
				$('#viewUsersCheckbox').prop('checked', true);
				$('#viewReportsCheckbox').prop('checked', true);
				$('#sendCommandCheckbox').prop('checked', true);
				$('#setImportantCheckbox').prop('checked', true);
				$('#setCommentCheckbox').prop('checked', true);
				$('#setSeenCheckbox').prop('checked', true);
				$('#changeSettingCheckbox').prop('checked', true);
				$('#supportCheckbox').prop('checked', false);

				$("input[type=checkbox]").prop("disabled", false);
			break;
			case "3":
				$('#manageNodesCheckbox').prop('checked', false);
				$('#manageAdminsCheckbox').prop('checked', false);
				$('#viewUsersCheckbox').prop('checked', false);
				$('#viewReportsCheckbox').prop('checked', false);
				$('#sendCommandCheckbox').prop('checked', false);
				$('#setImportantCheckbox').prop('checked', false);
				$('#setCommentCheckbox').prop('checked', false);
				$('#setSeenCheckbox').prop('checked', false);
				$('#changeSettingCheckbox').prop('checked', false);
				$('#supportCheckbox').prop('checked', true);

				$("input[type=checkbox]").prop("disabled", "disabled");
			break;
		}
	});

	$(document).on('click', '.content-icon', function()
	{
		setMode($(this).find("#id").val(),
			$(this).find("label").text(),
			$(this).find("#description").val(),
			$(this).find("#role").val(),
			$(this).find("#manageNodes").val()=="1",
			$(this).find("#manageAdmins").val()=="1",
			$(this).find("#viewUsers").val()=="1",
			$(this).find("#viewReports").val()=="1",
			$(this).find("#sendCommand").val()=="1",
			$(this).find("#setImportant").val()=="1",
			$(this).find("#setComment").val()=="1",
			$(this).find("#setSeen").val()=="1",
			$(this).find("#changeSetting").val()=="1",
			$(this).find("#support").val()=="1");
	});

	$("#viewReportsCheckbox").click(function()
	{
		if(!$(this).prop("checked"))
		{
			$("#setImportantCheckbox").prop("disabled", "disabled").prop("checked", false);
			$("#setCommentCheckbox").prop("disabled", "disabled").prop("checked", false);
			$("#setSeenCheckbox").prop("disabled", "disabed").prop("checked", false);
		}
		else
		{
			$("#setImportantCheckbox").prop("disabled", "");
			$("#setCommentCheckbox").prop("disabled", "");
			$("#setSeenCheckbox").prop("disabled", "");
		}
	});

	function setMode(id, name, description, role, manageNodes, manageAdmins, viewUsers, viewReports, sendCommand, setImportant, setComment, setSeen, changeSetting, support)
	{
		$("#passwordText, #confirmPasswordText").val("");

		if(id==null)
		{
			$("#adminId").val("");
			$("#nameText").val("");
			$("#descriptionText").val("");
			$("#roleSelect").val("2").formSelect().change();

			$("#createButton").addClass("disabled");
			$("#deleteButton").addClass("disabled");

			$("#nameText, #passwordText, #confirmPasswordText").prop("disabled",false);
		}
		else
		{
			$("#adminId").val(id);
			$("#nameText").val(name);
			$("#descriptionText").val(description);
			$("#roleSelect").val(role).formSelect();

			$("#createButton").removeClass("disabled");
			$("#deleteButton").removeClass("disabled");

			$("#nameText, #passwordText, #confirmPasswordText").prop("disabled",true);

			$('#manageNodesCheckbox').prop('checked', manageNodes);
			$('#manageAdminsCheckbox').prop('checked', manageAdmins);
			$('#viewUsersCheckbox').prop('checked', viewUsers);
			$('#viewReportsCheckbox').prop('checked', viewReports);
			$('#sendCommandCheckbox').prop('checked', sendCommand);
			$('#setImportantCheckbox').prop('checked', setImportant);
			$('#setCommentCheckbox').prop('checked', setComment);
			$('#setSeenCheckbox').prop('checked', setSeen);
			$('#changeSettingCheckbox').prop('checked', changeSetting);
			$('#supportCheckbox').prop('checked', support);

		}

		M.updateTextFields();
	}
});
