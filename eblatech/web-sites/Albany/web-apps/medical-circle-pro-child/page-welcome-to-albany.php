<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Acme Themes
 * @subpackage Medical Circle
 */
#get_header();
?>
<!--header id="header-title-logo"><div id="search-toggle" class="search-toggle tappable search-right" role="button"></div> <a href="https://albanylaser.ca/welcome-to-albany-laser-and-cosmetic-medical-spa-in-edmonton-mobile-version/" class="header-center tappable"> <noscript><img src="https://cdn.shortpixel.ai/client/q_glossy,ret_img/https://albanylaser.ca/wp-content/uploads/2018/08/albany-laser-centre-LGlogo.png" alt="logo image" /></noscript><img class=" lazyloaded" id="header-logo" src="https://cdn.shortpixel.ai/client/to_webp,q_glossy,ret_img/https://albanylaser.ca/wp-content/uploads/2018/08/albany-laser-centre-LGlogo.png" data-src="https://cdn.shortpixel.ai/client/to_webp,q_glossy,ret_img/https://albanylaser.ca/wp-content/uploads/2018/08/albany-laser-centre-LGlogo.png" alt="logo image"> </a><div id="menu-toggle" class="menu-btn tappable show-hide-toggle menu-left" data-effect-target="menu" data-menu-target="menu" role="button"></div></header-->
<?php

wp_enqueue_style( 'style-mobile', get_template_directory_uri() . '/style-mobile.css' );
wp_enqueue_style( 'style-bootstrap', 'https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css' );
#wp_enqueue_style( 'theme-style', get_template_directory_uri() . '/style.css', array( 'bootstrap','font-awesome','slick','magnific-popup' ) );
wp_enqueue_script( 'jquery', 'https://code.jquery.com/jquery-3.5.1.slim.min.js', false ) ;
wp_enqueue_script( 'boostrap', 'https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js', false ) ;
#wp_enqueue_script( 'bootstrap', get_site_url() . '/includes/js/bootstrap.js', false ) ;
#wp_enqueue_script( 'slick', get_site_url() . '/includes/js/slick.js', false ) ;
#wp_enqueue_script( 'slider', get_site_url() . '/wp/-content/plugins/eleminator/assets/js/slider.js', false ) ;
#wp_enqueue_script( 'button', get_site_url() . '/wp/-content/plugins/eleminator/assets/js/button.js', false ) ;
#wp_enqueue_script( 'anim', get_site_url() . '/wp/-content/plugins/eleminator/assets/js/anim.js', false ) ;



global $medical_circle_customizer_all_values;
$medical_circle_enable_feature = $medical_circle_customizer_all_values['medical-circle-enable-feature'];
?>
	
<?php
the_post();
the_content();
#get_footer();
