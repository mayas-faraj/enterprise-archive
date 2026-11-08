$(document).ready(function()
{
	fillIcons();

	$('#deleteButton').click(function()
	{
		if(FormValidation.checkNotEmpty('nameText','resultLabel'))
		{
			//delete from database
			var jid=StropheAccess.getJid($('#nameText').val());
				
			DataAccess.deleteAdmin($('#idText').val(), function(result)
			{
				if(result.trim()=="1")
                                {
					$('#nameText').val('');
					$('#passwordText').val('');
					$('#confirmPasswordText').val('');
					$('#fullNameText').val('');
					$('#descriptionText').val('');
					$('#image').attr('src','imgs/admin.png');
					FormValidation.writeLog('تم حذف مستخدم المقر الرئيسي بنجاح.', 'resultLabel');
					console.log('admin has been deleted from mysql.');
				}
				else
				{
					FormValidation.writeError(result.trim(), 'resultLabel');
				}

				fillIcons();
			});
		}
	});

	$('#editButton').click(function()
	{
		if(FormValidation.checkNotEmpty('nameText','resultLabel'))
		{
			var jid=StropheAccess.getJid($('#nameText').val());

			var imagePath;

                        if($('#image').attr('src').substr(0,5)=="data:")
                        {
                                imagePath = 'imgs/node/'+(new Date()).getTime()+'.png';
                                saveImage(imagePath, $('#image').attr('src'), function(v) {console.log("image save state: "+v);});
                        }
                        else
                                imagePath=$('#image').attr('src');	

			DataAccess.editAdminInfo($('#idText').val(), $('#fullNameText').val() ,$('#descriptionText').val(), imagePath, function(result)
			{
				if(result.trim()=="1")
				{
					console.log('admin has been updated in mysql.');
					fillIcons();
					FormValidation.writeLog('تم حفظ التغيرات.','resultLabel');
				}
				else
				{
					FormValidation.writeError('خطأ أثناء تعديل بينانات المدير','resultLabel');
				}
			});

			//change password
			if($('#passwordText').val()!='****')
			{
				if(FormValidation.checkPassword('passwordText', 'resultLabel') && FormValidation.checkPasswordMatch('passwordText', 'confirmPasswordText', 'resultLabel'))
				{
					DataAccess.editAdminPassword($('#idText').val(), $('#passwordText').val(), function(result)
					{
						if(result.trim()=="1")
                                		{
		                                        console.log('admin password has been update in mysql.');
							FormValidation.writeLog('تم تعديل كلمة المرور بنجاح.', 'resultLabel');
						}
						else
							FormValidation.writeError('خطأ أثناء تغيير كلمة المرور','resultLabel');
						fillIcons();
					});
				}
	
			}
		}
	});
});

function fillIcons()
{
	var icon = document.getElementById('icon');
	var adminsDiv = document.getElementById('adminsDiv');
	console.log(icon.innerHTML);
	adminsDiv.innerHTML="";

	DataAccess.loadHqAdmins(function (result)
	{
		console.log(result);
		var admins = result.trim().split('<br />');
		for(var i=0; i<admins.length; i++)
			if(admins[i]!='')
			{
				console.log('admin:'+admins[i]+'.');
				var admin=JSON.parse(admins[i]);
				console.log(admin);
				if(admin.name!='ehq')
				{
					//icon.children[0].src="imgs/node/"+admin.name+".png";
					icon.children[0].src="imgs/admin.png";
					icon.children[2].innerText=admin.name;
					icon.children[3].value=admin.admin_ID;
					icon.children[4].value=admin.full_name;
					icon.children[5].value=admin.description;
					icon.children[6].value=admin.type;

					if(admin.role_id=="1")
					{
						icon.children[1].src="imgs/role_administrator.png";
						icon.children[6].value="مدير نظام";
					}
					else
					{
						icon.children[1].src="imgs/role_observer.png";
						icon.children[6].value="مراقب بيانات";
					}

					
	
					adminsDiv.innerHTML += icon.outerHTML;
				}
			}

		$('#adminsDiv .input-icon').click(function(ev)
		{	console.log('clicked');
			var children = ev.currentTarget.children;
			$('#nameText').val(children[2].innerText);
			$('#image').attr('src',children[0].src);
			$('#idText').val(children[3].value);
			$('#fullNameText').val(children[4].value);
			$('#descriptionText').val(children[5].value);
			$('#passwordText').val('****');
			$('#confirmPasswordText').val('****');
			$('#roleName').text(children[6].value);
			
		});
	});
}

