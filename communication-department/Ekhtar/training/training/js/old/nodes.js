$(document).ready(function()
{
	//constant region
	var IMAGE_PATH="imgs/node/";

	//materialize initial
	$('.modal').modal(
	{
		onOpenStart: function(modal, trigger)
		{
			$(modal).find("span").html($("#nameText").val());
		}
	});

	//default values
	defaultNodeColor="#000";
	defaultNodeImage=$("#image").attr("src");

	//parsing template
	var contentIconNodes=$(".content-icon-sets");
	var iconNode=$.extend(true, {}, contentIconNodes.find(">.content-icon"));
	var successLabel=$.extend(true, {}, $("#successLabel"));
	var errorLabel=$.extend(true, {}, $("#errorLabel"));

	//initial values	
	if(Master.getVariable("schema")==null)
	{
		$("#successLabel").remove();
		$("#errorLabel").remove();
		setMode();

		//load nodes
		loadNodes();
	}

	function loadNodes()
	{
		contentIconNodes.html("");
		DataAccess.loadNodes(function(result)
		{
			console.log("nodes: ", result);

			if(result!=null && result.trim()!="null")
			{
				var nodes=result.trim().split("<br />");

				for(var i=0;i<nodes.length;i++)
					if(nodes[i]!="")
					{
						var nodeObj=JSON.parse(nodes[i]);
						iconNode.find(">img").attr("src",nodeObj.logo);
						iconNode.find(">label").text(nodeObj.name);
						iconNode.find(">#id").val(nodeObj.node_id);
						iconNode.find(">#color").val(nodeObj.color);
						iconNode.find(">#description").val(nodeObj.description);
						contentIconNodes.append(iconNode.get(0).outerHTML);
					}
			}
			else
			{
			}

			formSelect();
		});
	}

	$("#createButton").click(function()
	{
		setMode();
	});
	
	$("#viewButton").click(function()
	{
		window.location.href="set.html?id="+$("#nameText").val();
	});

	$("#saveButton").click(function()
	{
		if(Validator.validateEkhtarId($("#nameText"))
		&& Validator.validateHasValue($("#descriptionText")))
		{
			var imagePath;
		
			if($("#image").attr("src").startsWith("data:image"))
			{
				
				imagePath=IMAGE_PATH+Math.random().toString().substring(2)+".png";
				ImageUpload.saveImage(imagePath, $('#image').attr('src'), function(v) {console.log(imagePath + " has saved: "+v);});
			}
			else
				imagePath=$("#image").attr("src");

			var name="es-"+$('#nameText').val();
			var jid=StropheAccess.getJid(name);
			var description=$('#descriptionText').val();
			var password=$('#passwordText').val();
			var color=$("#colorSelect").val();

			if($("#nodeId").val()=="")
			{
				if(Validator.validatePassword($("#passwordText")) && Validator.validatePasswordMatch($("#passwordText, #confirmPasswordText")))
				{
					DataAccess.saveAdmin(name, password, description, 3, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, function(dbAdminResult)
					{
						console.log("save admin result: ", dbAdminResult);
						if(dbAdminResult.trim()=="1")
						{
							console.log('admin has been saved in mysql.');
							console.log(jid, description, '', password);
							StropheAccess.createUser(jid, description, '', password, function(userResult)
							{
								console.log('create user callback:');
								console.log(userResult);

								if($(userResult).attr('type')!='error')
								{
									DataAccess.saveNode(name, description, color, imagePath, function(result)
									{
										console.log("save node: ", name, description, color, imagePath, result);
										if(result.trim()=="1")
										{
											console.log('node has been saveded in database.');
											StropheAccess.createNode(name, description, jid, function(nodeResult)
											{
												console.log('create node callback:');
												console.log(nodeResult);

												if($(nodeResult).attr('type')=='result')
												{
													setMode();
													loadNodes();
													SetManager.addSet(name, name, color, imagePath, description, (new Date()).toDateString());
													M.toast({html: "<i class='material-icons'>check_circle</i>تم إدخال الجهة " + $("#nameText").val() + " بنجاح.", classes: "toast-success"});
												}
												else
												{
													DataAccess.deleteNodeByName(name, function(rollbackDeleteNode)
													{
														console.log("rollback delete node result: ", rollbackDeleteNode);
													});

													StropheAccess.deleteUser(jid);
													DataAccess.deleteAdminByName(name, function(rollbackDeleteAdmin)
													{
														console.log("rollback delete admin result: ", rollbackDeleteAdmin);
													});

													Validator.displayErrorMessage($(nodeResult).find('error').find('text').html());
													return false;
												}
											});
										}
										else
										{
											Validator.displayErrorMessage("خطأ أثناء حفظ الجهة, " + result);
											StropheAccess.deleteUser(jid);
											DataAccess.deleteAdminByName(name, function(rollbackDeleteAdmin)
											{
												console.log("rollback delete admin result: ", rollbackDeleteAdmin);
											});
										}
									});
								}
								else
								{
									DataAccess.deleteAdminByName(name, function(rollbackDeleteAdmin)
									{
										console.log("rollback delete admin result: ", rollbackDeleteAdmin);
									});

									Validator.displayErrorMessage($(userResult).find('error').html());
								}
							});
						}
						else
						{
							DataAccess.deleteAdminByName(name, function(rollbackDeleteAdmin)
							{
								console.log("rollback delete admin result: ", rollbackDeleteAdmin);
							});
	
							Validator.displayErrorMessage("خطأ أثناء حفظ الجهة: "+dbAdminResult);
						}
					});
				}
			}
			else
			{
				DataAccess.editNode($("#nodeId").val(), description, color, imagePath, function(result)
				{
					if(result.trim()=="1")
					{
						M.toast({html: "<i class='material-icons'>check_circle</i>تم تعديل الجهة " + $("#nameText").val() + " بنجاح.", classes: "toast-success"});
						SetManager.addSet(name.substring(3), name.substring(3), color, imagePath, description, moment(new Date().getTime()).format(DATE_FORMAT));
						loadNodes();
					}
					else
						Validator.displayErrorMessage("خطأ أثناء إدخال الجهة " + $("#nameText").val() + " ("+ result +")");
				});
			}
		}
	});

	$("#confirmDeleteButton").click(function(result)
	{
		var nodeId=$("#nodeId").val();
		var nodeName=$("#nameText").val();
		var users=SetManager.getSet()[nodeName].users;
		var deleteProgress=$("#deleteProgress");

		deleteUser(0);

		function deleteUser(i)
		{
			if(i<users.length)
			{
				var jid=users[i].jid;
				var name=users[i].name;
				
				InterfaceAccess.loadReportsByArgs(jid, "0", "", "", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", function(reports)
				{	
					if(reports!=null && reports.trim()!="")
					{
						SetManager.updateUser(jid, name, "", null);
						StropheAccess.saveRosterItem(jid, name, "", function()
						{
							console.log("ehq jid blocked: ", jid);
							StropheAccess.presenceUnsubscribed(jid);
							deleteUser(i+1);
						});
					}
					else
					{
						SetManager.removeUser(jid);
						StropheAccess.deleteRosterItem(jid, function()
						{
							console.log("ehq jid deleted completely: ", jid);
							deleteUser(i+1);
						});
					}

					
				});

				var progress=parseInt((i*100)/users.length);
				deleteProgress.css("width", progress.toString()+"%");
			}
			else
			{
				deleteProgress.css("width", "100%");
				DataAccess.deleteNode(nodeId, function(result)
				{
					console.log("delete node from database: ", result);	
					if(result.trim()=="1")
					{
						StropheAccess.deleteNode(nodeName, function(nodeResult)
						{
							console.log("delete node from ejabberd", nodeResult);
							if($(nodeResult).attr('type')=='result')
							{
								DataAccess.deleteAdminByName(nodeName, function(dbAdminResult)
								{
									if(dbAdminResult.trim()=="1")
									{
										console.log('admin has been deleted from mysql');
										StropheAccess.sendMessage((new Date()).getTime(), [StropheAccess.getJid(nodeName)], '<privilege>');
										StropheAccess.deleteUser(StropheAccess.getJid(nodeName), function(adminResult)
										{
											if($(adminResult).attr('type')=='result')	
										{
											console.log("initialization...");
											SetManager.initialize();
											M.toast({html: "<i class='material-icons'>check_circle</i>تم حذف الجهة ("+nodeName+") بنجاح.", classes: "toast-success"});
											setMode();
											loadNodes();
										}
										else
											Validator.displayErrorMessage("خطأ أثناء حذف الجهة "+nodeName+"("+$(adminResult).find('error').find('text').html()+")");
										$("#deleteModal a.modal-close").click();
										$("#deleteModal").modal("close");
									});
								}
								else
								{
									
									Validator.displayErrorMessage("خطأ أثناء حذف مدير الجهة "+nodeName+"("+dbAdminResult+")");
									$("#deleteModal a.modal-close").click();
									$("#deleteModal").modal("close");
								}
							});
						}
						else
						{
							Validator.displayErrorMessage("خطأ أثناء حذف الجهة "+nodeName+"("+$(nodeResult).find('error').find('text').html()+")");
							$("#deleteModal a.modal-close").click();
							$("#deleteModal").modal("close");
						}
					});
				}
			});

			return;
		}
						
		};
	});

	$(document).on('click', '.content-icon', function()
	{
		setMode($(this).find("#id").val(),
			$(this).find("label").text(),
			$(this).find("#description").val(),
			$(this).find("img").attr("src"),
			$(this).find("#color").val());
	});

	function formSelect()
	{
		$("select").formSelect();
		$("#colorSelect>option").each(function(i)
		{
			var color=$(this).attr("data-color");
			var icon=$(this).attr("data-i");
			$(".select-wrapper>ul>li:nth-child("+(i+1).toString()+")>span").css("color", color);
			$(".select-wrapper>ul>li:nth-child("+(i+1).toString()+")>span").prepend("<i class='material-icons'>"+icon+"</i>");
			$(".select-wrapper>ul>li:nth-child("+(i+1).toString()+")>span>i").css("color", color);
		});
	}

	function setMode(id, name, description, logo, color)
	{

		$("#passwordText, #confirmPasswordText").val("");

		if(id==null)
		{
			$("#nodeId").val("");
			$("#nameText").val("");
			$("#descriptionText").val("");
			$("#image").attr("src", defaultNodeImage);
			$("#colorSelect").val(defaultNodeColor);

			$("#nameText").css("width", "");
			$("#esText").removeClass("hide");

			$("#createButton").addClass("disabled");
			$("#deleteButton").addClass("disabled");
			$("#viewButton").addClass("disabled");

			$("#nameText, #passwordText, #confirmPasswordText").prop("disabled",false);
		}
		else
		{
			$("#nodeId").val(id);
			$("#nameText").val(name);
			$("#descriptionText").val(description);
			$("#image").attr("src", logo);
			$("#colorSelect").val(color);

			$("#nameText").css("width", "90%");
			$("#esText").addClass("hide");

			$("#createButton").removeClass("disabled");
			$("#deleteButton").removeClass("disabled");
			$("#viewButton").removeClass("disabled");

			$("#nameText, #passwordText, #confirmPasswordText").prop("disabled",true);
			
		}

		$(".file-path").val("");
		formSelect();
		M.updateTextFields();
	}
});
