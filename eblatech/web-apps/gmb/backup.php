<html>
	<head>
		<title>Ebla-Tech GMB</title>
		<link type="text/css" rel="stylesheet" href="assets/css/style.css"/>
		<link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css"/>
		<link type="text/css" rel="stylesheet" href="assets/css/bootstrap-grid.min.css"/>
		<script type="text/javascript" src="assets/js/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/init.js"></script>
		<meta name="description" content="GMB interface for eblatech customer."/>
	</head>
	<body>
		<div class="container">
			<h1>Ebla-Tech GMB Interface</h1>
		</div>
		<?php 
		 $params=array('grant_type'=>'authorization_code', 'code'=>'4%2F0gEaGt0ea9KnfOIvJr3jofOS_mX3jhK7aN0vzU72H-t74ADqlUKGt8VjLpyQWonpQX99XqpziIv4Jb_Pa8KFXzY', 'redirect_url'=>'https%3A%2F%2Flocalhost:8000.com%2Fscrapper%2F', 'client_id'=>'39706524552-g2afl7hc62of2sbjuqhlopkcii6sj6c5.apps.googleusercontent.com', 'client_secret'=>'KmAI_FBodeA3j8qVXaarYGFh');
		 $defaults = array(
		 CURLOPT_URL => 'https://accounts.google.com/o/oauth2/token',
		 CURLOPT_POST => true,
		 CURLOPT_POSTFIELDS => $params,
		 );
		 $ch = curl_init();
		 curl_setopt_array($ch, ($defaults));
		 $content=curl_exec($ch);
		 curl_close($ch);
		 echo $content;
		?>
	</body>
</html>
