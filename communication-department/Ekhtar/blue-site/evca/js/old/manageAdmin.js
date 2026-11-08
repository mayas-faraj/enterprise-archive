$(document).ready(function()
{
	$('#administrator, #observer').click(function(ev)
	{
		var children = ev.currentTarget.children;
		$('#roleId').val(children[2].value);
		$('#roleText').text(children[1].innerText);
		$('#roleImage').attr('src',children[0].src);

		var label=$('#privilegeLabel');
		label.text(label.text().substring(0,label.text().indexOf('('))+ '(' + $('#roleText').text() + ')');
		setPrivileges($('#roleId').val());
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

			DataAccess.saveAdmin(Strophe.getNodeFromJid(jid), password, fullName, description, parseInt($('#roleId').val()) , $('#manageNodeCheckbox').prop('checked')+0, $('#manageAdminCheckbox').prop('checked')+0, 0, $('#viewUsersCheckbox').prop('checked')+0 , $('#viewNotificationCheckbox').prop('checked')+0 , $('#viewStreamCheckbox').prop('checked')+0 , $('#sendCommandCheckbox').prop('checked')+0 , $('#setProcessedCheckbox').prop('checked')+0 , $('#setCommentCheckbox').prop('checked')+0 , $('#setImportantCheckbox').prop('checked')+0, $('#changeSettingCheckbox').prop('checked')+0, function(result)
			{
				if(result.trim()=="1")
                                {
					console.log('admin has been saved into mysql.');

					$('#nameText').val('');
					$('#passwordText').val('');
					$('#confirmPasswordText').val('');
					$('#fullNameText').val('');
					$('#descriptionText').val('');
					$('#image').attr('src','imgs/admin.png');
					FormValidation.writeLog('تم إضافة مستخدم مقر رئيسي بنجاح.', 'resultLabel');

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

function setPrivileges(roleId)
{
	if(roleId==1)
	{
		$('input[type="checkbox"]').prop('checked','1');
		$('input[type="checkbox"]').prop('disabled','1');
	}
	else
	{
		$('input[type="checkbox"]').prop('checked','');
		$('input[type="checkbox"]').prop('disabled','');

		$('#viewUsersCheckbox').prop('checked','1');
		$('#viewNotificationCheckbox').prop('checked','1');
		$('#viewStreamCheckbox').prop('checked','1');
		$('#setImportantCheckbox').prop('checked','1');
		$('#setCommentCheckbox').prop('checked','1');
	}
}
