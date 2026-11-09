<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once("../../../../wp-load.php");

$path=parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$operation=substr($path, strpos($path, ".php")+5);
$json_args=file_get_contents('php://input');
$json_args_object=json_decode($json_args);

//$operation="removeKeys";
//$json_args_object->new_key="maxi";
switch($operation)
{
	case "connect":
		$key=null;
		if(isset($json_args_object->key))
			$key=$json_args_object->key;
		echo process_connect($key);
	break;
	case "addKey":
		$key=null;
		$new_key=null;
		if(isset($json_args_object->key))
			$key=$json_args_object->key;
		if(isset($json_args_object->new_key))
			$new_key=$json_args_object->new_key;
		echo process_add_key($key, $new_key);
	break;
	case "removeKeys":
		$key=null;
		if(isset($json_args_object->key))
			$key=$json_args_object->key;
		echo process_remove_keys($key);
	break;
	case "getAppointments":
		echo process_get_appointments($json_args_object);
	break;
	case "getStaff":
		echo process_get_staff($json_args_object);
	break;
	case "getStaffIds":
		echo process_get_staff_ids($json_args_object);
	break;
	case "getServices":
		echo process_get_services($json_args_object);
	break;
	default:
		echo "Unsupported operation";
}

function process_connect($key)
{
	if(isset($key) && $key!="")
	{
		$keys=file_get_contents("../keys");
		$key_array=explode("\n", $keys);
		$success = in_array($key, $key_array);
		if(!$success)
			echo '{"status": "error_key"}';

		return $success;
	}
	else
	{
		echo '{"status": "no_security_key"}';
		return false;
	}
}

function process_add_key($key, $new_key)
{
	if(process_connect($key))
	{
		if($new_key!=null)
		{
			$keys=file_put_contents("../keys", "\n" . $new_key, FILE_APPEND);
			return '{"action": "done"}';
		}
		else
			return '{"actoin": "failed", "reason": "no new_key to add"}';
	}
	else
		return '{"action": "failed"}';
}

function process_remove_keys($key)
{
	if(process_connect($key))
		file_put_contents("../keys", $key);
	else
		return '{"action": "failed"}';
}



function process_get_appointments($args_object)
{
	if(process_connect($args_object->key))
	{
		$date_from=null;
		$date_to=null;
		$service=null;
		$staff=null;

		if(isset($args_object->dateFrom))
			$date_from=$args_object->dateFrom;

		if(isset($args_object->dateTo))
			$date_to=$args_object->dateTo;

		if(isset($args_object->staffId))
			$staff=$args_object->staffId;

		if(isset($args_object->serviceName) && $args_object->serviceName!=get_site_url())
				$service=$args_object->serviceName;

		if(isset($args_object->groupBy))
		{
		       if($args_object->groupBy=="staff")
				return json_encode(get_staff_appointments($date_from, $date_to, $service));
		       else if($args_object->groupBy=="plugin")
				return json_encode(get_plugin_appointments($date_from, $date_to, $staff, $service));
		}

		return json_encode(get_total_appointments($date_from, $date_to, $staff, $service));
	}
	else
		return null;
}

function process_get_staff($args_object)
{
	if(process_connect($args_object->key))
		return stripslashes(json_encode(get_staff()));
	else
		return null;
}

function process_get_staff_ids($args_object)
{
	if(process_connect($args_object->key))
		return stripslashes(get_option("appointment-performance-staff"));
	else
		return null;
}

function process_get_services($args_object)
{
	if(process_connect($args_object->key))
		return stripslashes(json_encode(get_services()));
	else
		return null;
}

?>
