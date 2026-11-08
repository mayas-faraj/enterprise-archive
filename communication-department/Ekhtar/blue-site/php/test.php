<?php
require_once 'lib/nusoap.php';
//echo "<html><head>  <meta charset=UTF-8> </head><body>";
echo "The Key Word   test all 114 mayas 2<br/>";
if(isset($_GET['key_word'])){
    echo '"'.$_GET['key_word']."maj1<br/>";
}else{
    echo "not set!!<br/>";
}

echo "The Date<br/>";
if(isset($_GET['starttime'])){
    echo $_GET['starttime']."<br/>";
}else{
    echo "not set!!<br/>";
}

echo "The Date<br/>";
if(isset($_GET['endtime'])){
    echo $_GET['endtime']."<br/>";
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


 echo "The RowKey<br/>";
if(isset($_GET['RowKey'])){
    echo $_GET['RowKey']."<br/>";
}else{
    echo "not set!!<br/>";
}
// show soap request and response
 
echo '"'.$_GET['key_word'].'"';
echo "<h2>Request get reports by arg0        4</h2>";
echo "<pre>" . htmlspecialchars($client->request, ENT_QUOTES) . "</pre>";
echo "<h2>Response</h2>";
echo "<pre>" . htmlspecialchars($client->response, ENT_QUOTES) . "</pre>";


$client = new nusoap_client("http://192.168.90.13:7778/ws/server?wsdl", true);
$client->soap_defencoding = 'UTF-8';
$client->decode_utf8 = false;
$error  = $client->getError();
$result=array();
if ($error) 
    {
    echo "<h2>Constructor error</h2><pre>" . $error . "</pre>";
}
//$result = $client->call("getUserNavigations",array("arg0" =>"murad"));
//36.74926757812501  34.3207552752374   38.14453125000001   32.953368145799345
//$result = $client->call("getUsersLastPointByCoordinate",array("arg0" =>"0","arg1" =>"36.74926757812501" ,"arg2" =>"34.3207552752374","arg3" => "38.14453125000001","arg4" =>"32.953368145799345" ));

//$result = $client->call("getRealtimeReportsByCoordinateTimestamp",array("arg0" =>"0","arg1" =>"36.74926757812501" ,"arg2" =>"34.3207552752374","arg3" => "38.14453125000001","arg4" =>"32.953368145799345" ));
//$result = $client->call("getRealtimeReportsByCoordinateTimestamp",array("arg0" =>"0","arg1" => "0","arg2" =>"0","arg3" =>"0","arg4" => "0"));
//$result = $client->call("getRealtimeReportsByCoordinateTimestamp",array("arg0" =>"0","arg1" => "35.5","arg2" =>"37.4","arg3" =>"42.5","arg4" => "32"));
$result = $client->call("getReportsByArgs",array("arg0" => $_GET['key_word'],"arg1" =>$_GET['starttime'],"arg2"=> $_GET['endtime'],"arg3" => $_GET['l1'],"arg4" => $_GET['l2'],"arg5" => $_GET['l3'],"arg6" => $_GET['l4'])); 

////copy 
//$result = $client->call("getRealtimeReportsByCoordinateTimestamp",array("arg0" =>"0","arg1" => $_GET['l1'],"arg2" => $_GET['l2'],"arg3" => $_GET['l3'],"arg4" => $_GET['l4'])); 

//$result = $client->call("getUsersLastPoint",array());

//$result = $client->call("getRealtimeReports",array()); 


//$result = $client->call("getUsersLastPoint",array("arg0" =>"0","arg1" => "0","arg2" =>"0","arg3" =>"0","arg4" => "0"));
//$result = $client->call("getRealtimeReportsByTimestamp",array("arg0" =>"1490403533976"));
//$result = $client->call("getUserNavigations",array("arg0" =>"Mayas"));
//
//$result = $client->call("getUsersLastPoint",array("arg0" =>"0","arg1" => "35.5","arg2" =>"32","arg3" =>"42.5","arg4" => "37.5")); 


//$result = $client->call("getUsersLastPoint",array("arg0" =>"6000","arg1" => $_GET['l1'],"arg2" => $_GET['l2'],"arg3" => $_GET['l3'],"arg4" => $_GET['l4'])); 


//$result = $client->call("getRealtimeReportsByTimespan",array("arg0" =>"0","arg1" =>"1"));

//$result = $client->call("getRealtimeReportsByTimespan",array("arg0" =>"0","arg1" =>"1")); 


//$result = $client->call("getRealtimeReports",array());


//$result = $client->call("getRealtimeReportsByOffset",array("arg0" =>"0000000")); 

//$result = $client->call("getRealtimeReportsByArgs",array("arg0" => $_GET['key_word'],"arg1" =>$_GET['starttime'],"arg2"=> $_GET['endtime'],"arg3" => $_GET['l1'],"arg4" => $_GET['l2'],"arg5" => $_GET['l3'],"arg6" => $_GET['l4'])); 

//$result = $client->call("getRealtimeReportsByArgs",array("arg0" => $_GET['key_word'],"arg1" =>$_GET['starttime'],"arg2"=>$_GET['endtime'],"arg3" => $_GET['l1'],"arg4" => $_GET['l4'],"arg5" => $_GET['l3'],"arg6" => $_GET['l2'])); 


//main
//$result = $client->call("getUsers",array("arg0" =>"01-01-2016 11:11:11","arg1" =>"01-01-2018 11:11:11","arg2"=>"0","arg3" =>"0","arg4" => "100","arg5" =>"100")); 

//$result = $client->call("getReportsByArgs",array("arg0" =>"njnjnjnjnj","arg1" =>"01-01-2016 11:11:11","arg2"=> "01-01-2018 11:11:11","arg3" => $_GET['l1'],"arg4" => $_GET['l2'],"arg5" => $_GET['l3'],"arg6" => $_GET['l4']));

//$result = $client->call("getReportsByArgs",array("arg0" =>$_GET['key_word'],"arg1" =>"01-01-2016 11:11:11","arg2"=> "01-01-2018 11:11:11","arg3" =>"30","arg4" =>"30","arg5" =>"42","arg6" => "42")); 

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
echo "json<br/>";
echo "<pre>";
print_r($result);
echo "</pre>";
echo json_encode($result, JSON_UNESCAPED_UNICODE);
echo "<br/>";
echo "<br/>";
echo "<br/>";

 
echo "<br/>";
//header('Content-Type: text/html; charset=utf-8');
echo "<pre>";
print_r($result);
echo "</pre>";


/*
if (count($result->item)==1) 
//if ($result.item.length==1) 
{
echo "Have a good day!<br/>";
$tem=json_encode($result, JSON_UNESCAPED_UNICODE,JSON_FORCE_OBJECT);
print_r($tem);
$tem1="{\"item\":$tem}";
echo $tem1;

}
else
{
$le1=$result.item.length;
echo "<br/>mmmmmmmmmmmmmm<br/>";
print_r($le1);
echo $result->item.length;
echo "<br/>mmmmmmmmmmmmmm<br/>";
echo count($result->item);
//echo "<br/>n22222222222222n<br/>";
//echo "<br/> 00000000000000000<br/>";
//echo json_encode(array_values($result), JSON_UNESCAPED_UNICODE);
echo "<br/> 00000000000000000<br/><br/>";
echo json_encode($result, JSON_UNESCAPED_UNICODE);
}
*/
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/> result";
//header('Content-Type: text/html; charset=utf-8');
print_r($result);


echo "<br/> 9-1";

print_r( iconv("UTF-8", "ISO-8859-1//TRANSLIT", $result));

echo "<br/>";
echo "<br/>";
echo "<br/> iso";



//print_r( iconv("UTF-8", "ISO-8859-1", $result));

echo "<br/>";
echo "<br/>";
echo "<br/>";

//print_r( iconv("ASCII", "UTF-8", $result));

echo "<br/>";
echo "<br/>";
echo "<br/>";





print_r( iconv("UTF-8", "UTF-16", $result));

echo "<br/>";
echo "<br/>";
echo "<br/>";


//print_r( iconv("UTF-8", "ISO-8859-9", $result));

echo "<br/>";
echo "<br/>";
echo "<br/>";

echo "<br/>********************************************************************************";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";


//echo 'IGNORE   : ', iconv("UTF-8", "ISO-8859-1//IGNORE", $result), PHP_EOL;
//echo 'Plain    : ', iconv("UTF-8", "ISO-8859-1", $result), PHP_EOL;

echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";


//print_r(utf8_encode ($result));  
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
      // echo json_encode($result);
echo $result ;
    }
}
 
// show soap request and response
echo "<h2>Request</h2>";
echo "<pre>" . htmlspecialchars($client->request, ENT_QUOTES) . "</pre>";
echo "<h2>Response</h2>";
echo "<pre>" . htmlspecialchars($client->response, ENT_QUOTES) . "</pre>";
*/

echo "</body></html>";
