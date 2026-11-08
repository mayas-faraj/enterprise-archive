$(document).ready(function()
{
	$('#administrator, #observer').click(function(ev)
	{
		var children = ev.currentTarget.children;
		$('#roleId').val(children[2].value);
		$('#roleText').text(children[1].innerText);
		$('#roleImage').attr('src',children[0].src);
	});

	$('#administrator').click();

	$('#addButton').click(function()
	{
		if(FormValidation.checkJidLocal('nameText','resultLabel') &&
		   FormValidation.checkNotEmpty('fullNameText','resultLabel') &&
		   FormValidation.checkPassword('passwordText','resultLabel') &&
		   FormValidation.checkPasswordMatch('passwordText','confirmPasswordText','resultLabel') &&
		   FormValidation.checkNotEmpty('roleText','resultLabel'))
		{
			//prapare date
			var name=$('#nameText').val();
			var password=$('#passwordText').val();
			var fullName=$('#fullNameText').val();
			var firstName=fullName.substr(0,fullName.lastIndexOf(' '));
			var lastName=fullName.substr(fullName.lastIndexOf(' ')+1);
			var description=$('#descriptionText').val();
	
			var jid=StropheAccess.getJid(name);

			//save image
			console.log(name);
			ImageUpload.saveImage('imgs/node/'+name+'.png', $('#image').attr('src'), function(v) {console.log("image saved: "+v);});

			DataAccess.saveAdmin(Strophe.getNodeFromJid(jid), password, fullName, description, '', 1 ,parseInt($('#roleId').val()) , function(result)
			{
				if(result.trim()=="1")
                                {
					console.log('admin has been saved into mysql.');

					StropheAccess.createUser(jid, firstName, lastName, password, function(userResult)
					{
						if($(userResult).attr('type')=='result')
						{
							$('#nameText').val('');
							$('#passwordText').val('');
							$('#confirmPasswordText').val('');
							$('#fullNameText').val('');
							$('#descriptionText').val('');
							$('#image').attr('src','imgs/admin.png');
							FormValidation.writeLog('تم إضافة مستخدم مقر رئيسي بنجاح.', 'resultLabel');
						}
						else if($(result).attr('type')=='error')
						{
							FormValidation.writeError($(result).find('error').find('text').html(), 'resultLabel');
						}
					});
					console.log('admin has been saved into xmpp');
				}	
				else
				{
					FormValidation.writeError("خطأ في قاعدة البيانات "+result.trim(),'resultLabel');
				}
			});
		}
	});
});

