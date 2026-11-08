var Validator =
{
	_validateInput: function(inputs, isValid, successToastMessage, errorToastMessage)
	{
		if(isValid)
		{
			inputs.each(function()
			{
				$(this).removeClass("input-error");
				
			});

			if(successToastMessage!=null && successToastMessage!="")
				M.toast({html: "<i class='material-icons'>check_circle</i>"+successToastMessage});
		}
		else
		{
			inputs.each(function()
			{
				$(this).addClass("input-error").focus();
			});

			if(errorToastMessage!=null && errorToastMessage!="")
				M.toast({html: "<i class='material-icons'>cancel</i>"+errorToastMessage, classes:"toast-error"});
		}

		return isValid;
	},

	_getInputValue: function(input)
	{
		if(input.is("input") || input.is("textarea"))
			return input.val();
		else
			return input.html();
	},

	_validateInputFunction: function(inputs, validateFunction, successToastMessage, errorToastMessage)
	{
		var isValid=true;

		inputs.each(function()
		{
			var value=Validator._getInputValue($(this));
			isValid=isValid && validateFunction(value);
		});

		return Validator._validateInput(inputs, isValid, successToastMessage, errorToastMessage);
	},

	validatePassword: function(inputs)
	{
		return Validator._validateInputFunction(inputs, function(value) {return /(?=.*[\d])(?=.*[a-zA-Z])^[a-zA-Z0-9\!\@\#\$\%\^\&\*\(\)\-\=\_\+\{\}\<\>\[\]\?\\\/]{8,}$/.test(value);}, "", "كلمة المرور تتألف فقط من الأحرف اللاتينية والأرقام وبطول أكبر من ٧ محارف.");
	},

	validatePasswordMatch: function(inputs)
	{
		var isValid=true;
		var password=null;

		inputs.each(function()
		{
			var value=Validator._getInputValue($(this));
		
			if(isValid)
				if(password==null)
					password=value;
				else if(password!=value)
					isValid=false;
		});

		return Validator._validateInput(inputs, isValid, "", "كلمات المرور غير متطابقة.");

	},

	validateHasValue: function(inputs)
	{
		return Validator._validateInputFunction(inputs, function(value){return value!=null && value!=""}, "", "لم يتم إدخال أي قيمة في الحقل.");
	},

	validateJid: function(inputs)
	{
		return Validator._validateInputFunction(inputs, function(value){return /.+@.+/.test(value)}, "", "القيمة المدخلة ليست ضمن صيغة معرف JID.");
	},

	validateEkhtarId: function(inputs)
	{
		return Validator._validateInputFunction(inputs, function(value){return /^[a-zA-z]+[\-0-9a-zA-Z]*$/.test(value);}, "", "صيغة المعرف تحوي فقط على محارف لاتينية وتبدأ بمحرف, أرقام والشرطة السفلية.");
	},

	validatePhoneId: function(inputs)
	{
		return Validator._validateInputFunction(inputs, function(value){return /^9\d{8}$/.test(value);}, "", "معرف هاتف إخطار يجب أن يكون وفق الصيغة 9XXXXXXXX.");
	},
	
	validateInputNumber: function(inputs)
	{
		inputs.keydown(function(event)
		{
			var key=event.charCode || event.keyCode || 0;
			return (key==8 || key==9 || key==13 || key==46 || key==110 || key==190 || 
			(key>=35 && key<=40) || (key>=48 && key<=57) || (key>=96 && key<=105));
		});
	},

	displayErrorMessage: function(message)
	{
		if(message.toLowerCase().indexOf("duplicate"))
			M.toast({html: "<i class='material-icons'>cancel</i>الاسم المدخل موجود مسبقاً, يجب إدخال أسم غير موجود..", classes: "toast-error"});
		else if(result.toLowerCase().indexOf("permission"))
			M.toast({html: "<i class='material-icons'>cancel</i>لا تملك صلاحيات لتنفيذ الأمر.", classes: "toast-error"});
		else if(result.toLowerCase().indexOf("confict"))
			M.toast({html: "<i class='material-icons'>cancel</i>تعارض في الاسم المدخل مع الموجود في بروتوكول الرسائل", classes: "toast-error"});
		else
			M.toast({html: "<i class='material-icons'>cancel</i>"+message, classes: "toast-error"});

	}
};
