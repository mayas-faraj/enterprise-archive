<?php
if($_SERVER["REQUEST_METHOD"]=="POST") {
	include "dt-db.php";
	$session_key=$_POST["session_key"];
	session_id($session_key);
	session_start();
	unset($_SESSION["user_id"]);
	unset($_SESSION["user_login"]);
	unset($_SESSION["display_name"]);
	unset($_SESSION["full_access"]);
	session_destroy();
}
?>
