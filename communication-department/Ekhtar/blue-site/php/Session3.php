<?php
	session_start();
	
	//swich function
	if( isset($_POST['query']))
	{
		$op = $_POST['query'];

		switch ($op)
		{
			case 'getSessionUserId':
				echo getSessionUserId();
				break;
			case 'getSessionUser':
				echo getSessionUser();
				break;
			case 'getSessionTone':
				echo getSessionTone();	
				break;
			case 'getSessionRoleId':
				echo getSessionRoleId();
				break;
			case 'getSessionNodeId':
				echo getSessionNodeId();
				break;
			case 'destroySession':
				echo destroySession();
				break;
			default:
				echo 'not implemented session function!';
				break;
		}
	}

	function saveSessionPrivileges($createNode, $createAdmin, $createUser, $sendMessage, $setProcessed, $setComment, $setImportant)
	{
		$_SESSION['createNode']=$createNode;
		$_SESSION['createAdmin']=$createAdmin;
		$_SESSION['createUser']=$createUser;
		$_SESSION['sendMessage']=$sendMessage;
		$_SESSION['setProcessed']=$setProcessed;
		$_SESSION['setComment']=$setComment;
		$_SESSION['setImportant']=$setImportant;

		return true;
	}

	function getSessionCreateNode()
	{
		return $_SESSION['createNode'];
	}

	function getSessionCreateAdmin()
	{
		return $_SESSION['createAdmin'];
	}

	function getSessionCreateUser()
	{
		return $_SESSION['createUser'];
	}

	function getSessionSendMessage()
	{
		return $_SESSION['sendMessage'];
	}

	function getSessionSetProcessed()
	{
		return $_SESSION['setProcessed'];
	}

	function getSessionSetComment()
	{
		return $_SESSION['setComment'];
	}

	function getSessionSetImportant()
	{
		return $_SESSION['setImportant'];
	}

	function saveSessionLogin($userId, $user, $tone, $nodeId, $roleId)
	{
		$_SESSION['id']=$userId;
		$_SESSION['user']=$user;
		$_SESSION['tone']=$tone;
		$_SESSION['node']=$nodeId;
		$_SESSION['role']=$roleId;
		
		return true;
	}

	function getSessionUserId()
	{
		return $_SESSION['id'];
	}

	function getSessionUser()
	{
		return $_SESSION['user'];
	}

	function getSessionTone()
	{
		return $_SESSION['tone'];
	}

	function getSessionNodeId()
	{
		return $_SESSION['node'];
	}

	function getSessionRoleId()
	{
		return $_SESSION['role'];
	}

	function destroySession()
	{
		session_unset();
		session_destroy();
		return true;
	}
?>
