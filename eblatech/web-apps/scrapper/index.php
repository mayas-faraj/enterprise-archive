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
			<h1>Ebla-Tech Back-Link Detector</h1>
			<div>
				<h2>Initial Data</h2>
				<div class="form-group">
					<label for="scrapySiteText">Input Site</label>
					<input id="scrapySiteText" type="textbox" class="form-control"></textarea>
				</div>

				<div class="form-group">
					<label for="sitesGroupText">Eblatech sites list</label>
					<textarea id="sitesGroupText" class="form-control" row="3">
https://solardentaltx.com/
https://www.lancasterdentaltx.com/
https://www.relydental.com/ IRVING
https://baytowngentledental.com/
https://signaturesmiledfw.com/River Oaks
https://growingsmilestx.com/Of Anna
https://blackswanlimos.com/
https://texasbrightersmile.com/
https://www.kwikkar-lewisville.com/
https://just7.us/
https://www.modacars.net/
https://www.custerfamilydental.com/
https://prosperhealing.com/
https://murphyorthodontics.net/
http://www.myfuturesigns.com/
http://itforscrubs.com/
https://ebla-tech.com/
https://www.krystalglass.com/
https://www.lessardclinic.ca/
https://mymediainstaller.com
https://www.washmastersprosper.com/
https://gmassagechair.com/
https://massagechair.sale/
https://westolivermedical.ca/
https://westwoodpharmacy.ca/
https://onlinelisting.company/
https://bmaconstruction.ca/
https://albanycosmetic.ca/
https://albanylaser.ca/
https://coolsculptingedmonton.com/
https://dnkpharmainc.ca/
https://fraxeledmonton.ca/
https://healthaidpharmacy.ca/
https://sentient-laser.com/
https://sentient-lasers.com/
https://sentientlasers.ca/
https://sentientlasers.net/
https://sentientlasers.org/
https://sentientusedlaser.com/
https://ultheraedmonton.ca/
					</textarea>
				</div>
				<div class="form-group">
					<button id="runButton" class="btn btn-primary mr-3">Run</button>
					<label id="operationLabel">Progress site: the operation.</label>
				</div>
				<div class="form-group">
					<div id="progressBar" class="progress">
						<div class="progress-bar progress-bar-striped" style="width: 10%" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div>
				<h2>Resutl</h2>
				<div id="resultsBlock">
					<div id="resultBlock">
						<h3>[sitename]</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Source</th>
									<th scope="col">Destination</th>
									<th scope="col">Title</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td><a href="#">home</a></td>
									<td><a href="#">www.albanylaser.ca</a></td>
									<td>click here</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
