
    </style>
    <div class="wrap">
      <h1><?php esc_html_e( get_admin_page_title() ); ?></h1>
     
    </div>

<div id="primary" class="content-area">
		<main id="main" class="site-main">
    <form role="form" method="post">

    <input type="submit" value="save" name="submitbtnas" >
    </div>
    </form> 
		
		</main><!-- #main -->
	</div><!-- #primary -->


 <!-- add all word to db -->

 <?php 
global $wpdb; 
if(isset($_POST['submitbtnas'])){

  $wpb_all_query = new WP_Query(array('post_type'=>'post', 'post_status'=>'publish', 'posts_per_page'=>-1)); 
       
  if ( $wpb_all_query->have_posts() ) :
  
       while ( $wpb_all_query->have_posts() ) : $wpb_all_query->the_post();
      
  // $content = apply_filters('the_content', $wpb_all_query->post_content); 
   $the_content = apply_filters('the_content', get_the_content());
   $title =get_the_title();         
   $string = $the_content;
   $link = get_permalink();
   $number++;
   $count1= 0;
  
   foreach(explode(" ",$string) as $word )
   {
       if(strlen($word) > 4 )
       {
       // echo $word . '  ' .substr_count($string,$word)."time.<br/>";
       $count =substr_count($string,$word);
  
       if($count > $count1)
       {	
          $data =array(
              'title'=> $title,
              'word'=> $word,
              'count1'=> $count,
              
          );
          $table_name ='wp_allword';
          $result =$wpdb-> insert($table_name ,$data ,$format=NULL);
      
          
       }
  
       }
     
   }
  
  endwhile;
    
  wp_reset_postdata();
  
  else :
  echo" <p><?php _e( 'Sorry, no posts matched your criteria.' ); ?></p>";
  endif; }
 ?>