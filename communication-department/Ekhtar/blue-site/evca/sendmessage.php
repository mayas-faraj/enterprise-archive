<?php
require_once 'lib/nusoap.php';
require('php/Session.php');
$client = new nusoap_client("http://localhost:7778/ws/server?wsdl", true);
$node=getSessionUser();
if($node=='ehq' || $node=='es-cd')
{
	$node="";
}
$client->soap_defencoding = 'UTF-8';
$client->decode_utf8 = false;
$error  = $client->getError();
$result=array();
if ($error)
{
    echo "<h2>Constructor error</h2><pre>" . $error . "</pre>";
}

$activeUsersResult = $client->call("getUsersLastPointByCoordinate",array("arg0" => $node, "arg1" => $_GET['l1'],"arg2" => $_GET['l2'],"arg3" => $_GET['l3'],"arg4" => $_GET['l4']));
$sendtoResult="";
//echo (count($activeUsersResult['item']));
//echo "<br/>";
//print_r($activeUsersResult['item']);
//echo count($activeUsersResult['item']);
if(count($activeUsersResult['item'])==1)
{
        $sendtoResult=json_decode($activeUsersResult['item'],true)['Publisher'];
        //echo "done";
}
else
foreach ($activeUsersResult['item'] as $item)
{
        $publisher = json_decode($item,true)['Publisher'];
	if(!empty($publisher))
		$sendtoResult= $sendtoResult . $publisher . ";";
}

if ($client->fault)
{
    echo "<h2>Fault</h2><pre>";
    echo "</pre>";
}
else
{
    $error = $client->getError();
    if ($error)
    {
        echo "<h2>Error</h2><pre>" . $error . "</pre>";
    }
}
?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>نظام الإخطار</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  reports project core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="assets/css/themify-icons.css" rel="stylesheet">

    <link rel="stylesheet" href="assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
    <link rel="stylesheet" href="assets/css/font-icons/entypo/css/entypo.css">
    <link rel="stylesheet" href="assets/css/neon-core.css">
    <link rel="stylesheet" href="assets/css/neon-theme.css">
    <link rel="stylesheet" href="assets/css/neon-forms.css">
    <link rel="stylesheet" href="assets/css/custom.css">
   <link rel="stylesheet" href="assets/css/4.css">
   <link rel="syylesheet" href="assets/css/menu.scc">
   <link rel="stylesheet" href="assets/css/listbox.css">

   <script src="assets/js/xmpp/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
   <script src="assets/js/xmpp/strophe/strophe.min.js" type="text/javascript"></script>
   <script src="assets/js/xmpp/strophe/strophe.pubsub.min.js" type="text/javascript"></script>
   <script src="scripts/stropheAccess.js" type="text/javascript"></script>
   <script src="assets/js/xmpp/shared.js" type="text/javascript"></script>
   <script src="assets/js/xmpp/publisher.js" type="text/javascript"></script>
   <script src="scripts/sessionAccess.js" type="text/javascript"></script>
   <script src="scripts/interfaceAccess.js" type="text/javascript"></script>
</head>
<body>
<div class="wrapper">
<div class="sidebar" data-background-color="white" data-active-color="danger">
    	<div class="sidebar-wrapper">
	            <ul class="nav">
                <li class="active">
                    <a href="inbox.html">
                        <i class="entypo-inbox"></i>
                        <span class="title">البلاغات الواردة</span>
                    </a>
                </li>

                <li >
                    <a href="sendmessage.php">
                        <i class="entypo-pencil"></i>
                        <span class="title">إرسال رسالة</span>
                    </a>
                </li>


                <li>
                    <a href="message.html">
                        <i class="entypo-attach"></i>
                        <span class="title">استعراض بلاغ</span>
                    </a>
                </li>

				 <li>
                    <a href="table.html">
                        <i class="ti-view-list-alt"></i>
                        <span class="title">قائمة مرسلي البلاغ</span>
                    </a>
                </li>
				 <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <span class="title">قائمة الإشعارات</span>
                    </a>
                </li>
				
				
				
				 <li>
                    <a href="main.html">
                        <i class="ti-world"></i>
                        <span class="title">خريطة التقارير</span>
						
                    </a>
					
					<li>
                    <a href="notify.html">
                        <i class="ti-world"></i>
                        <span class="title">خريطة الاشعارات</span>
						
                    </a>
					
					<li>
                    <a href="users.html">
                        <i class="ti-world"></i>
                        <span class="title">خريطة المستخدمين</span>
						
                    </a>
					<li>
                    <a href="usernavigation.html">
                        <i class="ti-world"></i>
                        <span class="title">خريطة التنقلات</span>
						
                    </a>
                </li>
				
                <!-- <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li> -->

            </ul>
	</div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                <a class="navbar-brand" href="extra-login.html">تسجيل الدخول</a>
				<a class="navbar-brand" href="index.html">الصفحة الرئيسية</a>
									
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
								<p>الحالة</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification">5</p>
									<p>الإشعارات</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">الإشعار 1</a></li>
                                <li><a href="#">الإشعار 2</a></li>
                                <li><a href="#">الإشعار 3</a></li>
                                <li><a href="#">الإشعار 4</a></li>
                                <li><a href="#">إشعارات أخرى</a></li>
                              </ul>
                        </li>
						<li>
                            <a href="#">
								<i class="ti-settings"></i>
								<p>الإعدادات</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


	


        <div class="content">
          

            <div class="mail-body">

                <div class="mail-header">
                    <!-- title -->
                    <div class="mail-title">
                        إنشاء رسالة <i class="entypo-pencil"></i>
                    </div>

                    <!-- links -->
                    <div class="mail-links">

                        <a href="#" class="btn btn-default">
                            <i class="entypo-cancel"></i>
                        </a>

                        <a href="#" class="btn btn-default btn-icon">
                           <div id="connection_status">جاري الاتصال</div>
                            <i class="entypo-tag"></i>
                        </a>

                        <button id="publish" class="btn btn-success btn-icon" >
			<a>
                            إرسال
                            <i class="entypo-mail"></i>
                        </a>
			</button>
			 <button id="showMenu" onclick="showMenu()" class="btn btn-default btn-icon" style="position: relative;display: inline-block;">
ردود سريعة

                            <i class="entypo-tag"></i>
                        </a></button>
                        <div id="menu" class="btn" style="position: absolute;background-color: #f9f9f9;min-width: 160px;overflow: auto;box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);z-index: 1; visibility: hidden;">
                                <div id="element1" onclick="addMenuText('element1');">تم استلام البلاغ</div>
                                <div id="element2" onclick="addMenuText('element2');">المعلومات المرسلة في البلاغ منقوصة</div>
                                <div id="element3" onclick="addMenuText('element3');">يطلب توضيح معلومات البلاغ بشكل أوسع</div>
                                <div id="element4" onclick="addMenuText('element4');">يطلب التأكد من البلاغ المرسل</div>

                        </div>

                    </div>
                </div>


                <div class="mail-compose">

				  <div class="container-fluid mail-env">

	
        <div class="dual-list list-left col-md-5">
            <div class="well text-right">
                <div class="row">
                    <div class="col-md-10">
                        <div class="input-group">
                            <span class="input-group-addon glyphicon glyphicon-search"></span>
                            <input type="text" name="SearchDualList" class="form-control" placeholder="search" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="btn-group">
                            <a class="btn btn-default selector" title="select all"><i class="glyphicon glyphicon-unchecked"></i></a>
                        </div>
                    </div>
                </div>
                <ul class="list-group" id="userList">
                </ul>
				
            </div>
      
        </div>

		
		
                    <form method="post" role="form">

                        <div class="form-group">
                            <label for="to">المرسل إليه:</label>
                            <!--input type="text" class="form-control" style="overflow: scroll;overflow-x: hidden;" id="to" tabindex="1" /-->
			    <label id="to" style="text-align:left;overflow: scroll;width:600px;height:70px; color:black;padding: 10px;background: white;"> </label>
			    <input type="hidden" id="toUsers"/>
                           
                       
                   <label for="to">نص الرسالة</label>
                        <div class="compose-message-editor">
                            <textarea id="message" class="wysihtml5" style="width:600px;height:400px; color:black;padding: 10px;" data-stylesheet-url="assets/css/wysihtml5-color.css" name="sample_wysiwyg" id="sample_wysiwyg"></textarea>
                        </div>

                    </form>

                </div>

            </div>





           







            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">

                </nav>
            
            </div>
        </footer>

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    	<script src="assets/js/listbox.js" type="text/javascript"></script>
	
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<script type="text/javascript">
	function getVariable(name)
	{
		var url = window.location.href;
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		results = regex.exec(url);
		if (!results) return null;
		if (!results[2]) return '';
		return decodeURIComponent(results[2].replace(/\+/g, " "));
	}
	
	function loadParameter() 
	{	
		if(getVairable('l1')!=null && getVairable('l2')!=null &&
		   getVairable('l3')!=null && getVairable('l4')!=null)
		{
			InterfaceAccess.getUsersLastPointByCoordinate(getVairable('l1'),getVairable('l2'),getVairable('l3'),getVairable('l4'), function(result)
			{
				
			});			
		}
		else
		{
			InterfaceAccess.getUsers(function(usersPost)
			{
				var sendtoPost='<?php print($sendtoResult);?>';             
				
				var toUsersControl=document.getElementById('toUsers');
				var toControl=document.getElementById('to');
				var userListControl=document.getElementById('userList');
				
				console.log(toUsersControl);
				console.log(toControl);
				console.log(userListControl);
				console.log(sendtoPost);
				console.log(usersPost);	
				var sendtoUsers=null;
				if(sendtoPost!='')
				{
					sendtoUsers=sendtoPost.split(';');
					usersPost=sendtoPost;
				}

				if(usersPost!='')
				{
					usersPost=usersPost;
					console.log(usersPost);
					var users=usersPost.split(';');
					
					for(var i=0;i<users.length;i++)
					{
						if(users[i]!=null&&users[i]!='')
							if(sendtoUsers!=null && sendtoUsers.indexOf(users[i])>=0)
								userList.innerHTML+="<li class=\"list-group-item active\">"+users[i]+"<img class=\"icon-minus\"></li>";
							else
								userList.innerHTML+="<li class=\"list-group-item\">"+users[i]+"<img class=\"icon-plus\"></li>";
					}
				}

				toUsersControl.value=sendtoPost;
				if(sendtoUsers!=null)
					toControl.innerHTML=sendtoUsers.join("<img style=\"width:20;height:20\" src=\"assets/images/user.png\"> ");
			});
		}
	}
	
	function addMenuText(id)
	{
		var menuItemElement=document.getElementById(id);
		var messageElement=document.getElementById('message');
		messageElement.value+=' '+menuItemElement.innerText;

		showMenu();
	}

	function showMenu()
	{
		var menuElement=document.getElementById('menu');
		if(menuElement.style.visibility=='hidden')
			menuElement.style.visibility='visible';
		else
			menuElement.style.visibility='hidden';
	}

	window.onload=loadParameter();
	</script>
</html>
