<html>
	<head>
		<title>Ebla-Tech Back-Link Detector</title>
		<link type="text/css" rel="stylesheet" href="assets/css/style.css"/>
		<link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css"/>
		<link type="text/css" rel="stylesheet" href="assets/css/bootstrap-grid.min.css"/>
		<script type="text/javascript" src="assets/js/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="assets/js/init.js"></script>
		<meta name="description" content="Fine backlink of ebla-tech websites."/>
	</head>
	<body>
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
		<div class="container">
			<h1>Ebla-Tech Review Grapper</h1>
			<div>
				<h2>Initial Data</h2>
				<div class="form-group">
					<label for="idText">App Id</label>
					<input id="idText" type="textbox" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<label for="secretText">App Sectret</label>
					<input id="secretText" type="textbox" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<button id="authButton" class="btn btn-primary mr-3">Get Auth Code</button>
				</div>
				<div class="form-group">
					<label for="authText">Auth Code</label>
					<input id="authText" type="textbox" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<button id="tokenButton" class="btn btn-primary mr-3">Generate Access Token</button>
				</div>
				<div class="form-group">
					<label for="tokenText">Access Token</label>
					<input id="tokenText" type="textbox" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<button id="runButton" class="btn btn-primary mr-3">Run</button>
				</div>

			</div>
			<div>
				<h2>Resutl</h2>
				<h3>Reviews</h3>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Id</th>
							<th scope="col">Text</th>
							<th scope="col">Starts</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
