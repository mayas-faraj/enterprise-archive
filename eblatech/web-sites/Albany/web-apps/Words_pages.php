    <!DOCTYPE html>
    <html>
    <head>
    <style>
    table, th, td {
    border: 1px solid black;
    
    with :100%;
    }
    th, td {
    padding: 5px;
    text-align: left;    
    }
    table {
    width: 80%;
}
    </style>
    <form method = 'post'>  
            <h4>SELECT Titel</h4> 
              
            <select name = 'subject[]' > 
<?php 
$wpb_all_query = new WP_Query(array('post_type'=>'post', 'post_status'=>'publish', 'posts_per_page'=>-1)); 
            
            if ( $wpb_all_query->have_posts() ) :
                
                
                while ( $wpb_all_query->have_posts() ) : $wpb_all_query->the_post();
                
                $title =get_the_title();
  
                echo "<option value = '$title'>$title</option> ";
               
            
     
      endwhile;
            
      wp_reset_postdata();
      
      else :
      echo" <p><?php _e( 'Sorry, no posts matched your criteria.' ); ?></p>";
      endif;  
    ?>
    </select> 
            <input type = 'submit' name = 'submit' value = Search> 
        </form> 
        <?php

global $wpdb;
$result =$wpdb-> get_results("select * from wp_keyword");

$count_array=array();

foreach ($result as $wp_keyword)
{ $count += 1;
  $aad=$wp_keyword ->word;
  
    array_push($count_array,$aad);
}
    if(isset($_POST["submit"]))  
    
    {   
        
        if(isset($_POST["subject"]))  
        { 
            // Retrieving each selected option 
            foreach ($_POST['subject'] as $subject)  
            
            echo "<h3>"; echo "You Titel"; echo"</h3>"; echo"<h2>"; echo $subject ; echo"</h2> <br/>"; 
              
        echo "<table >";
        echo"  <tr>";
        echo"<th > Word </th>";
        echo"<th > Repetition </th>";
        echo"  </tr>";
      
            $wpb_all_query = new WP_Query(array('post_type'=>'post', 'post_status'=>'publish', 'posts_per_page'=>-1)); 
                        
                if ( $wpb_all_query->have_posts() ) :
                         
                    while ( $wpb_all_query->have_posts() ) : $wpb_all_query->the_post();
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
                
                else :
                    echo" <p><?php _e( 'Sorry, no posts matched your criteria.' ); ?></p>";
                endif;  
    
                echo"<table >";
            } 
            else
                echo "Select an option first !!"; 
     
    } 
?> 
</body>
</html>
