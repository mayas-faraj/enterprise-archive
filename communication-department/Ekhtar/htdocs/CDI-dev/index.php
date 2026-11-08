<?php 
require 'Slim/Slim.php';
require 'db.php';
\Slim\Slim::registerAutoloader();
 
$app = new \Slim\Slim(array(
    'log.level' => \Slim\Log::DEBUG,
	'log.enabled' => true
));
define('SYRIATEL', 'syriatel');
define('MTN', 'mtn');
function getDataParamOrNull($data, $index)
{
    if (!$data)
        return null;
    if (array_key_exists($index, $data))
        return $data[$index];
    else
        return null;
}

$app->post('/e-sms-syriatel', function () use($app){
            $remote_ipaddress = $_SERVER['REMOTE_ADDR'];
            $request = $app->request();
            $json = $request->getBody();
            $data = json_decode($json, true);
    
            $sender = getDataParamOrNull($data, 'sender');
            $date = getDataParamOrNull($data, 'date');
            $body = getDataParamOrNull($data, 'body');
            $smsc_date = getDataParamOrNull($data, 'smsc_date');
            $is_date = getDataParamOrNull($data, 'is_date'); 
    
            $result = sms(SYRIATEL,$sender, $date, $body, $remote_ipaddress);
            if ($result)
            {
              syriatel_Performance_figures($result, $smsc_date, $is_date, $date);
            }
});

$app->post('/e-sms-mtn', function () use($app){
            $remote_ipaddress = $_SERVER['REMOTE_ADDR'];
            $request = $app->request();
            $json = $request->getBody();
            $data = json_decode($json, true);
    
            $sender = getDataParamOrNull($data, 'sender');
            $date = getDataParamOrNull($data, 'date');
            $body = getDataParamOrNull($data, 'body');
            $smsc_date = getDataParamOrNull($data, 'smsc_date');
            $is_date = getDataParamOrNull($data, 'is_date'); 
    
            $result = sms(MTN,$sender, $date, $body, $remote_ipaddress);
            if ($result)
            {
              mtn_Performance_figures($result, $smsc_date, $is_date, $date);
            }
});

$app->run();

function service_log($provider, $sender, $date, $body, $remote_ipaddress)
{
   $req = '{status:"OK", sender:"'.$sender.
		   '",date:"'.$date.
	       '",body:"'.$body.'",ip:"'.$remote_ipaddress.'"}';
    try
    {
	$file = $provider.'.txt';
	$file_contents = file_get_contents($file);
	$file_contents = $req ."\n"; 
	file_put_contents($file, $file_contents, FILE_APPEND | LOCK_EX); 
    }catch(Exception $e)
    {
        echo $e->getMessage();
        return false;
    }
}

function sms($provider, $sender, $date, $body, $remote_ipaddress){
    $results = array(
        "is_errors" => 0,
        "info" => ""
    );     
	service_log($provider, $sender, $date, $body, $remote_ipaddress);
    $validation_results = validate_input($sender, $date, $body);
    if (!empty($validation_results))
    {
        $rr = json_encode($validation_results);
        echo '{status:"FAILED", erros:'.$rr.'}';
        return false;
    }
    $id = insert_sms($provider, $sender, $date, $body, $remote_ipaddress); 
    if (!$id){        
        echo '{status:"Error", info :"database failed"}';
        return false;    
    }
    echo '{status:"OK", info :"SMS added", id:'.$id.'}';
    return $id;
 } 

function insert_sms($provider, $sender, $date, $body, $remote_ipaddress)
{    
    $sql= "INSERT INTO `tbl_sms`(`provider`, `sender`, `date`, `body`, `ip_address`) VALUES (:provider,:sender, :date, :body, :ip_address)";
    try
    {
        $db = getDB();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("provider", $provider);
        $stmt->bindParam("sender", $sender);
        $stmt->bindParam("date", $date);
        $stmt->bindParam("body", $body);        
        $stmt->bindParam("ip_address", $remote_ipaddress);
        $stmt->execute();
        $lastId = $db->lastInsertId();
        return $lastId;
    } catch(PDOException $e)
    {
        echo $e->getMessage();
        return false;
    }
}
function syriatel_Performance_figures($id, $smsc, $is, $sms)
{
    $sql = "INSERT INTO `tbl_syriatel_perf`(`id`, `smsc_date`, `is_date`, `sms_date`) VALUES (:id,:smsc_date,:is_date,:sms_date)";
    try
    {
        $db = getDB();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->bindParam("smsc_date", $smsc);
        $stmt->bindParam("is_date", $is);
        $stmt->bindParam("sms_date", $sms);  
        $stmt->execute(); 
        return true;
    } catch(PDOException $e)
    {
        echo $e->getMessage();
        return false;
    }
}

function mtn_Performance_figures($id, $smsc, $is, $sms)
{
    $sql = "INSERT INTO `tbl_mtn_perf`(`id`, `smsc_date`, `is_date`, `sms_date`) VALUES (:id,:smsc_date,:is_date,:sms_date)";
    try
    {
        $db = getDB();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->bindParam("smsc_date", $smsc);
        $stmt->bindParam("is_date", $is);
        $stmt->bindParam("sms_date", $sms);  
        $stmt->execute(); 
        return true;
    } catch(PDOException $e)
    {
        echo $e->getMessage();
        return false;
    }
}

function validate_input($sender, $date, $body){ 
    $errors = array();    
    if (empty($sender)){
        $errors ["sender"] = "please provide valid sender";        
    }
    $format = "YmdHis";
    $value = date_create_from_format($format, $date);
    if (!$value){       
        $errors["date"]= "please provide valid date like 20171231235301";        
    }
    else 
    {
        $date = $value;
    }
    if (empty($body)){         
        $errors["body"] = "body is empty";        
    }
    return $errors;
}
?>
