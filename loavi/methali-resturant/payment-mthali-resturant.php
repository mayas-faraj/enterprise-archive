<?php
$days=intval($_REQUEST["days"]);
$price=0;

switch($days) {
    case "6":
        $price=750;
        break;
    case "20":
        $price=2100;
        break;
    case "26":
        $price=2520;
        break;
    default:
        $price=0;
}
$price*=100;


$apikey = "ZWNmYTA3YmItOGZhNC00YjkwLTk2ODItODhhODc1NmUzMDY3OmM5ZjZkMzhhLTE3ZjgtNDZhNS1hMjgzLTllYmVlYTBiMTQzMA==";
$ch = curl_init(); 
curl_setopt($ch, CURLOPT_URL, "https://api-gateway.ngenius-payments.com/identity/auth/access-token"); 
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    "accept: application/vnd.ni-identity.v1+json",
    "authorization: Basic ".$apikey,
    "content-type: application/vnd.ni-identity.v1+json"
  )); 
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);   
curl_setopt($ch, CURLOPT_POST, 1); 
curl_setopt($ch, CURLOPT_POSTFIELDS,  "{\"realmName\":\"networkinternational\"}"); 
$output = json_decode(curl_exec($ch)); 
$access_token = $output->access_token;  
$postData = new StdClass(); 
$postData->action = "AUTH"; 
$postData->amount = new StdClass();
$postData->amount->currencyCode = "AED"; 
$postData->amount->value = $price;
$postData->emailAddress = $_REQUEST["email"];
$postData->billingAddress = new StdClass();
$postData->billingAddress->firstName=$_REQUEST["name"];
$postData->billingAddress->lastName=$_REQUEST["last"].", days: " .$_REQUEST["days"];
$outlet="7d2f06be-897b-4cd6-b0be-ebc63a244c3e";
$json = json_encode($postData);
$ch = curl_init(); 
curl_setopt($ch, CURLOPT_URL, "https://api-gateway.ngenius-payments.com/transactions/outlets/".$outlet."/orders"); 
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