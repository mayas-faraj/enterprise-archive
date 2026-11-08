<?php
function getDB() {
	$dbhost="localhost";
	$dbuser="root";
	$dbpass=""; //un9IEIRBpamZYHpx
	$dbname="test";
	$dbConnection = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass, array(PDO::MYSQL_ATTR_INIT_COMMAND=>"SET NAMES 'UTF8'"));	
	$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
   // $dbConnection->exec("SET CHARSET SET UTF8");
	return $dbConnection;
}
?>