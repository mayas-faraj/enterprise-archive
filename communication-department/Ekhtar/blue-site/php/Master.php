<?php

require('Session.php');

if(isset($_POST['op']))
{
	switch($_POST['op'])
	{
		case 'getHeader':
			if(getSessionUser()=="" || getSessionTone()=="")
			{
				die('<script>window.location.replace("login.html");</script>');
			}
			else
				 echo getHeaderContent('../header_132457689900.html');
			break;
		case 'getFooter':
			echo getContent(file_get_contents('../footer_132457689900.html'));
			break;
		case 'getMainContent':
			echo getMainContent('../main_132457689900.html');
			break;
		case 'validContent':
			echo validContent($_POST['page']);
			break;
		default:
			echo 'not supported content';
			break;
	}
}

function validContent($page)
{
	if(($page=="commands.html" && getSendMessagePrivilege()!="1") ||
	($page=="manageNode.html" && getManageNodePrivilege()!="1") ||
	($page=="nodes.html" && getManageNodePrivilege()!="1") ||
	($page=="manageAdmin.html" && getManageAdminPrivilege()!="1") ||
	($page=="admins.html" && getManageAdminPrivilege()!="1") ||
	($page=="users.html" && getViewUsersPrivilege()!="1") ||
	($page=="browseUsers.html" && getViewUsersPrivilege()!="1") ||
	($page=="mapUsers.html" && getViewUsersPrivilege()!="1") ||
	($page=="notify.html" && getViewNotificationPrivilege()!="1") ||
	($page=="stream.html" && getViewStreamPrivilege()!="1") ||
	($page=="search.html" && getViewStreamPrivilege()!="1") ||
	($page=="profile.html" && getViewStreamPrivilege()!="1"))
		echo "<script>window.location.replace('nonePrivileges.html');</script>";
	else
		echo "";
	
}

function getContent($content)
{
	preg_match("/<body[^>]*>(.*?)<\\/body>/si", $content, $match);
	return $match[1];
}

function getHeaderContent($path)
{
	$document=new DOMDocument;
	$document->loadHtmlFile($path);
	$path=new DOMXPath($document);
	
	if(getSendMessagePrivilege()!="1")
	{
		$query=$path->query("*/div[@class='page-banner']/div[@id='headerCommandDiv']");
		$query->item(0)->parentNode->removeChild($query->item(0));
	}

	if(getViewStreamPrivilege()!="1")
	{
		$query=$path->query("*/div[@class='page-banner']/a[@id='headerStreamLink']");
		$query->item(0)->parentNode->removeChild($query->item(0));
	}

	if(getViewNotificationPrivilege()!="1")
	{
		$query=$path->query("*/div[@class='page-banner']/a[@id='headerNotifyLink']");
		$query->item(0)->parentNode->removeChild($query->item(0));

		$query=$path->query("*/div[@class='page-banner']/div[@id='headerNotifyDiv']");
		$query->item(0)->parentNode->removeChild($query->item(0));
	}

	$query=$path->query("*/div[@class='page-banner']");
	return $document->saveHtml($query->item(0));
}


function getMainContent($path)
{
	$document=new DOMDocument;
	$document->loadHtmlFile($path);
	$path=new DOMXPath($document);
	//$content=$source->saveHTML();

	if(getManageNodePrivilege()!="1")
	{
		$query=$path->query("*/div[@class='page-main']/div[@id='nodeDiv']");
		$query->item(0)->parentNode->removeChild($query->item(0));
	}

	if(getManageAdminPrivilege()!="1")
	{
		$query=$path->query("*/div[@class='page-main']/div[@id='adminDiv']");
		$query->item(0)->parentNode->removeChild($query->item(0));
	}

	if(getManageUserPrivilege()!="1" && getViewUsersPrivilege()!="1")
	{
		$query=$path->query("*/div[@class='page-main']/div[@id='userDiv']");
		$query->item(0)->parentNode->removeChild($query->item(0));
	}
	else
	{
		if(getManageUserPrivilege()!="1")
		{
			$query=$path->query("*/div[@class='page-main']/div[@id='userDiv']/div[@class='input-area']/div[@id='usersDiv']");
			$query->item(0)->parentNode->removeChild($query->item(0));
		}

		if(getViewUsersPrivilege()!="1")
		{
			$query=$path->query("*/div[@class='page-main']/div[@id='userDiv']/div[@class='input-area']/div[@id='presenceUsersDiv']");
			$query->item(0)->parentNode->removeChild($query->item(0));
			$query=$path->query("*/div[@class='page-main']/div[@id='userDiv']/div[@class='input-area']/div[@id='mapUsersDiv']");
			$query->item(0)->parentNode->removeChild($query->item(0));
			$query=$path->query("*/div[@class='page-main']/div[@id='userDiv']/div[@class='input-area']/div[@id='browseUsersDiv']");
			$query->item(0)->parentNode->removeChild($query->item(0));
			
		}
	}

	if(getSendMessagePrivilege()!="1" && getViewStreamPrivilege()!="1" && getViewNotificationPrivilege()!="1")
	{
		$query=$path->query("*/div[@class='page-main']/div[@id='dataDiv']");
		$query->item(0)->parentNode->removeChild($query->item(0));
	}
	else
	{
		if(getSendMessagePrivilege()!="1")
		{
			$query=$path->query("*/div[@class='page-main']/div[@id='dataDiv']/div[@class='input-area']/div[@id='commandDiv']");
			$query->item(0)->parentNode->removeChild($query->item(0));
		}

		if(getViewStreamPrivilege()!="1")
		{
			$query=$path->query("*/div[@class='page-main']/div[@id='dataDiv']/div[@class='input-area']/div[@id='mapSearchDiv']");
			$query->item(0)->parentNode->removeChild($query->item(0));

			$query=$path->query("*/div[@class='page-main']/div[@id='dataDiv']/div[@class='input-area']/div[@id='streamDiv']");
			$query->item(0)->parentNode->removeChild($query->item(0));
		}

		if(getViewNotificationPrivilege()!="1")
		{
			$query=$path->query("*/div[@class='page-main']/div[@id='dataDiv']/div[@class='input-area']/div[@id='notificationDiv']");
			$query->item(0)->parentNode->removeChild($query->item(0));
		}
	}

	$query=$path->query("*/div[@class='page-main']");
	return $document->saveHtml($query->item(0));
}
?>
