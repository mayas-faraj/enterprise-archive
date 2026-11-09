<?php
	global $base_path , $base_url;
	$lang = get_lang();
	
?>

<div class="browse_items">
<ul>
<?php
//$arr =  get_nodes_by_type("product");
$arr = get_nodes_by_type('gallery_image' , 0 , 'ASC');
$i = 0;

foreach($arr as $item)
{			
	$img_url = $base_path . $item->field_gi_image[0]['filepath'];			
	$title = $item->title;
	$nid = $item->nid;
	$url = $base_path . $item->field_gi_image[0]['filepath'];
	
	echo '<li>';
	
	echo '<a  href="'.$url.'" rel="lightbox[node_images]['.$title.']">';
	echo '<img src="'.$img_url.'" />';
	echo '</a>' ;
	//echo '<a  href="'.$url.'" rel="lightbox[node_images]['.$title.']">';
	//echo $title;
	//echo '</a>' ;
	echo '</li>';
}
?> 
<ul>       
</div>
