<?php 
require 'Slim/Slim.php';
require 'db.php';
require 'ekhtar-decoder.php';
\Slim\Slim::registerAutoloader();


//$app = new \Slim\Slim();

$app = new \Slim\Slim(array(
    'log.level' => \Slim\Log::DEBUG,
	'log.enabled' => true
));

$app->get('/e', function () use ($app){
     $request = $app->request();
     $t = $request->get('t');
     encode($t);
});
$app->get('/d', function () use ($app){
     $request = $app->request();
     $t = $request->get('t');
     decode($t);
});

$app->get('/sms2', function () use ($app){
     $request = $app->request();
     $date = $request->get('date');
     $sender = $request->get('sender');
     $body = $request->get('body');
     $pl = new Ekhtar_SMS_Payload($sender, $date, $body);
    
    $epl = $pl->getEkhtar_Payload();
     echo $epl->getPayload();
    echo "<br/>";
    echo $epl->getCodedPayload();
    
});
$app->get('/sms', function () use ($app){
     $request = $app->request();
     $cell = $request->get('cell');
     $long = $request->get('long');
     $lat = $request->get('lat');
     $msg = $request->get('msg');
     $pl = new Ekhtar_Payload_builder($cell, $long, $lat, $msg);
    
    echo $pl->getPayload();
    echo "<br/>";
    echo $pl->getCodedPayload();
    
});
function decode($t)
{
    echo base64_decode($t);
}


function encode($t)
{
    echo base64_encode($t);
}

/*
$app->get('/e-sms', function () use($app){
            $remote_ipaddress = $_SERVER['REMOTE_ADDR'];
            $request = $app->request();
            $sender = $request->get('sender');
            $date = $request->get('date');
            $body = $request->get('body');
            sms($sender, $date, $body, $remote_ipaddress);
        });

$app->post('/e-sms', function () use($app){
            $remote_ipaddress = $_SERVER['REMOTE_ADDR'];
            $request = $app->request();
            $json = $request->getBody();
            $data = json_decode($json, true);
            $sender = $data["sender"];
            $date = $data['date'];
            $body = $data['body'];
            sms($sender, $date, $body, $remote_ipaddress);
});

$app->get('/e-sms/:sender/:date/:body', 'sms');
*/
//$app->post('/e-sms/:sender/:date/:body', 'sms');

 
// During instantiation
// After instantiation
//$log = $app->getLog();
//$log->setLevel(\Slim\Log::WARN);

$app->run();
/*
function sms($sender, $date, $body, $remote_ipaddress){
    $results = array(
        "is_errors" => 0,
        "info" => ""
    );     
	$req = '{status:"OK", sender:"'.$sender.
		   '",date:"'.$date.
	       '",body:"'.$body.'",ip:"'.$remote_ipaddress.'"}';	 
	$file = 'sms.txt';
	$file_contents = file_get_contents($file);
	$file_contents = $req ."\n";//. $file_contents;
	file_put_contents($file, $file_contents, FILE_APPEND | LOCK_EX);
    $validation_results = validate_input($sender, $date, $body);
    if (!empty($validation_results))
    {
        $rr = json_encode($validation_results);
        echo '{status:"FAILED", erros:'.$rr.'}';
        exit;
    }
    if (! insert_sms('sytl', $sender, $date, $body, $remote_ipaddress)){        
        echo '{status:"Error", info :"database failed"}';
        exit;    
    }
        echo '{status:"OK", info :"SMS added"}';
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
*/
?>
