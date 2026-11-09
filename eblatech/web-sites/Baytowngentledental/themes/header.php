<!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<?php wp_head(); ?>
	<meta name="google-site-verification" content="Gf6-UfJja5bWhSLx78vvTsVzq3CImVfZbTIQySrt4As" />
	<meta name="msvalidate.01" content="2665ADF0017B1F4E1852E272D87C5314" />
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-68400324-1', 'auto');
	  ga('send', 'pageview');
	
</script>
</head>
<body <?php body_class(); ?>>
<div class="main">

	<?php if ( stm_nav_mode() == 'left' ) { ?>
		<div class="left_nav">
			<div class="left_nav_wr">
				<div class="logo">
					<?php echo stm_get_logo(); ?>
				</div>
				<?php
					wp_nav_menu( array(
							'theme_location' => 'left_nav',
							'container'      => false,
							'menu_class'     => 'left_nav_menu',
							'fallback_cb'    => false
						)
					);
				?>
			</div>
		</div>
	<?php } ?>

	<div class="main_wrapper">
		<div class="wrapper">
			<header id="header">
				<?php if ( stm_option('top_bar') ): ?>
					<div class="top_bar">
						<div class="container">
							<div class="row">

								<div class="col-lg-6 col-md-5 col-sm-12 col-xs-12">
									<div class="top_bar_left blue-title">

										<?php if ( stm_option('top_bar_label') ): ?>
											<b><?php echo esc_html( stm_option('top_bar_label') ); ?></b>
										<?php endif; ?>

										<?php
										wp_nav_menu( array(
												'theme_location' => 'top_bar_menu',
												'container'      => false,
												'menu_class'     => 'top_bar_menu',
												'fallback_cb'    => false
											)
										);
										?>

									</div>
								</div>

								<div class="col-lg-6 col-md-7 col-sm-12 col-xs-12">
									<div class="top_bar_right">

										<?php
										if ( stm_option('top_bar_search') && stm_nav_mode() != 'left' ) {
											get_search_form();
										}
										?>

										<?php
										if ( stm_option('top_bar_wpml') ) {
											do_action( 'wpml_add_language_selector' );
										}
										?>

										<?php if ( stm_option('top_bar_social') ): ?>
											<div class="top_bar_socials">
												<ul>
													<?php foreach ( stm_option('top_bar_use_social') as $key => $val ) : ?>
														<?php if ( stm_option( $key ) && $val == 1 ): ?>
															<li>
																<a target="_blank" href="<?php echo esc_url( stm_option( $key ) ); ?>">
																	<i class="fa fa-<?php echo esc_attr( $key ); ?>"></i>
																</a>
															</li>
														<?php endif; ?>
													<?php endforeach; ?>
												</ul>
											</div>
										<?php endif; ?>

									</div>
								</div>

							</div>
						</div>
					</div>
				<?php endif; ?>

				<?php if ( stm_option('top_bar_search') ): ?>
					<div class="mobile_search">
						<?php echo get_search_form(); ?>
					</div>
				<?php endif; ?>

				<?php if ( stm_nav_mode() != 'left' ): ?>
					<div class="top_nav">
						<div class="container">
							<div class="row">

								<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
									<div class="logo">
										<?php echo stm_get_logo(); ?>
										<div id="menu_toggle">
											<button></button>
										</div>
									</div>
								</div>

								<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
									<?php
									wp_nav_menu( array(
											'theme_location' => 'primary_menu',
											'container'      => false,
											'depth'          => 3,
											'fallback_cb'    => false,
											'menu_class'     => 'top_nav_menu'
										)
									);
									?>
								</div>

							</div>
						</div>
						<div class="mobile_menu">
							<?php
							wp_nav_menu( array(
									'theme_location' => 'primary_menu',
									'container'      => false,
									'depth'          => 3,
									'fallback_cb'    => false,
									'menu_class'     => 'top_mobile_menu'
								)
							);
							?>
						</div>
					</div>
				<?php else: ?>
					<div class="top_nav">
						<div class="container">
							<div class="mod_table">

								<div class="mod_table_cell">
									<div id="left_menu_toggle">
										<button></button>
									</div>
								</div>

								<div class="mod_table_cell show_on_mobile">
									<div class="logo">
										<?php echo stm_get_logo(); ?>
										<div id="menu_toggle">
											<button></button>
										</div>
									</div>
								</div>

								<div class="mod_table_cell">
									<?php
									if ( stm_option('top_bar_search') ) {
										get_search_form();
									}
									?>
								</div>

							</div>
						</div>
						<div class="mobile_menu">
							<?php
							wp_nav_menu( array(
									'theme_location' => 'primary_menu',
									'container'      => false,
									'depth'          => 3,
									'fallback_cb'    => false,
									'menu_class'     => 'top_mobile_menu'
								)
							);
							?>
						</div>
					</div>
				<?php endif; ?>
				
				<?php if ( stm_option('top_info_show') ): ?>
					<div class="top_info_boxes">
						<div class="container">
							<div class="row">
				<div class="col-xs-12 col-sm-3 col-sm-offset-2 col-md-3 col-md-offset-2 col-lg-3 col-lg-offset-2">
									<div class="top_info_box">
										<?php if ( stm_option( 'top_info_left_icon' ) ): ?>
											<div class="icon">
												<i class="<?php echo esc_attr( stm_option( 'top_info_left_icon' ) ); ?>"></i>
											</div>
										<?php endif; ?>
										<div class="text small">
											<?php if ( stm_option('top_info_left_label') ): ?>
												<strong><?php _e( esc_html( stm_option('top_info_left_label') ) ); ?></strong>
											<?php endif; ?>
											<?php if ( stm_option('top_info_left_value') ): ?>
												<span><?php _e( esc_html( stm_option('top_info_left_value') ) ); ?></span>
											<?php endif; ?>
										</div>
										<?php if ( stm_option('top_info_left_link') ): ?>
											<a href="<?php echo esc_url( stm_option('top_info_left_link') ); ?>" class="link"></a>
										<?php endif; ?>
									</div>
								</div>

								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<div class="top_info_box">
										<?php if ( stm_option('top_info_center_icon') ): ?>
											<div class="icon">
												<i class="<?php echo esc_attr( stm_option( 'top_info_center_icon' ) ); ?>"></i>
											</div>
										<?php endif; ?>
										<div class="text small">
											<?php if ( stm_option( 'top_info_center_label' ) ): ?>
												<strong><?php _e( esc_html( stm_option( 'top_info_center_label' ) ) ); ?></strong>
											<?php endif; ?>
											<?php if ( stm_option( 'top_info_center_value' ) ): ?>
												<span><?php _e( esc_html( stm_option( 'top_info_center_value' ) ) ); ?></span>
											<?php endif; ?>
										</div>
										<?php if ( stm_option( 'top_info_center_link' ) ): ?>
											<a href="<?php echo esc_url( stm_option( 'top_info_center_link' ) ); ?>" class="link"></a>
										<?php endif; ?>
									</div>
								</div>
								
								<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
									<div class="top_info_box">
										<?php if ( stm_option('top_info_right_icon') ): ?>
											<div class="icon">
												<i class="<?php echo esc_attr( stm_option( 'top_info_right_icon' ) ); ?>"></i>
											</div>
										<?php endif; ?>
										<div class="text small">
											<?php if ( stm_option( 'top_info_right_label' ) ): ?>
												<strong><?php _e( esc_html( stm_option( 'top_info_right_label' ) ) ); ?></strong>
											<?php endif; ?>
											<?php if ( stm_option( 'top_info_right_value' ) ): ?>
												<span><?php _e( esc_html( stm_option( 'top_info_right_value' ) ) ); ?></span>
											<?php endif; ?>
										</div>
										<?php if ( stm_option( 'top_info_right_link' ) ): ?>
											<a href="<?php echo esc_url( stm_option( 'top_info_right_link' ) ); ?>" class="link"></a>
										<?php endif; ?>
									</div>
								</div>

								<!--div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
									<div class="text iframe-text">
										<iframe width="140" height="110" class="assetIframe" style="border:0" src="//www.carecredit.com/adtoolkit/assets/views/assetlisting/getAsset.php?asset=465&mtype=5348120285983052"></iframe>
										<a href="http://www.carecredit.com/dental/" target="_blank"></a>
									</div>
								</div-->

							</div>
						</div>
					</div>
				<?php endif; ?>

			</header>
			<section id="content">