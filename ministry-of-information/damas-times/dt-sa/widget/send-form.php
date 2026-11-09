<?php
if($_SERVER["REQUEST_METHOD"]=="POST") {
	$data = array(
		'secret' => "0x1023CC64A1f5540410E1dB240BeDda58161476dA",
		'response' => $_POST['h-captcha-response']
	);
	$verify = curl_init();
	curl_setopt($verify, CURLOPT_URL, "https://hcaptcha.com/siteverify");
	curl_setopt($verify, CURLOPT_POST, true);
	curl_setopt($verify, CURLOPT_POSTFIELDS, http_build_query($data));
	curl_setopt($verify, CURLOPT_RETURNTRANSFER, true);
	$response = curl_exec($verify);
	$responseData = json_decode($response);
}
?>
<form id="report-form" method="post" action="">
	<input id="name-text" class="small-input" type="text" placeholder="الاسم*" required>
	<input id="phone-text" class="small-input" type="tel" placeholder="الهاتف">
	<input id="email-text" class="small-input" type="email" placeholder="البريد الالكتروني">
	<input id="attrch-file" class="small-input" type="file" value="تحميل صورة أو فيديو" placeholder="#" accept="audio/*,video/*,image/*" required>
	<textarea id="description-text" class="wide-input" placeholder="وصف للمادة المرسلة"></textarea>
	<div class="h-captcha" data-sitekey="d9f5fa17-4b9d-44ad-93de-d3db463277ae"></div>
	<input id="submit-button" type="submit" class="btn wide-input" value="ارسال">
	<?php if(!isset($responseData)): ?>
	<output class="result">يرجى مليء الحقول أعلاه ومن ثم الضغط على "ارسال"</output>
	<?php elseif ($responseData->success): ?>
	<output class="result result-success">شكراً لإرسالكم المعلومات, سوف يتم الاطلاع عليها بأقرب وقت ممكن</output>
	<?php else: ?>
	<output class="result result-error">يرجى اجراء اختبار التحقق</output>
	<?php endif; ?>
</form>
<script src="https://js.hcaptcha.com/1/api.js?hl=ar" async defer></script>
