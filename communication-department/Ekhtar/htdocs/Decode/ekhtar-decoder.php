<?php 
define("__CELL", "C");
define("__LONGITUDE", "X");
define("__LATITUDE", "Y");
define("__MESSAGE", "M");

class Ekhtar_SMS_Payload
{
    private $sender;
    private $date;
    private $longitude;
    private $latitude;
    private $cgi;
    private $msg;
    
    private $coded_contents;
    private $clear_contents;
        
    public function __construct($sender, $date, $base46Contents)
    {
        $this->sender = $sender;
        $this->date = $date;
        $this->coded_contents = $base46Contents;
        $this->processPayload();
    }
    private function processPayload()
    {
        $this->clear_contents = base64_decode($this->coded_contents);
        $obj = json_decode($this->clear_contents);        
        $s=__CELL;
        $this->cgi= $obj->$s;
        $s=__LONGITUDE;
        $this->longitude= $obj->$s;
        $s = __LONGITUDE;
        $this->latitude= $obj->$s;
        $s=__MESSAGE;
        $this->msg = $obj->$s;        
    }
    public function getEkhtar_Payload()
    {
        return new Ekhtar_Payload_builder($this->cgi, $this->longitude, $this->latitude, $this->msg);
    }
    
}
class Ekhtar_Payload_builder
{
    private $payload;
    
    public function getPayload()
    {
        return $this->payload;
    }
    public function getCodedPayload()
    {
        return base64_encode($this->payload);
    }
    
    public function __construct($cell, $long, $lat, $contnets)
    {
        $this->payload = '{"'.__CELL.'":"'.$cell.'",'
            .'"'.__LONGITUDE.'":"'.$long.'",'
            .'"'.__LATITUDE.'":"'.$lat.'",'
            .'"'.__MESSAGE.'":"'.$contnets.'"'            
            .'}';
    }
}








?>