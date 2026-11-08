<?php
//php interface provider
//get values
//opt operation name
//arg_n args
//ini_set('display_errors',1);
//ini_set('display_startup_errors',1);
//error_reporting(E_ALL);
require_once('lib/nusoap.php');
require('Session.php');

define('NO_PRIVILEGE', 'There are no privileges!');

$client = new nusoap_client("http://hadoop01.cd:7778/ws/server?wsdl", true);

$client->soap_defencoding = 'UTF-8';
$client->decode_utf8 = false;
$error  = $client->getError();
$result=array();
$isJson=0;
$node=getSessionUser();

if($node=='ehq')
{
	$node=null;
}

if ($error) 
{
	echo "<h2>Constructor error</h2><pre>" . $error . "</pre>";
}

switch ($_POST['op'])
{
	case 'addUser':
		if(getManageUserPrivilege()=="1")
			$result = $client->call('addUser',array("arg0"=>getSessionUser() ,"arg1" => $_POST['name']));
		else
			$result=constant('NO_PRIVILEGE');
                break;
        case 'addCommand':
		if(getSendMessagePrivilege()=="1")
		{
                	$result = $client->call('addCommand',array("arg0" =>$_POST['id'],"arg1" => $_POST['admin'],"arg2" => $_POST['node'],"arg3" => $_POST['text'], "arg4" => $_POST['users']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
                break;
	case 'getKeywords':
                $result = $client->call('getKeywords',array());
                break;
	case 'getCommands':
		if(getSendMessagePrivilege()=="1")
		{
			$result = $client->call('getCommands',array("arg0" => $node, "arg1" =>$_POST['rowKey'],"arg2" => $_POST['offset']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getRealtimeReportsByCoordinate':
		if(getViewNotificationPrivilege()=="1")
		{
			$result = $client->call('getRealtimeReportsByCoordinate',array("arg0" => $node, "arg1" =>$_POST['rowKey'], "arg2" => $_POST['offset'], "arg3" => $_POST['longitude1'], "arg4" => $_POST['latitude1'], "arg5" => $_POST['longitude2'] ,"arg6" => $_POST['latitude2']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getReportsByArgs':
		if(getViewStreamPrivilege()=="1")
		{
			$result = $client->call('getReportsByArgs',array("arg0" => $node,  "arg1" => $_POST['user'], "arg2" => $_POST['keywords'], "arg3" => $_POST['date1'], "arg4" => $_POST['date2'], "arg5" => $_POST['longitude1'], "arg6" => $_POST['latitude1'], "arg7" => $_POST['longitude2'], "arg8" => $_POST['latitude2'] , "arg9" => $_POST['startKey'], "arg10" => $_POST['emaStartKey'], "arg11" => $_POST['offset']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getReportsByImportanceRange':
		if(getViewStreamPrivilege()=="1")
		{
			$result = $client->call('getReportsByImportanceRange',array("arg0" => $node, "arg1" =>$_POST['lowestImportance'],"arg2" => $_POST['maxImportance']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getReportsByClassification':
		if(getViewStreamPrivilege()=="1")
		{
			$result = $client->call('getReportsByClassification',array("arg0" => $node, "arg1" =>$_POST['name']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getReportsByReviewState':
		if(getViewStreamPrivilege()=="1")
		{
			$result = $client->call('getReportsByReviewState',array("arg0" => $node, "arg1" =>$_POST['reviewed'],"arg2" => $_POST['processed']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'setReportComment':
		if(getSetCommentPrivilege()=="1")
		{
			$result = $client->call('setReportComment',array("arg0" => $node, "arg1" =>$_POST['rowKey'],"arg2" => $_POST['text']));
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'setReportImportant':
		if(getSetImportantPrivilege()=="1")
		{
			$result = $client->call('setReportImportant',array("arg0" => $node, "arg1" =>$_POST['rowKey'],"arg2" => $_POST['value']));
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getUsers':
		if(getViewUsersPrivilege()=="1")
		{
			$result = $client->call('getUsers',array("arg0" => $node));
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getUserSim':
		if(getViewUsersPrivilege()=="1")
		{
			$result = $client->call('getUserSim',array("arg0"=>$_POST['name']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getUserDevices':
		if(getViewUsersPrivilege()=="1")
		{
                	$result = $client->call('getUserDevices',array("arg0"=>$_POST['name']));
                	$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getUserNavigations':
		$result = $client->call('getUserNavigations',array("arg0" => $node, "arg1" =>$_POST['name']));
		$isJson=1;
		break;
	case 'getUsersLastPoint':
		if(getViewUsersPrivilege()=="1")
		{
			$result = $client->call('getUsersLastPoint',array("arg0" => $node, "arg1" => $_POST['users']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
	case 'getUsersLastPointByCoordinate':
		if(getViewUsersPrivilege()=="1")
		{
			$result = $client->call('getUsersLastPointByCoordinate',array("arg0" => $node, "arg1" => $_POST['users'], "arg2" => $_POST['date1'], "arg3" => $_POST['date2'], "arg4" => $_POST['longitude1'],"arg5" => $_POST['latitude1'],"arg6" => $_POST['longitude2'],"arg7" => $_POST['latitude2']));
			$isJson=1;
		}
		else
			$result=constant('NO_PRIVILEGE');
		break;
        default:
                $result = array();

}

if ($client->fault) 
{
    echo "<h2>Fault</h2><pre>";
    print_r($result);
    echo "</pre>";
} 
else 
{
    $error = $client->getError();
    	if ($error) 
	{
        	echo "<h2>Error</h2><pre>" . $error . "</pre>";
    	} 
	else 
        {
		printJson($result);
	}
        //echo $result;
       // echo json_encode($result, JSON_UNESCAPED_UNICODE);
}


function printJson($value)
{
        if(is_array($value) && array_keys($value) == range(0,count($value)-1))
		if(count($value['item'])==1)
			echo $value['item'];
		else
		{
                	foreach($value['item'] as $v)
                        	echo $v . '<br />';
		}
       else
                echo $value;
}
?>
