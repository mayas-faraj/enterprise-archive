<?php
class ApiManager {
	static public function request($operation) {
		$curl=curl_init();
		curl_setopt($curl, CURLOPT_HTTPHEADER, array("application/json"));
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_URL, "http://localhost/backend/api.php");
		curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($operation));
		$result=curl_exec($curl);
		return json_decode($result);
	}
}
