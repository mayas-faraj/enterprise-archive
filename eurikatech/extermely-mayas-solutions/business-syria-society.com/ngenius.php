<?php
if(!isset($_REQUEST["c"]))
	header("Location: https://nadabader.com");
else if(intval($_REQUEST["c"])==0 || $_REQUEST["cos"]=="1") {
	header("Location: https://nadabader.com/thank-you");
    die();
}

$price=intval($_REQUEST["c"]);
$location="";

switch($_REQUEST["l"]) {
case "1":
	$location="in Studio";
	break;
case "2":
	$location="in Dubai";
	$price+=300;
	break;
case "3":
	$location="out Dubia";
	$price+=500;
	break;
default:
	$location="unknown";
	break;
}

$price*=100;

$apikey = "MDQ1ZGU4ZjItNjYyOS00OTRmLTg5NjktNjMwOGEwZTliZGM3OjkyNWZlYzg1LTY3MDAtNGNjZS05NjNlLTgyYTI1Yzk4NWFiMA==";
$ch = curl_init(); 
curl_setopt($ch, CURLOPT_URL, "https://api-gateway.sandbox.ngenius-payments.com/identity/auth/access-token"); 
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    "accept: application/vnd.ni-identity.v1+json",
    "authorization: Basic ".$apikey,
    "content-type: application/vnd.ni-identity.v1+json"
  )); 
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);   
curl_setopt($ch, CURLOPT_POST, 1); 
curl_setopt($ch, CURLOPT_POSTFIELDS,  "{\"realmName\":\"ni\"}"); 
$output = json_decode(curl_exec($ch)); 
$access_token = $output->access_token;  
$postData = new StdClass(); 
$postData->action = "AUTH"; 
$postData->amount = new StdClass();
$postData->amount->currencyCode = "AED"; 
$postData->amount->value = $price;
$postData->emailAddress = $_REQUEST["m"];
$postData->billingAddress = new StdClass();
$postData->billingAddress->firstName=$_REQUEST["n"];
$postData->billingAddress->lastName=$_REQUEST["p"].", service: " .$_REQUEST["s"] . "," . $location;
$outlet="a974a9a2-4f9e-43fd-a390-613a9b46bd3b";
$json = json_encode($postData);
$ch = curl_init(); 
curl_setopt($ch, CURLOPT_URL, "https://api-gateway.sandbox.ngenius-payments.com/transactions/outlets/".$outlet."/orders"); 
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    "Authorization: Bearer ".$access_token, 
    "Content-Type: application/vnd.ni-payment.v2+json", 
    "Accept: application/vnd.ni-payment.v2+json")); 
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);   
curl_setopt($ch, CURLOPT_POST, 1); 
curl_setopt($ch, CURLOPT_POSTFIELDS, $json); 
$execution=curl_exec($ch); 
$output = json_decode($execution);
$order_reference = $output->reference; 
$order_paypage_url = $output->_links->payment->href; 
curl_close ($ch); 
if($order_paypage_url!=null)
	header("Location: ".$order_paypage_url);
else {
	var_dump($json);
	var_dump($execution);
	die("error: 508");
}
?>
