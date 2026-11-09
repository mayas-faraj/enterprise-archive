<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require "include/route.php";
require "include/api.php";
Route::add("/aboutus", function() {include "about.php";});
Route::add("/contactus", function() {include "contact.php";});
Route::add("/cat", function() {include "category.php";});
Route::add("/article", function() {include "article.php";});
Route::add("/legacy", function() {include "home_old.php";});
Route::add("/search", function() {include "search-post.php";});
Route::add("/", function() {include "home.php";});
Route::submit();

function print_article_page($id) {

}

?>
