<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require "include/route.php";
require "include/api.php";
Route::add("/about", function() {include "about.php";});
Route::add("/send", function() {include "send.php";});
Route::add("/cat", function() {include "category.php";});
Route::add("/art", function() {include "article.php";});
Route::add("/", function() {include "home.php";});
Route::submit();

function print_article_page($id) {

}

?>
