$(document).ready(function()
{
	$('#addButton').click(function()
	{
		if(FormValidation.checkJidLocal('nameText','resultLabel') && 
		FormValidation.checkNotEmpty('titleText','resultLabel') &&
		FormValidation.checkPassword('passwordText','resultLabel') &&
		FormValidation.checkPasswordMatch('passwordText', 'confirmPasswordText', 'resultLabel'))
		{
			updateStatus();

			//fetch values
			var name="es-"+$('#nameText').val();
			var jid=StropheAccess.getJid(name);
			var title=$('#titleText').val();
			var fullName=$('#fullNameText').val();
			var firstName='';
			var lastName='';
			var password=$('#passwordText').val();
			var imagePath="imgs/node/"+name+".png";
			if(fullName!='')
			{
				if(fullName.indexOf(' ')==-1)
					firstName=fullName;
				else
				{
					firstName=fullName.substring(0,fullName.lastIndexOf(' '));
					lastName=fullName.substring(fullName.lastIndexOf(' ')+1);
				}
			}

			//save image
			console.log("saving image: ", imagePath);
			ImageUpload.saveImage(imagePath, $('#image').attr('src'), function(v) {console.log("image saved: "+v);});

			DataAccess.saveAdmin(name, password, fullName, '', 3, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, function(dbAdminResult)
			{
				if(dbAdminResult.trim()=="1")
				{
					console.log('admin has been saved in mysql.');

					StropheAccess.createUser(jid, firstName, lastName, password, function(userResult)
					{
						console.log('create user callback:');
						console.log(userResult);

						if($(userResult).attr('type')=='result')
							updateAdminStatus(true);
						else
						{
							updateAdminStatus(false);
							FormValidation.writeError($(userResult).find('error').find('text').html(), 'resultLabel');
							return false;
                                                }

						DataAccess.saveNode(name, title, fullName, imagePath, "#FFF", function(dbNodeResult)
						{
							if(dbNodeResult.trim()=="1")
							{
								console.log('node has been saveded in database.');
								updateDbStatus(true);
								StropheAccess.createNode(name, title, jid, function(nodeResult)
								{
									console.log('create node callback:');
									console.log(nodeResult);

									if($(nodeResult).attr('type')=='result')
									{
										updateNodeStatus(true);

										$('#nameText').val('');
										$('#fullNameText').val('');
										$('#titleText').val('');
										$('#passwordText').val('');
										$('#confirmPasswordText').val('');
										$('#image').attr('src', 'imgs/add_node.png');

										SetManager.addSet(Math.random().toString().substring(2,5), name, "#000", imagePath, fullName, (new Date()).toDateString());
									}
									else
									{
										updateNodeStatus(false);
										FormValidation.writeError($(nodeResult).find('error').find('text').html(), 'resultLabel');
										return false;
									}
								});
							}
							else
							{
								FormValidation.writeError('ﺦﻃﺃ ﻒﻳ ﻕﺎﻋﺩﺓ ﺎﻠﺒﻳﺎﻧﺎﺗ أثناء إضافة جهة إخطار. '+dbNodeResult,'resultLabel');
							}
						});
					});
				}
				else
				{
					FormValidation.writeError('خطأ في قاعدة البيانات أثناء إضافة مستخدم إخطار'+dbAdminResult,'resultLabel');
				}
			}); 

		}
	});	
});

function updateStatus()
{
	$('.input-status-image, .input-status-text').removeClass('visibility-hidden');
	$('#adminStatusImage').removeClass('status-success').removeClass('status-error').addClass('status-exclamation');	
	$('#databaseStatusImage').removeClass('status-success').removeClass('status-error').addClass('status-exclamation');
	$('#nodeStatusImage').removeClass('status-success').removeClass('status-error').addClass('status-exclamation');
}

function updateAdminStatus(success)
{
	if(success)
	{
		$('#adminStatusImage').removeClass('status-exclamation').removeClass('status-error').addClass('status-success');
		var label=$('#adminStatusImage + label');
		label.text(label.text().replace('*',StropheAccess.getJid("es-"+$('#nameText').val())));
	}
	else
		$('#adminStatusImage').removeClass('status-exclamation').removeClass('status-success').addClass('status-error');
}

function updateDbStatus(success)
{
	if(success)
	{
		$('#databaseStatusImage').removeClass('status-exclamation').removeClass('status-error').addClass('status-success');
	}
	else
		$('#databaseStatusImage').removeClass('status-exclamation').removeClass('status-success').addClass('status-error');
}

function updateNodeStatus(success)
{
	if(success)
	{
		$('#nodeStatusImage').removeClass('status-exclamation').removeClass('status-error').addClass('status-success');
		var label=$('#nodeStatusImage + label');
		label.text(label.text().replace('*',"es-"+$('#nameText').val()));
	}
	else
		$('#nodeStatusImage').removeClass('status-exclamation').removeClass('status-success').addClass('status-error');
}


