$(document).ready(function()
{
	fillIcons();

	function fillIcons()
	{
		var icon = document.getElementById('icon');
		var nodesDiv = document.getElementById('nodesDiv');
		
		nodesDiv.innerHTML="";
		
		DataAccess.loadNodes(function (result)
		{
			console.log(result);
			var nodes = result.trim().split('<br />');
			for(var i=0; i<nodes.length; i++)
				if(nodes[i]!='')
				{
					var node=JSON.parse(nodes[i]);
					if(node.name!='ehq')
					{
						icon.children[0].src='imgs/node/'+node.name+'.png';
						icon.children[2].innerText=node.name;
						icon.children[3].value=node.node_id;
						icon.children[4].value=node.title;
						icon.children[5].value=node.description;
						nodesDiv.innerHTML += icon.outerHTML;
					}
				}

			$('.input-icon').click(function(ev)
			 {
				var children = ev.currentTarget.children;
				$('#idText').val(children[3].value);
				$('#nameText').val(children[2].innerText);
				$('#titleText').val(children[4].value);
				$('#descriptionText').val(children[5].value);
				$('#image').attr('src',children[0].src);
			 });
			
		});
	}

	$('#editButton').click(function()
	{
		if(FormValidation.checkNotEmpty('nameText','resultLabel'))
		{
			//save image

			var imagePath;

			if($('#image').attr('src').substr(0,5)=="data:")
			{
				imagePath = 'imgs/node/'+$('#nameText').val()+'.png';
				ImageUpload.saveImage(imagePath, $('#image').attr('src'), function(v) {console.log("image save state: "+v);});
			}

			DataAccess.editNode($('#idText').val(), $('#titleText').val(), $('#descriptionText').val(), function(result)
			{
				if(result.trim()=="1")
				{
					$('#nameText').val('');
					$('#idText').val('');
					$('#titleText').val('');
					$('#descriptionText').val('');
					$('#image').attr('src','imgs/add_node.png');
					FormValidation.writeLog('تم حفظ التعديلات بنجاح.','resultLabel');
					fillIcons();
				}
				else
				{
					FormValidation.writeError('هطأ أثناء حفظ التغيرات.','resultLabel');
				}
			});
		}
	});

	$('#deleteButton').click(function()
	{
		if(FormValidation.checkNotEmpty('nameText','resultLabel'))
		{
			var id=$('#idText').val();
			var name=$('#nameText').val();

			ImageUpload.deleteImage($('#image').attr('src'), function(v) {console.log(v);});

			DataAccess.deleteNode(id, function(dbNodeResult)
			{
				if(dbNodeResult.trim()=="1")
				{
					console.log('node has been deleted from mysql:', name);
					StropheAccess.deleteNode(name, function(nodeResult)
					{
console.log('x');
						if($(nodeResult).attr('type')=='result')
						{
console.log('y');
							DataAccess.deleteAdminByName(name, function(dbAdminResult)
							{
console.log('z');
								if(dbAdminResult.trim()=="1")
								{
									console.log('admin has been deleted from mysql');
									StropheAccess.deleteUser(StropheAccess.getJid(name), function(adminResult)
									{
										if($(adminResult).attr('type')=='result')	
											FormValidation.writeLog('تم حذف جهة إخطار بنجاح.', 'resultLabel');
										else
											FormValidation.writeError($(adminResult).find('error').find('text').html(), 'resultLabel');
									});
								}
								else
								{
									 FormValidation.writeError('خطأ في قاعدة البيانات أثناء حذف مدير الجهة.'+dbAdminResult, 'resultLabel');
								}
							});

							$('#nameText').val('');
							$('#idText').val('');
							$('#titleText').val('');
							$('#image').attr('src','imgs/add_node.png');
							$('#descriptionText').val('');
						}
						else
							 FormValidation.writeError($(nodeResult).find('text').html(), 'resultLabel');
					});
					
					fillIcons();
				}
				else
					FormValidation.writeError('خطأ أثناء حذف الجهة من قاعدة البيانات.'+dbNodeResult,'resultLabel');
			});
		}
	});	
});
