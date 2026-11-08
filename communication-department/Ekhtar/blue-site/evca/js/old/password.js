$(document).ready(function()
{
	$('#changePasswordButton').click(function()
	{
		//change password
		if(FormValidation.checkNotEmpty('oldPasswordText', 'resultLabel') && FormValidation.checkPassword('passwordText', 'resultLabel') && FormValidation.checkPasswordMatch('passwordText', 'confirmPasswordText', 'resultLabel'))
		{
			DataAccess.editAdminPassword($('#oldPasswordText').val(), $('#passwordText').val(), function(result)
			{
				console.log(result);
				if(result.trim()=="1")
				{
					console.log('admin password has been update in mysql.');
					StropheAccess.changeTone($('#passwordText').val(), function(passwordResult)
					{
						if($(passwordResult).attr('type')=='result')
						{
							$('#oldPasswordText').val('');
							$('#passwordText').val('');
							$('#confirmPasswordText').val('');
							FormValidation.writeLog('تم تعديل كلمة المرور بنجاح.','resultLabel');		
						}
						else if($(passwordResult).attr('type')=='error')
							FormValidation.writeError($(passwordResult).find('error').text(), 'resultLabel');
					});
				}
				else
					FormValidation.writeError('خطأ أثناء تغيير كلمة المرور','resultLabel');
			});
		}
	
	});
});

