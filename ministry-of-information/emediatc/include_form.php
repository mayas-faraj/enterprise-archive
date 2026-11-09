<?php
$f_name=0;
if (isset($_GET['f_name']) && ($_GET['f_name']!= "")) {
   $f_name = (get_magic_quotes_gpc()) ? $_GET['f_name'] : addslashes($_GET['f_name']);

@include($f_name.".php");
}

?>
<!--
syrianobles co.
web Developed by : mohanad orfali
Email : phpline@hotmail.com
Mob: +96393878476
-->
