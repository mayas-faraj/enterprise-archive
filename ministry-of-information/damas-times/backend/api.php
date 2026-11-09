<?php
if($_SERVER["REQUEST_METHOD"]=="POST") {
	include "dt-db.php";

	$dtdb=new DtDb();
	$data=json_decode(file_get_contents("php://input"));
	if($data==NULL) output_input_error();
	
	$operation=$data->operation;

	if(isset($_COOKIE["PHPSESSID"])) 
		session_id($_COOKIE["PHPSESSID"]);
	elseif(isset($data->session_id))  
		session_id($data->session_id);

	session_start();

	header('Cache-Control: no-cache, must-revalidate');
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
	header('Content-type: application/json');

	/*if(!isset($_SESSION["full_access"]) || $_SESSION["full_access"]!="1") output_limit_access();*/

	switch($operation) {
	case "read-categories-menu":
		output($dtdb->read("categories_menu_view", array("category_title", "featured_image")));
		break;
	case "read-categories-home":
		output($dtdb->read("categories_home_view", array("category_title", "featured_image", "post_display_count")));
		break;
	case "read-posts-categories":
		if(isset($data->category_title)) {
			$length=$data->length??NULL;
			$offset=$data->offset??NULL;
			output($dtdb->read("posts_category_view", array("category_title", "post_title", "post_exerpt", "featured_image", "post_date"), array("category_title"=>$data->category_title), $length, $offset)); 
		}
		else
			output_missed("category_title");
		break;
	case "read-posts":
		$search=$data->search??NULL;
		$export=$data->export??NULL;
		$length=$data->length??NULL;
		$offset=$data->offset??NULL;
		$conditions=null;

		if($search!=NULL) 
		    $conditions=array("post_title like"=>$search, "post_exerpt like"=>$search, "post_content like"=>$search, "author_name like"=>$search);

		output($dtdb->read("posts_view", array("category_title", "post_title", "post_exerpt", "post_content", "post_date", "featured_image", "post_count", "is_comment_open", "author_name"), $conditions, $length, $offset));
		break;
	case "read-post":
		if(isset($data->post_title)) 
			$posts=$dtdb->read("posts_view", array("category_title", "post_title", "post_exerpt", "post_content", "post_date", "featured_image", "post_count", "is_comment_open", "author_name"), array("post_title"=>$data->post_title));
			if(count($posts)>0)
				$posts[0]["comments"]=$dtdb->read("comments_view", array("comment_author_name", "comment_date", "comment_content"), array("post_title"=>$data->post_title));
		else
			output_missed("post_title");
		break;
	case "read-gallery":
		if(isset($data->post_title)) {
			$galleries=$dtdb->read("galleries_view", array("post_title", "post_exerpt", "post_content", "post_date", "featured_image", "post_count", "is_comment_open", "author_name"), array("post_title"=>$data->post_title));
			if(count($galleries))
				$galleries[0]["media"]=$dtdb->read("media_view", array("name", "url", "alt"), array("post_title"=>$data->post_title));
			output($gallery);
		}
		else
			output_missed("post_title");
		break;
	case "create-comment":
		if(isset($data->post_title))
			if(isset($data->comment_author_name))
				if(isset($data->comment_author_email))
					if(isset($data->comment_content)) {
						$post_result=$dtdb->read_scalar("posts", "id", array("post_title"=>$data->post_title), true);
						if($post_result["status"]=="success")
							output($dtdb->create("comments", array("post_id"=>$post_result["value"], "comment_author_name"=>$data->comment_author_name, "comment_author_email"=>$data->comment_author_email, "comment_author_ip"=>get_ip(), "comment_author_port"=>get_port(), "comment_author_agent"=>get_agent(), "comment_content"=>$data->connect_content)));
						else
							output_missed($data->post_title);
					}
				else
					output_missed("comment_author_email");
			else
				output_missed("comment_author_name");
		else
			output_missed("comment_author_title");
		break;
	default:
		output(array("status"=>"failed", "msg"=>"unsupported operation"));
	}
}

function get_ip() {  
	if(!emptyempty($_SERVER['HTTP_CLIENT_IP']))
		$ip = $_SERVER['HTTP_CLIENT_IP'];  
	elseif (!emptyempty($_SERVER['HTTP_X_FORWARDED_FOR']))   
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];  
	else
		$ip = $_SERVER['REMOTE_ADDR'];  
	return $ip;  
}

function get_port() {
	return $_SERVER["REMOTE_PORT"];
}

function get_agent() {
	return $_SERVER["HTTP_USER_AGENT"];
}

function output($value) {
	echo json_encode($value, JSON_UNESCAPED_UNICODE);
}

function output_missed($value) {
	output(array("status"=>"error", "msg"=>$value . " not exists."), JSON_UNESCAPED_UNICODE);
	die();
}

function output_error($msg) {
	output(array("status"=>"error", "msg"=>$msg), JSON_UNESCAPED_UNICODE);
	die();
}

function output_input_error() {
	output(array("status"=>"error", "msg"=>"input is not a valid json"));
	die();
}

function output_limit_access() {
	$user=$_SESSION["user"]??"<unknown user>";
	output(array("status"=>"error", "msg"=>$user . " doesn't has access permissions."));
	die();
}
?>
