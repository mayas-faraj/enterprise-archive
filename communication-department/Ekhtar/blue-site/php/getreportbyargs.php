<?php
require_once 'lib/nusoap.php';
require('Session.php');

$client = new nusoap_client("http://localhost:7778/ws/server?wsdl", true);

$client->soap_defencoding = 'UTF-8';
$client->decode_utf8 = false;
$error  = $client->getError();
$result=array();
$node=getSessionUser();
$user=$_GET['user'];

if($user=='')
	$user=null;

if($node=='ehq' || $node=='es-cd')
{
	$node=null;
}

if ($error) 
    {
    echo "<h2>Constructor error</h2><pre>" . $error . "</pre>";
}
$result = $client->call("getReportsByArgs",array("arg0" => $node, "arg1" => $user, "arg2" => $_GET['key_word'],"arg3" =>$_GET['starttime'],"arg4"=> $_GET['endtime'],"arg5" => $_GET['l1'],"arg6" => $_GET['l2'],"arg7" => $_GET['l3'],"arg8" => $_GET['l4'],"arg9" => $_GET['id'],"arg10" => "10" )); 

//$result = $client->call("getReportsByArgs",array("arg0" =>$_GET['key_word'],"arg1" =>"01-01-2016 11:11:11","arg2"=> "01-01-2018 11:11:11","arg3" =>"30","arg4" =>"30","arg5" =>"42","arg6" => "42"));
//$result = $client->call("getReportsByArgs",array("arg0" =>$_GET['key_word'],"arg1" =>$_GET[',"arg2"=> "01-01-2$01-2018 11:11:11","arg3" =>"30","arg4" =>"30","arg5" =>"42","arg6" => "42"));

//$result = $client->call("getReportsByArgs",array("arg0" =>"","arg1" =>"01-01-2016 11:11:11","arg2"=>"01-01-2018 11:11:11","arg3" =>"36","arg4" =>"33","arg5" =>"36.5","arg6" => "33.5"));
 

//main
//$result = $client->call("getReportsByArgs",array("arg0" => $_GET['key_word'],"arg1" =>$_GET['starttime'],"arg2"=> $_GET['endtime'],"arg3" => $_GET['l1'],"arg4" => $_GET['l2'],"arg5" => $_GET['l3'],"arg6" => $_GET['l4'])); 




//"arg0" => "\""+$_GET['key_word']+"\"","arg1" =>"\""+$_GET['starttime']+"\"","arg2"=> "\""+$_GET['endtime']+"\""

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
        //  echo $result;
        echo json_encode($result, JSON_UNESCAPED_UNICODE);
    }
}
