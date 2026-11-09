<?php
require_once('include.php');

$SQLquery = mysql_query("select * from photo_xml order by rand()") or die(mysql_error());
$totl = mysql_num_rows($SQLquery);

echo '<?xml version="1.0" encoding="utf-8"?>'."\r";

echo '<photo>'."\r";

	while($sql = mysql_fetch_array($SQLquery)){
		echo '<track>'."\r";
			echo '<location>photo/'.addslashes($sql["prod_img_1"]).'</location>'."\r";
		echo '</track>'."\r";
	}//end while 


echo '</photo>'."\r";

@mysql_free_result($SQLquery);
?>