$(document).ready(function()
{
	var initialOnlineUsers=[];
	var icon = document.getElementById('icon');
	$('#usersDiv').html("<img class='status-loading input-loading'/>");
	StropheAccess.connected(function()
	{
		StropheAccess.connection.addHandler(function(pres)
		{
			var from=Strophe.getNodeFromJid($(pres).attr('from'));
			var type=$(pres).attr('type');

			if(from!=Strophe.getNodeFromJid(StropheAccess.connection.jid))
				if(type==undefined)
					if($('#icon_'+from).length==1)
						$('#icon_'+from).children().eq(1).removeClass('input-icon-exclamation').removeClass('input-icon-offline').addClass('input-icon-online');
					else
						initialOnlineUsers[from]=0;
				else if(type=='unavailable')
					$('#icon_'+from).children().eq(1).removeClass('input-icon-exclamation').removeClass('input-icon-online').addClass('input-icon-offline');

			return true;
		}, null, 'presence');

		fillIcons();
	});

	$('#addNameText').keydown(function(event)
	{
		if($(this).val().length!=0 || event.keyCode==57 || event.keyCode==105 || event.keyCode==48)
		{
			if(event.keyCode==13)
				$('#addButton').click();
			else if(event.keyCode==46 || event.keyCode==8 || event.keyCode==9 || event.keyCode==27 ||
				(event.keyCode==65 && (event.ctrlKey==true || event.metakey===true)) ||
				(event.keyCode==67 && (event.ctrlKey==true || event.metakey===true)) ||
				(event.keyCode==86 && (event.ctrlKey==true || event.metakey===true)) ||
				(event.keyCode==88 && (event.ctrlKey==true || event.metakey===true)) ||
				(event.keyCode>=35 && event.keyCode<=39))
				return true;
			else if((event.keyCode>=48 && event.keyCode<=57) ||
				(event.keyCode>=96 && event.keyCode<=105))
			{	
				if($(this).val().length==0 || ($(this).val().length<=8 && $(this).val()[0]==9) || (($(this).val().length<=9 && $(this).val()[0]==0)))
				{
					$('#userResultLabel').text('');
					return true;
				}
				else
					FormValidation.writeError('لا يزيد طول معرف المستخدم عن 9 أرقام.', 'userResultLabel');
			}
			else
				FormValidation.writeError('معرف المستخدم يحوي فقط على أرقام.', 'userResultLabel');
		}
		else
			FormValidation.writeError('معرف المستخدم يبدأ برقم 9.', 'userResultLabel');

		return false;	
	});
	
	$('#addButton').click(function()
	{
		if(FormValidation.checkJidPhone('addNameText','userResultLabel'))
		{
				//if($(result).find('item').html()==undefined)
				//{
					InterfaceAccess.addUser($('#addNameText').val(),function(result){console.log("interface callback: "+result);});
					StropheAccess.registerUser(node, StropheAccess.getJid($('#addNameText').val()), function(iq)
					{
						$('#addNameText').val('');
						fillIcons();
					});
				//}
				//else
				//	FormValidation.writeError('المستخدم ينتمي لجهة إخطار مسبقا, فشلت عملية الإضافة', 'userResultLabel');
		}
	});

	$('#deleteButton').click(function()
	{
		if(FormValidation.checkNotEmpty('nameText','usersResultLabel'))
		{
			StropheAccess.unRegisterUser(node, StropheAccess.getJid($('#nameText').html()),function(iq)
			{
				$('#nameText').html('');
				$('#image').attr('src','imgs/admin.png');
				$('#fullNameText').html('');
				$('#addressText').html('');
				$('#jobText').html('');

				fillIcons();
			});
		}
	});


	function fillIcons()
	{
		var usersContent='';
		SessionAccess.getSessionUser(function(value)
		{
			console.log(value);
			name=StropheAccess.getJid(value);
			node=Strophe.getNodeFromJid(name);

			StropheAccess.getUsers(node, function (iq)
			{
				$(iq).find('pubsub').find('affiliation').each(function()
				{
					if($(this).attr('affiliation')=='publisher')
					{
						var name = Strophe.getNodeFromJid($(this).attr('jid'));
						icon.id='icon_'+name;
						icon.children[2].innerText=name;
						StropheAccess.getUserVcard($(this).attr('jid'), function(vcard)
						{
							var from=$(vcard).attr('from');
							//var data=$(vcard).find('PHOTO').find('BINVAL').text();
							var fullName=$(vcard).find('FN').text();
							var job=$(vcard).find('Work01').text()
							var address=$(vcard).find('City').text();
							var ic=$('#icon_'+Strophe.getNodeFromJid(from));
					
							if(fullName!='' || job!='')
							{
								//if(data!='')
								//	ic.children().eq(0).attr('src','data:image/png;base64, ' + $(vcard).find('PHOTO').find('BINVAL').text());
								console.log('id:'+Strophe.getNodeFromJid(from));
								ic.children().eq(3).val(fullName);
								ic.children().eq(4).val(job);
								ic.children().eq(5).val(address);

								if(initialOnlineUsers[Strophe.getNodeFromJid(from)]!=null)
									ic.children().eq(1).removeClass('input-icon-offline').addClass('input-icon-online');
							}
							else
								ic.children().eq(1).removeClass('input-icon-offline').addClass('input-icon-exclamation');

						});

						usersContent += icon.outerHTML;
					}
				});

				$('#usersDiv').html(usersContent);

				$('#usersDiv .input-icon').click(function(ev)
				{	console.log('clicked');
					var children = ev.currentTarget.children;
					$('#nameText').html(children[2].innerText);
					$('#image').attr('src',children[0].src);
					$('#fullNameText').html(children[3].value);
					$('#jobText').html(children[4].value);
					$('#addressText').html(children[5].value);
				});
			});
		});
	}
});

