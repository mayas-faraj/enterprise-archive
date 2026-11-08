<?php

require_once 'lib/nusoap.php';
$client = new nusoap_client("http://192.168.90.13:7778/ws/server?wsdl", true);

$client->soap_defencoding = 'UTF-8';
$client->decode_utf8 = false;

$result = $client->call("getUsersLastPointByCoordinate",array("arg0" =>"0","arg1" => $_GET['l1'],"arg2" => $_GET['l2'],"arg3" => $_GET['l3'],"arg4" => $_GET['l4']));

foreach ($result['item'] as $item)
{
        echo json_decode($item,true)['Publisher'] . ';';
}

?>
