$(document).ready(function()
{
	//constant region
	var IMAGE_PATH="imgs/group/";

	//materialize initial
	$('.modal').modal();

	//default values
	defaultGroupColor="#000";
	defaultGroupImage=$("#image").attr("src");

	//parsing template
	var contentIconGroups=$(".content-icon-sets");
	var iconGroup=$.extend(true, {}, contentIconGroups.find(">.content-icon"));
	var successLabel=$.extend(true, {}, $("#successLabel"));
	var errorLabel=$.extend(true, {}, $("#errorLabel"));

	//initial values	
	if(Master.getVariable("schema")==null)
	{
		$("#successLabel").remove();
		$("#errorLabel").remove();
		setMode();

		//load groups
		loadGroups();
	}

	function loadGroups()
	{
		contentIconGroups.html("");
		DataAccess.loadGroups(function(result)
		{
			console.log("groups: ", result);

			if(result!=null && result.trim()!="null")
			{
				var groups=result.trim().split("<br />");

				for(var i=0;i<groups.length;i++)
					if(groups[i]!="")
					{
						console.log(groups[i].length);
						var groupObj=JSON.parse(groups[i]);
						iconGroup.find(">img").attr("src",groupObj.logo);
						iconGroup.find(">label").text(groupObj.name);
						iconGroup.find(">#id").val(groupObj.group_id);
						iconGroup.find(">#color").val(groupObj.color);
						iconGroup.find(">#description").val(groupObj.description);
						contentIconGroups.append(iconGroup.wrapAll("<div>").parent().html());
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
		window.location.href="users.html?set="+$("#groupId").val();
	});

	$("#saveButton").click(function()
	{
		if(Validator.validateHasValue($('#nameText'))
		&& Validator.validateHasValue($('#descriptionText')))
		{
			var imagePath;
		
			if($("#image").attr("src").startsWith("data:image"))
			{
				
				imagePath=IMAGE_PATH+Math.random().toString().substring(2)+".png";
				ImageUpload.saveImage(imagePath, $('#image').attr('src'), function(v) {console.log(imagePath + " has saved: "+v);});
			}
			else
				imagePath=$("#image").attr("src");

			if($("#groupId").val()=="")
			{
				DataAccess.saveGroup($("#nameText").val(), $("#descriptionText").val(), $("#colorSelect").val(), imagePath, function(result)
				{
					if(result.trim()=="1")
					{
						M.toast({html: "<i class='material-icons'>check_circle</i>تم إدخال المجموعة " + $("#nameText").val() + " بنجاح.", classes: "toast-success"});
						setMode();
						SetManager.initialize(function()
						{
							loadGroups();
						});
					}
					else
						Validator.displayErrorMessage("خطأ أثناء إدخال المجموعة " + $("#nameText").val() + " ("+ result +")");
				});
			}
			else
			{
				DataAccess.editGroup($("#groupId").val(), $("#nameText").val(), $("#descriptionText").val(), $("#colorSelect").val(), imagePath, function(result)
				{
					if(result.trim()=="1")
					{
						M.toast({html: "<i class='material-icons'>check_circle</i>تم تعديل المجموعة " + $("#nameText").val() + " بنجاح.", classes: "toast-success"});
						SetManager.initialize(function()
						{
							loadGroups();
						});
					}
					else
					{
						Validator.displayErrorMessage("خطأ أثناء إدخال المجموعة " + $("#nameText").val() + " ("+ result +")");
					}
				});
			}
		}
	});

	$("#confirmDeleteButton").click(function(result)
	{
		DataAccess.deleteGroup($("#groupId").val(), function(result)
		{
			var groupName=$("#nameText").val();
			if(result.trim()=="1")
			{
				M.toast({html: "<i class='material-icons'>check_circle</i>تم حذف المجموع ("+groupName+") بنجاح.", classes: "toast-success"});
				setMode();
				SetManager.initialize(function()
				{
					loadGroups();
				});
			}
			else
				M.toast({html: "<i class='material-icons'>cancel</i>خطأ أثناء حذف المجموعة "+groupName+"("+result+")", classes: "toast-error"});
		});
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
		if(id==null)
		{
			$("#groupId").val("");
			$("#nameText").val("");
			$("#descriptionText").val("");
			$("#image").attr("src", defaultGroupImage);
			$("#colorSelect").val(defaultGroupColor);

			$("#createButton").addClass("disabled");
			$("#deleteButton").addClass("disabled");
			$("#viewButton").addClass("disabled");
		}
		else
		{
			$("#groupId").val(id);
			$("#nameText").val(name);
			$("#descriptionText").val(description);
			$("#image").attr("src", logo);
			$("#colorSelect").val(color);

			$("#createButton").removeClass("disabled");
			$("#deleteButton").removeClass("disabled");
			$("#viewButton").removeClass("disabled");
		}

		$(".file-path").val("");
		formSelect();
		M.updateTextFields();
	}
});
