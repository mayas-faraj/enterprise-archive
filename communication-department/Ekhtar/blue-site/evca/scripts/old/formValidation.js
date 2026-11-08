var FormValidation =
{
	checkPassword: function(passwordText, result)
	{
		var value=$('#'+passwordText).val();

		if(/(?=.*\d+.*).{8,}/.test(value))
		{
			FormValidation.writeLog('', result);
			$('#'+passwordText).removeClass('input-error');
			return true;
		}
		else
		{
			$('#'+passwordText).addClass('input-error');

			FormValidation.writeError('كلمة المرور يجب أن تكون بطول أكبر من 7 رموز, وأن تحوي على الأقل رقم.', result);
			return false;
		}
	},

	checkPasswordMatch: function(passwordText, confirmPasswordText, result)
	{
		if($('#'+passwordText).val() == $('#'+confirmPasswordText).val())
		{
			FormValidation.writeLog('', result);
			return true;
		}
		else
		{
			FormValidation.writeError('كلمتا المرور غير متطابقتان', result);
			$('#'+passwordText).addClass('input-error');
			$('#'+confirmPasswordText).addClass('input-error');
			return false;	
		}
	},

	checkNotEmpty: function(text, result)
	{
		if($('#'+text).val().length!=0 || $('#'+text).text().length!=0)
		{
			$('#'+text).removeClass('input-error');
			FormValidation.writeLog('', result);
			return true;
		}
		else
		{
			$('#'+text).addClass('input-error');
			FormValidation.writeError('لم يتم إدخال أي قيمة في مربع النص.', result);
			return false;
		}
	},

	checkJid: function(text, result)
	{
		var value=$('#'+text).val();
		
		if(value.length==0)
			value=$('#'+text).text();

		if(value.length!=0 && value.indexOf('@')>0)
		{
			$('#'+text).removeClass('input-error');
			FormValidation.writeLog('', result);
			return true;
		}
		else
		{
			$('#'+text).addClass('input-error');
			FormValidation.writeError('المعرف المدخل ليس معرف وفق صيغة jid', result);
			return false;
		}
	},

	checkJidLocal: function(text, result)
	{
		if((/^[a-zA-z]+[\-0-9a-zA-Z]*$/).test($('#'+text).val()))
		{
			$('#'+text).removeClass('input-error');
			$('.input-jid-domain').removeClass('input-error');
			$('.input-jid-es').removeClass('input-error');
			FormValidation.writeLog('', result);
			return true;
		}
		else
		{
			$('#'+text).addClass('input-error');
			$('.input-jid-domain').addClass('input-error');
			$('.input-jid-es').addClass('input-error');
			FormValidation.writeError('صيغة المعرف تحوي فقط على أحرف لاتينية, أرقام, الشرطة السفلية.', result);
			return false;
		}
	},

	checkJidPhone: function(text, result)
	{
		if((/^9\d{8}$/).test($('#'+text).val()))
		{
			$('#'+text).removeClass('input-error');
			$('.input-jid-domain').removeClass('input-error');
			FormValidation.writeLog('', result);
			return true;
		}
		else
		{
			$('#'+text).addClass('input-error');
			$('.input-jid-domain').addClass('input-error');
			FormValidation.writeError('المعرف يجب أن يكون وفق الصيغة 9xxxxxxxx', result);
			return false;
		}
	},

	writeError: function(text, result)
	{
		$('#'+result).text(text).css('color', 'red');
	},

	writeLog: function(text, result)
	{
		$('#'+result).text(text).css('color', 'green');
	}
};
