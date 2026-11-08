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
$result = $client->call("getRealtimeReportsByCoordinate",array("arg0" =>$_GET['id'],"arg1" => $_GET['l1'],"arg2" => $_GET['l2'],"arg3" => $_GET['l3'],"arg4" => $_GET['l4'])); 

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
        //echo("  your page notification  php is ready");
        echo json_encode($result, JSON_UNESCAPED_UNICODE);
    }
}

?>
