<?php
require_once 'lib/nusoap.php';
$client = new nusoap_client("http://192.168.90.13:7778/ws/server?wsdl", true);

$client->soap_defencoding = 'UTF-8';
$client->decode_utf8 = false;
$error  = $client->getError();
 $result=array();
if ($error) 
    {
    echo "<h2>Constructor error</h2><pre>" . $error . "</pre>";
}
$result = $client->call("getReportsByCoordinate",array("arg0" => "30","arg1" =>"30","arg2"=> "40","arg3" => "40")); 
if ($client->fault) {
    echo "<h2>Fault</h2><pre>";
    print_r($result);
    echo "</pre>";
} else {
    $error = $client->getError();
    if ($error) {
        echo "<h2>Error</h2><pre>" . $error . "</pre>";
    } else 
        {

        echo json_encode($result, JSON_UNESCAPED_UNICODE);
    }
}


/*
require_once 'lib/nusoap.php';
 
echo "The Key Word<br/>";
if(isset($_GET['key_word'])){
    echo $_GET['key_word']."<br/>";
}else{
    echo "not set!!<br/>";
}

echo "The Date<br/>";
if(isset($_GET['starttime'])){
    echo $_GET['starttime']."<br/>";
}else{
    echo "not set!!<br/>";
}








echo "The L1<br/>";
if(isset($_GET['l1'])){
    echo $_GET['l1']."<br/>";
}else{
    echo "not set!!<br/>";
}

echo "The L2<br/>";
if(isset($_GET['l2'])){
    echo $_GET['l2']."<br/>";
}else{
    echo "not set!!<br/>";
}
echo "The L3<br/>";
if(isset($_GET['l3'])){
    echo $_GET['l3']."<br/>";
}else{
    echo "not set!!<br/>";
}
echo "The L4<br/>";
if(isset($_GET['l4'])){
    echo $_GET['l4']."<br/>";
}else{
    echo "not set!!<br/>";
}
$client = new nusoap_client("http://82.137.193.46:7778/ws/server?wsdl", true);
$error  = $client->getError();
 
if ($error) {
    echo "<h2>Constructor error</h2><pre>" . $error . "</pre>";
}
 
$result = $client->call("getReportsByCoordinate",array("arg0" => "30","arg1" =>"30","arg2"=> "40","arg3" => "40"));
 
if ($client->fault) {
    echo "<h2>Fault</h2><pre>";
    print_r($result);
    echo "</pre>";
} else {
    $error = $client->getError();
    if ($error) {
        echo "<h2>Error</h2><pre>" . $error . "</pre>";
    } else {
        echo "<h2>Main</h2>";
       echo json_encode($result);
    }
}
 
// show soap request and response
echo "<h2>Request</h2>";
echo "<pre>" . htmlspecialchars($client->request, ENT_QUOTES) . "</pre>";
echo "<h2>Response</h2>";
echo "<pre>" . htmlspecialchars($client->response, ENT_QUOTES) . "</pre>";
*/
