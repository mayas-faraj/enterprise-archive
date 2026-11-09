$(document).ready(function(){

	$('.form-control').keyup(
		function(){
			if($(this).hasClass('input-empty'))	
				$(this).removeClass('input-empty');});

	$('#send').click(function(){
		name = $('#name').val();
		email = $('#email').val();
		mobile = $('#mobile').val();
		message = $('#message').val();
		recaptcha = grecaptcha.getResponse();

		$("#mail-msg").html('');
		
		var result=null;

		if(name=="")
		{
			result="Please enter your name.";
			$('#name').addClass('input-empty');
		}
		else if(email=="")
		{
			result="Please enter your email.";
			$('#email').addClass('input-empty');
		}
		else if(mobile=="")
		{
			result="please enter your mobile phone number.";
			$('#mobile').addClass('input-empty');
		}
		else if(message=="")
		{
			result="Please put a message.";
			$('#message').addClass('input-empty');
		}
		else if(!/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email))
		{
			result="Please enter a valid email address."
			$('#email').addClass('input-empty');
		}

		if(result!=null)
		{
			$("#mail-msg").html(result);
			return;
		}
		
		$.ajax({
			url: 'ajax.php', 
			method: "GET",
			data: { op:'send-mail', name : name, email : email, mobile : mobile, message : message , "g-recaptcha-response": recaptcha }, 
			dataType: "html",         
			success: function(data) {
				$("#mail-msg").html(data);

				if(data=='Your message sent')
				{
					$('#name').val('');
					$('#email').val('');
					$('#mobile').val('');
					$('#message').val('');
					grecaptcha.reset();
				}
			}
		 });		
		
		
	});
});