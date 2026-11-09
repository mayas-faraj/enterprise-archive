<?php
require_once __DIR__ . "/../backend/dt-config.php";
class ApiManager {
	static public function request($operation) {
		return ApiManager::_request($operation, constant("DT_SITEURL") . "backend/api.php");
	}

	static public function login($user, $password) {
		return ApiManager::_request(array("user"=>$user, "password"=>$password), constant("DT_SITEURL") . "backend/dt-login.php");
	}

	static public function logout() {
		return ApiManager::_request(array(), constant("DT_SITEURL") . "backend/dt-login.php");
	}

	static private function _request($operation, $api_url) {
		$curl=curl_init();
		curl_setopt($curl, CURLOPT_HTTPHEADER, array("application/json"));
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_URL, $api_url);
		curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($operation));
		$result=curl_exec($curl);
		return json_decode($result);
	}
}
