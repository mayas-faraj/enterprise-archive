<?php
//ini_set('display_errors',1);
//ini_set('display_startup_errors',1);
//error_reporting(E_ALL);

//datebase schema
define('NODE_TABLE','node');
define('NODE_ID','node_id');
define('NODE_NAME','name');
define('NODE_TITLE','title');
define('NODE_DESCRIPTION','description');
define('NODE_DATE','date');

define('ADMIN_TABLE','admin');
define('ADMIN_ID','admin_ID');
define('ADMIN_NAME','name');
define('ADMIN_FULLNAME','full_name');
define('ADMIN_DESCRIPTION','description');
define('ADMIN_ROLE','role_id');
define('ADMIN_DATE','date');
define('ADMIN_MANAGENODE', 'manageNode');
define('ADMIN_MANAGEADMIN', 'manageAdmin');
define('ADMIN_MANAGEUSER', 'manageUser');
define('ADMIN_VIEWUSERS', 'viewUsers');
define('ADMIN_VIEWNOTIFICATION', 'viewNotification');
define('ADMIN_VIEWSTREAM', 'viewStream');
define('ADMIN_SENDMESSAGE', 'sendMessage');
define('ADMIN_SETPROCESSED', 'setProcessed');
define('ADMIN_SETCOMMENT', 'setComment');
define('ADMIN_SETIMPORTANT', 'setImportant');
define('ADMIN_CHANGESETTING', 'changeSetting');

define('ROLE_TABLE','role');
define('ROLE_ID','role_id');
define('ROLE_TYPE','type');
define('ROLE_LOGO','role_logo');
define('ROLE_DATE','dete');
define('ROLE_CREATENODE', 'createNode');
define('ROLE_CREATEADMIN', 'createAdmin');
define('ROLE_CREATEUSER', 'createUser');
define('ROLE_SENDMESSAGE', 'sendMessage');
define('ROLE_SETPROCESSED', 'setProcessed');
define('ROLE_SETCOMMENT', 'setComment');
define('ROLE_SETIMPORTANT', 'setImportant');

define('_ADMINISTRATOR', 'مدير النظام');
define('_OBSERVER', 'مراقب البيانات');
define('_STATEHOLDER', 'مدير جهة إخطار');

define('ERROR_PRIVILEGES', 'there are no privileges for this operation.');

require('DataCore.php');
require('Session.php');
//swich function

if(isset($_POST['op']))
{
	$op = $_POST['op'];
	$user = getSessionUser();
	$password = getSessionTone();
	switch ($op)
	{
		case 'dbConnect':
			echo dbConnect($_POST['user'], $_POST['password']);
			break;
		case 'createNodeTable':
			if(getManageNodePrivilege()=="1")
				echo createNodeTable($user, $password);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'createAdminTable':
			if(getManageNodePrivilege()=="1")
				echo createAdminTable($user, $password);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'createRoleTable':
			if(getManageNodePrivilege()=="1")
				echo createRoleTable($user, $password);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'initialDatabase':
			if(getManageNodePrivilege()=="1")
				echo initialDatabase($user, $password);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'saveNode':
			if(getManageNodePrivilege()=="1")
				echo saveNode($user, $password, $_POST['name'], $_POST['title'], $_POST['description']);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'editNode':
			if(getManageNodePrivilege()=="1")
				echo editNode($user, $password, $_POST['id'], $_POST['title'], $_POST['description']);		
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'deleteNode':
			if(getManageNodePrivilege()=="1")
				echo deleteNode($user, $password, $_POST['id']);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'loadNodes':
			if(getManageNodePrivilege()=="1")
				PrintJson(loadNodes($user, $password));
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'findNodeById':
			if(getManageNodePrivilege()=="1" || getSessionNodeId()==$_POST['id'])
				printJson(findNodeById($user, $password, $_POST['id']));
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'findNodeByName':
			printJson(findNodeByName($user, $password, $_POST['name']));
			break;
		case 'saveAdmin':
			if(getManageAdminPrivilege()=="1")
				echo saveAdmin($user, $password, $_POST['name'], $_POST['tone'], $_POST['fullname'] , $_POST['description'], $_POST['roleId'], $_POST['manageNode'], $_POST['manageAdmin'], $_POST['manageUser'], $_POST['viewUsers'], $_POST['viewNotification'], $_POST['viewStream'], $_POST['sendMessage'], $_POST['setProcessed'], $_POST['setComment'], $_POST['setImportant'], $_POST['changeSetting']);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'editAdminInfo':
			if(getManageAdminPrivilege()=="1" || getSessionUserId()==$_POST['id'])
				echo editAdminInfo($user, $password, $_POST['id'], $_POST['fullname'], $_POST['description']);
			else
				echo constant('ERROR_PRIVILEGES');		
			break;
		case 'editAdminPassword':
				if($_POST['oldTone']===$password)
					echo editAdminPassword($user, $password, $_POST['newTone']);
				else
					echo constant('ERROR_PRIVILEGES');
				break;
		case 'deleteAdmin':
			if(getManageAdminPrivilege()=="1")
				echo deleteAdmin($user, $password, $_POST['id']);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'deleteAdminByName':
			if(getManageAdminPrivilege()=="1")
				echo deleteAdminByName($user, $password, $_POST['name']);
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'loadAdmins':
			if(getManageAdminPrivilege()=="1")
				printJson(loadAdmins($user, $password));
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'loadHqAdmins':
			if(getManageAdminPrivilege()=="1")
				printJson(loadHqAdmins($user, $password));
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'findAdminById':
			if(getManageAdminPrivilege()=="1" || getSessionUserId()==$_POST['id'])
				printJson(findAdminById($user, $password, $_POST['id']));
			else
				echo constant('ERROR_PRIVILEGES');
			break;
		case 'findAdminByName':
			printJson(findAdminByName($user, $password, $_POST['name']));
			break;
		case 'loadRoles':
			printJson(loadRoles($user, $password));
			break;
		default:
			echo "Not implemented function";
			break;
	}
}

function printJson($value)
{
	if(is_array($value) && array_keys($value) == range(0,count($value)-1))
		foreach($value as $v)
			echo json_encode($v) . '<br />';
	else
		echo json_encode($value);
}

function arrayHead($value)
{
	if(is_array($value) && array_keys($value) == range(0,count($value)-1))
		return $value[0];
	else
		return null;
}

function dbConnect($inputUser, $inputPassword)
{
	$result=connect($inputUser, $inputPassword);

	if($result==true)
	{
		saveSessionLogin(-1 ,$inputUser, $inputPassword);

		$admin=findAdminByName($inputUser, $inputPassword, $inputUser);
		if($admin!=null) 
		{
			
			saveSessionLogin($admin[constant('ADMIN_ID')], $inputUser, $inputPassword, $inputUser, $admin[constant('ADMIN_ROLE')]);

			savePrivileges($admin[constant('ADMIN_MANAGENODE')], $admin[constant('ADMIN_MANAGEADMIN')],
						$admin[constant('ADMIN_MANAGEUSER')], $admin[constant('ADMIN_SENDMESSAGE')],
						$admin[constant('ADMIN_VIEWUSERS')], $admin[constant('ADMIN_VIEWNOTIFICATION')],
						$admin[constant('ADMIN_VIEWSTREAM')], $admin[constant('ADMIN_SETPROCESSED')], 
						$admin[constant('ADMIN_SETCOMMENT')], $admin[constant('ADMIN_SETIMPORTANT')],
						$admin[constant('ADMIN_CHANGESETTING')]);

			if($admin[constant('ADMIN_ROLE')]=='2' || ($inputUser!='ehq' && $admin[constant('ADMIN_ROLE')]=='1'))
			{
				saveSessionLogin($admin[constant('ADMIN_ID')], 'ehq', 'ehq@1a2s3d4f5g6h', $inputUser, $admin[constant('ADMIN_ROLE')]);
			}
		}
	}

	return $result;
}

function createNodeTable($user, $password)
{
	$sql = 'CREATE TABLE ' . constant('NODE_TABLE') . ' (' .
	constant('NODE_ID') . ' INT NOT NULL AUTO_INCREMENT,' .
	constant('NODE_NAME') . ' NVARCHAR(250) NOT NULL ,' .
	constant('NODE_TITLE') . ' NVARCHAR(250) NOT NULL ,' .
	constant('NODE_DESCRIPTION') . ' NVARCHAR(500) NOT NULL ,' .
	constant('NODE_DATE') . ' TIMESTAMP DEFAULT CURRENT_TIMESTAMP,' .
	'CONSTRAINT ' . constant('NODE_TABLE') . '_unique UNIQUE (' . constant('NODE_NAME') . '),' .
	'PRIMARY KEY (' . constant('NODE_ID') . '));';
	
	return query($user ,$password, $sql);
}

function createAdminTable($user, $password)
{
	$sql = 'CREATE TABLE ' . constant('ADMIN_TABLE') . ' (' .
	constant('ADMIN_ID') . ' INT NOT NULL AUTO_INCREMENT,' .
	constant('ADMIN_NAME') . ' NVARCHAR(250) NOT NULL ,' .
	constant('ADMIN_FULLNAME') . ' NVARCHAR(250) NOT NULL ,' .
	constant('ADMIN_DESCRIPTION') . ' NVARCHAR(250),' .
	constant('ADMIN_ROLE') . ' INT NOT NULL,' .
	constant('ADMIN_DATE') . ' TIMESTAMP DEFAULT CURRENT_TIMESTAMP,' .
	constant('ADMIN_MANAGENODE') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_MANAGEADMIN') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_MANAGEUSER') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_VIEWUSERS') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_VIEWNOTIFICATION') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_VIEWSTREAM') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_SENDMESSAGE') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_SETPROCESSED') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_SETCOMMENT') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_SETIMPORTANT') . ' TINYINT(1) DEFAULT 0,' .
	constant('ADMIN_CHANGESETTING') . ' TINYINT(1) DEFAULT 0,' .
	'CONSTRAINT ' . constant('ADMIN_TABLE') . '_unique UNIQUE (' . constant('ADMIN_NAME') . '),' .
	'FOREIGN KEY (' . constant('ADMIN_ROLE') . ') REFERENCES ' . constant('ROLE_TABLE')  . '(' . constant('ROLE_ID') . '),' .
	'PRIMARY KEY (' . constant('ADMIN_ID') . '));';

	return query($user ,$password, $sql);
}

function createRoleTable($user, $password)
{
	$sql = 'CREATE TABLE ' . constant('ROLE_TABLE') . ' (' . 
	constant('ROLE_ID') . ' INT NOT NULL AUTO_INCREMENT ,' .
	constant('ROLE_TYPE') . ' NVARCHAR(250) NOT NULL ,' .
        constant('ROLE_LOGO') . ' VARCHAR(500),' .
	constant('ROLE_DATE') . ' TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,' .
	constant('ROLE_CREATENODE') . ' TINYINT(1) DEFAULT 0,' .
	constant('ROLE_CREATEADMIN') . ' TINYINT(1) DEFAULT 0,' .
	constant('ROLE_CREATEUSER') . ' TINYINT(1) DEFAULT 0,' .
	constant('ROLE_SENDMESSAGE') . ' TINYINT(1) DEFAULT 0,' .
	constant('ROLE_SETPROCESSED') . ' TINYINT(1) DEFAULT 0,' .
	constant('ROLE_SETCOMMENT') . ' TINYINT(1) DEFAULT 0,' .
	constant('ROLE_SETIMPORTANT') . ' TINYINT(1) DEFAULT 0,' .
	'CONSTRAINT ' . constant('ROLE_TABLE') . '_unique UNIQUE (' . constant('ROLE_TYPE') . '),' .
	'PRIMARY KEY (' . constant('ROLE_ID') . '));';
	
	return query($user ,$password, $sql);
}

function initialDatabase($user, $password)
{
	//build schema
	createNodeTable($user, $password);
	createRoleTable($user, $password);
	createAdminTable($user, $password);	

	//$createNode, $createAdmin, $createUser, $sendMessage, $setProcessed, $setComment, $setImportant
	saveRole($user, $password, constant('_ADMINISTRATOR') , 'imgs/role_administrator.png' , true, true, true, true, true, true, true);
	saveRole($user, $password, constant('_OBSERVER') , 'imgs/role_observer.png', false, false, false, false, true, true, true);
	saveRole($user, $password, constant('_STATEHOLDER') , 'imgs/role_stateholder.png', false, false, true, true, true, true, true);

	//$name, $fullname , $description, $logo, $creatorId, $nodeId, $roleId
	saveAdmin($user, $password, 'ehq', 'ehq@1a2s3d4f5g6h', 'رئاسة الإدارة' , 'HQ for ekhtar system', 'NULL', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
}

function saveNode($user, $password, $name, $title, $description)
{
	$node=constant('NODE_TABLE');
	$nodeName=constant('NODE_NAME');
	$nodeTitle=constant('NODE_TITLE');
	$nodeDescription=constant('NODE_DESCRIPTION');

	$sql = "INSERT INTO $node ($nodeName, $nodeTitle, $nodeDescription) VALUES ('$name', '$title', '$description');";

	return query($user, $password, $sql);
}

function editNode($user, $password, $id, $title, $description)
{
	$node=constant('NODE_TABLE');
	$nodeId=constant('NODE_ID');
	$nodeTitle =constant('NODE_TITLE');
	$nodeDescription=constant('NODE_DESCRIPTION');

	$sql="UPDATE $node SET $nodeTitle  = '$title', $nodeDescription = '$description' WHERE $nodeId = $id";

	return query($user, $password, $sql);
}

function deleteNode($user, $password, $id)
{
	$node=constant('NODE_TABLE');
	$nodeId=constant('NODE_ID');

	$sql="DELETE FROM $node WHERE $nodeId = $id";
	return query($user, $password, $sql);
}

function loadNodes($user, $password, $condition=null)
{
	$node=constant('NODE_TABLE'); 
	$nodeId=constant('NODE_ID');
	$nodeName=constant('NODE_NAME');
	$nodeTitle =constant('NODE_TITLE');
	$nodeDescription=constant('NODE_DESCRIPTION');
	$nodeDate=constant('NODE_DATE');

	$sql="SELECT $nodeId, $nodeName, $nodeTitle, $nodeDescription, $nodeDate FROM $node";

	if($condition!==null && $condition!=='')
	{
		$sql .= " WHERE $condition";
	}

	$sql .= ';';
		
	return select($user, $password, $sql);
}

function findNodeById($user, $password, $id)
{
	$node=constant('NODE_TABLE');
	$nodeId=constant('NODE_ID');
	return arrayHead(loadNodes($user, $password, "$node.$nodeId=$id"));
}

function findNodeByName($user, $password, $name)
{
	$node=constant('NODE_TABLE');
	$nodeName=constant('NODE_NAME');
	return arrayHead(loadNodes($user, $password, "$node.$nodeName='$name'"));
}

function saveAdmin($user, $password, $name, $tone, $fullname , $description, $roleId, $manageNode, $manageAdmin, $manageUser, $viewUsers, $viewNotification, $viewStream, $sendMessage, $setProcessed, $setComment, $setImportant, $changeSetting)
{
	$admin=constant('ADMIN_TABLE');
	$adminName=constant('ADMIN_NAME');
	$adminFullName=constant('ADMIN_FULLNAME');
	$adminDescription=constant('ADMIN_DESCRIPTION');
	$adminRoleId=constant('ADMIN_ROLE');
	$adminManageNode=constant('ADMIN_MANAGENODE');
	$adminManageAdmin=constant('ADMIN_MANAGEADMIN');
	$adminManageUser=constant('ADMIN_MANAGEUSER');
	$adminViewUsers=constant('ADMIN_VIEWUSERS');
	$adminViewNotification=constant('ADMIN_VIEWNOTIFICATION');
	$adminViewStream=constant('ADMIN_VIEWSTREAM');
	$adminSendMessage=constant('ADMIN_SENDMESSAGE');
	$adminSetProcessed=constant('ADMIN_SETPROCESSED');
	$adminSetComment=constant('ADMIN_SETCOMMENT');
	$adminSetImportant=constant('ADMIN_SETIMPORTANT');
	$adminChangeSetting=constant('ADMIN_CHANGESETTING');

	//save admin
	$sql = "INSERT INTO  $admin ($adminName, $adminFullName, $adminDescription, $adminRoleId, $adminManageNode, $adminManageAdmin, $adminManageUser, $adminViewUsers, $adminViewNotification, $adminViewStream, $adminSendMessage, $adminSetProcessed, $adminSetComment, $adminSetImportant, $adminChangeSetting) VALUES ('$name', '$fullname', '$description', $roleId, $manageNode, $manageAdmin, $manageUser, $viewUsers, $viewNotification, $viewStream, $sendMessage, $setProcessed, $setComment, $setImportant, $changeSetting);";	

	query($user, $password, $sql);

	//grant user to mysql
	$sql = "CREATE USER '$name' IDENTIFIED BY '$tone';";
	$id = query($user, $password, $sql);

	if($roleId==1 || $roldId==2)
		$sql = "GRANT ALL PRIVILEGES ON *.* TO '$name' WITH GRANT OPTION;";
	else
		$sql = "GRANT SELECT ON ekhtar.* TO '$name';";
	
	query($user, $password, $sql);
	return $id;
}

function editAdminInfo($user, $password, $id, $fullName ,$description)
{
	$admin=constant('ADMIN_TABLE');
	$adminId=constant('ADMIN_ID');
	$adminFullName=constant('ADMIN_FULLNAME');
	$adminDescription=constant('ADMIN_DESCRIPTION');

	$sql="UPDATE $admin SET $adminFullName  = '$fullName', $adminDescription = '$description' WHERE $adminId = $id";

	return query($user, $password, $sql);
}

function editAdminPassword($user, $password, $newTone)
{
	 //grant user to mysql
	$sql = "SET PASSWORD FOR '$user'=PASSWORD('$newTone')";
        return query($user, $password, $sql);
}

function deleteAdmin($user, $password, $id)
{
	$admin=constant('ADMIN_TABLE');
	$adminId=constant('ADMIN_ID');
	$adminName=constant('ADMIN_NAME');

	$deletingAdmin=findAdminById($user, $password, $id);

	if($deletingAdmin!=null)
	{
		$name=$deletingAdmin[$adminName];
		$sql="DROP USER '$name';";
		query($user, $password, $sql);

		$sql="DELETE FROM $admin WHERE $adminId = $id;";	
		$result = query($user, $password, $sql);

		return $result;
	}
	else
		return 'not found!';
}

function deleteAdminByName($user, $password, $name)
{
	$admin=constant('ADMIN_TABLE');
	$adminId=constant('ADMIN_ID');
	$adminName=constant('ADMIN_NAME');

	$sql="DROP USER '$name';";
	query($user, $password, $sql);

	$sql="DELETE FROM $admin WHERE $adminName = '$name';";
	$result = query($user, $password, $sql);

	return $result;

}

function loadAdmins($user, $password, $condition=null)
{
	$admin=constant('ADMIN_TABLE');
	$adminId=constant('ADMIN_ID');
	$adminName=constant('ADMIN_NAME');
	$adminFullName=constant('ADMIN_FULLNAME');
	$adminDescription=constant('ADMIN_DESCRIPTION');
	$adminDate=constant('ADMIN_DATE');
	$adminRoleId=constant('ADMIN_ROLE');
	$adminManageNode=constant('ADMIN_MANAGENODE');
	$adminManageAdmin=constant('ADMIN_MANAGEADMIN');
	$adminManageUser=constant('ADMIN_MANAGEUSER');
	$adminViewUsers=constant('ADMIN_VIEWUSERS');
	$adminViewNotification=constant('ADMIN_VIEWNOTIFICATION');
	$adminViewStream=constant('ADMIN_VIEWSTREAM');
	$adminSendMessage=constant('ADMIN_SENDMESSAGE');
	$adminSetProcessed=constant('ADMIN_SETPROCESSED');
	$adminSetComment=constant('ADMIN_SETCOMMENT');
	$adminSetImportant=constant('ADMIN_SETIMPORTANT');
	$adminChangeSetting=constant('ADMIN_CHANGESETTING');

	$sql="SELECT $admin.$adminId, $admin.$adminName, $admin.$adminFullName, $admin.$adminDescription, $admin.$adminDate, $admin.$adminRoleId, $admin.$adminManageNode, $admin.$adminManageAdmin, $admin.$adminManageUser, $admin.$adminViewUsers, $admin.$adminViewNotification, $admin.$adminViewStream, $admin.$adminSendMessage, $admin.$adminSetComment, $admin.$adminSetProcessed ,$admin.$adminSetImportant, $admin.$adminChangeSetting FROM $admin";

	if($condition !== null and $condition!=='')
		$sql .= " WHERE $condition";
	$sql .= ';';

	return select($user, $password, $sql);
}

function loadHqAdmins($user, $password)
{
	$admin=constant('ADMIN_TABLE');
	$adminRole=constant('ADMIN_ROLE');

	return loadAdmins($user, $password, "$admin.$adminRole = 1 OR $admin.$adminRole = 2");
}

function findAdminById($user, $password, $id)
{
	$admin=constant('ADMIN_TABLE');
	$adminId=constant('ADMIN_ID');
	return arrayHead(loadAdmins($user, $password, "$admin.$adminId=$id"));
}

function findAdminByName($user, $password, $name) 
{
	$admin=constant('ADMIN_TABLE');
	$adminName=constant('ADMIN_NAME');
	return arrayHead(loadAdmins($user, $password, "$admin.$adminName='$name'"));
}

function saveRole($user, $password, $type, $logo, $createNode, $createAdmin, $createUser, $sendMessage, $setProcessed, $setComment, $setImportant)
{
	$role=constant('ROLE_TABLE');
	$roleType=constant('ROLE_TYPE');
	$roleLogo=constant('ROLE_LOGO');
	$roleCreateNode=constant('ROLE_CREATENODE');
	$roleCreateAdmin=constant('ROLE_CREATEADMIN');
	$roleCreateUser=constant('ROLE_CREATEUSER');
	$roleSendMessage=constant('ROLE_SENDMESSAGE');
	$roleSetProcessed=constant('ROLE_SETPROCESSED');
	$roleSetComment=constant('ROLE_SETCOMMENT');
	$roleSetImportant=constant('ROLE_SETIMPORTANT');

	$createNode=(int)$createNode;
	$createAdmin=(int)$createAdmin;
	$createUser=(int)$createUser;
	$sendMessage=(int)$sendMessage;
	$setProcessed=(int)$setProcessed;
	$setComment=(int)$setComment;
	$setImportant=(int)$setImportant;

	$sql="INSERT INTO $role ($roleType, $roleLogo, $roleCreateNode, $roleCreateAdmin, $roleCreateUser, $roleSendMessage, $roleSetProcessed, $roleSetComment, $roleSetImportant) VALUES ('$type', '$logo', $createNode, $createAdmin, $createUser, $sendMessage, $setProcessed, $setComment, $setImportant);";
	
	return query($user, $password, $sql);
} 

function deleteRole($user, $password, $id)
{
	$role=constant('ROLE_TABLE');
	$roleId=constant('ROLE_ID');

	$sql="DELETE FROM $role WHERE $roleId = $id;";
	return query($user, $password, $sql);
}

function loadRoles($user, $password)
{
	$role=constant('ROLE_TABLE');
	$roleId=constant('ROLE_ID');
	$roleName=constant('ROLE_TYPE');
	$roleCreateNode=constant('ROLE_CREATENODE');
	$roleCreateAdmin=constant('ROLE_CREATEADMIN');
	$roleCreateUser=constant('ROLE_CREATEUSER');
	$roleSendMessage=constant('ROLE_SENDMESSAGE');
	$roleSetProcessed=constant('ROLE_SETPROCESSED');
	$roleSetComment=constant('ROLE_SETCOMMENT');
	$roleSetImportant=constant('ROLE_SETIMPORTANT');

	$sql="SELECT $roleId, $roleName, $roleCreateNode, $roleCreateAdmin, $roleCreateUser, $roleSendMessage, $roleSetProcessed, $roleSetComment, $roleSetImportant FROM $role;";
	return select($user, $password, $sql);
}
?>

