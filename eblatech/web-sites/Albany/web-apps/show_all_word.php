<?php
global $wpdb;
$keywords =$wpdb-> get_results("select * from wp_allword limit 10;");

$api_url="https://insights.ebla-tech.com/web-services/api.php/test";
/*$permalinks=array();
$posts = new WP_Query(array('post_type'=>array('post', 'page'), 'post_status'=>'publish', 'posts_per_page'=>-1)); 
if ( $posts->have_posts() ) 
{
	while ( $posts->have_posts() ) 
	{
		$posts->the_post();
                array_push($permalinks, get_permalink());
	}
}
 */
//die(var_dump($keywords));
//
$result=array();

foreach($keywords as $keyword)
{
	array_push($result, array("title"=>$keyword->title, "word"=>str_replace(str_replace($keyword->word, "<", "&gt;"), ">", "&lt;"), "count"=>$keyword->count1));
}
$params['function'] = 'test';
$params['domain']=$_SERVER['SERVER_NAME'];
$params['keywords_data'] = $result;
/*
foreach($pages as $page)
{
	$page_words=array($page=>get_page_key_array($page));
	array_push($params['keywords_data'], $page_words);
}
 */
echo "<p>" . json_encode($params, true) . "</p>";
$curl=curl_init($api_url);
curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
curl_setopt($curl, CURLOPT_POSTFIELDS,  json_encode($params, true));
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$response=curl_exec($curl);
curl_close($curl);
echo "<h1>Result</h1>";
var_dump($response);
echo "<h3>end</h3>";
function get_page_key_array($page)
{
/*
	$posts = new WP_Query('name'=>$page); 
	if ( $wpb_all_query->have_posts() )
	{
		while ( $posts->have_posts() )
		{
			$posts->the_post();
			$title =get_the_title();
                    if ($title == $subject )
                    {
                        $content = apply_filters('the_content', $wpb_all_query->post_content); 
                        $the_content = apply_filters('the_content', get_the_content());                             
                        
                        $string = $the_content;


                       
                        foreach($count_array as $word)
                          { $dd= substr_count($string,$word) ;
                        
                              $dd= substr_count($string,$word) ;
                              echo"<tr>";
                             
                              echo"<td>$word</td>";
                              echo"<td>$dd</td>";
                              
                              echo"</tr>";
                              
                          }




                        
                        foreach(explode(" ",$string) as $word )
                        { $dd= substr_count($string,$word) ;
                            
                            if(strlen($word) > 4 )
                            {                     
                    
                            echo"<tr>";  
                            echo"<td>$word</td>";
                            echo"<td>$dd</td>";                      
                            echo"</tr>";
                            }
                
                            }
                          
                        }
            
                    endwhile;
                    
                    wp_reset_postdata();
                
 */
}
?>
