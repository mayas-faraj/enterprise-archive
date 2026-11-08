<?php
	ini_set('session.gc_maxlifetime', 3600000);
	session_start();

	//swich function
	if( isset($_POST['query']))
	{
		$op = $_POST['query'];

		switch ($op)
		{
			case 'saveReportNotification':
				echo saveReportNotification($_POST['count']);
				break;
			case 'getReportNotification':
				echo getReportNotification();
				break;
			case 'saveUserNotification':
				echo saveUserNotification($_POST['count']);
				break;
			case 'getUserNotification':
				echo getUserNotification();
				break;
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
			case 'getManageNodePrivilege':
			        echo getManageNodePrivilege();
				break;
			case 'getManageAdminPrivilege':
				echo getManageAdminPrivilege();
				break;
			case 'getManageUserPrivilege':
				echo getManageUserPrivilege();
				break;
			case 'getSendMessagePrivilege':
				echo getSendMessagePrivilege();
				break;
			case 'getViewUsersPrivilege':
				echo getViewUsersPrivilege();
				break;
			case 'getViewNotificationPrivilege':
				echo getViewNotificationPrivilege();
				break;
			case 'getViewStreamPrivilege':
				echo getViewStreamPrivilege();
				break;
			case 'getSetProcessedPrivilege':
				echo getSetProcessedPrivilege();
				break;
			case 'getSetCommentPrivilege':
				echo getSetCommentPrivilege();
				break;
			case 'getSetImportantPrivilege':
				echo getSetImportantPrivilege();
				break;
			case 'destroySession':
				echo destroySession();
				break;
			default:
				echo 'not implemented session function!';
				break;
		}
	}

	function savePrivileges($manageNode, $manageAdmin, $manageUser, $sendMessage, $viewUsers, $viewNotification, $viewStream, $setProcessed, $setComment, $setImportant, $changeSetting)
	{
		$_SESSION['manageNode']=$manageNode;
		$_SESSION['manageAdmin']=$manageAdmin;
		$_SESSION['manageUser']=$manageUser;
		$_SESSION['sendMessage']=$sendMessage;
		$_SESSION['viewUsers']=$viewUsers;
		$_SESSION['viewNotification']=$viewNotification;
		$_SESSION['viewStream']=$viewStream;
		$_SESSION['setProcessed']=$setProcessed;
		$_SESSION['setComment']=$setComment;
		$_SESSION['setImportant']=$setImportant;
		$_SESSION['changeSetting']=$changeSetting;

		return true;
	}

	function getManageNodePrivilege()
	{
		return $_SESSION['manageNode'];
	}

	function getManageAdminPrivilege()
	{
		return $_SESSION['manageAdmin'];
	}

	function getManageUserPrivilege()
	{
		return $_SESSION['manageUser'];
	}

	function getChangeSettingPrivilege()
	{
		return $_SESSION['changeSetting'];
	}

	function getSendMessagePrivilege()
	{
		return $_SESSION['sendMessage'];
	}

	function getViewUsersPrivilege()
	{
		return $_SESSION['viewUsers'];
	}

	function getViewNotificationPrivilege()
	{
		return $_SESSION['viewNotification'];
	}

	function getViewStreamPrivilege()
	{
		return $_SESSION['viewStream'];
	}

	function getSetProcessedPrivilege()
	{
		return $_SESSION['setProcessed'];
	}

	function getSetCommentPrivilege()
	{
		return $_SESSION['setComment'];
	}

	function getSetImportantPrivilege()
	{
		return $_SESSION['setImportant'];
	}

	function saveReportNotification($count)
	{
		$_SESSION['reportNotification']=$count;
	}

	function getReportNotification()
	{
		return $_SESSION['reportNotification'];
	}

	function saveUserNotification($count)
	{
		$_SESSION['userNotification']=$count;
	}

	function getUserNotification()
	{
		return $_SESSION['userNotification'];
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
