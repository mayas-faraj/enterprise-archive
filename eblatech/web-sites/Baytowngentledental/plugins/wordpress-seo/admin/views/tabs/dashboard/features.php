<?php
/**
 * WPSEO plugin file.
 *
 * @package WPSEO\Admin\Views
 */

/**
 * @var Yoast_Form $yform
 */

if ( ! defined( 'WPSEO_VERSION' ) ) {
	header( 'Status: 403 Forbidden' );
	header( 'HTTP/1.1 403 Forbidden' );
	exit();
}

$xml_sitemap_extra = false;
if ( WPSEO_Options::get( 'enable_xml_sitemap' ) ) {
	$xml_sitemap_extra = '<a href="' . WPSEO_Sitemaps_Router::get_base_url( 'sitemap_index.xml' ) . '" target="_blank">' . __( 'See the XML sitemap.', 'wordpress-seo' ) . '</a>';
}
$feature_toggles = array(
	(object) array(
		'name'            => __( 'SEO analysis', 'wordpress-seo' ),
		'setting'         => 'keyword_analysis_active',
		'label'           => __( 'The SEO analysis offers suggestions to improve the SEO of your text.', 'wordpress-seo' ),
		'read_more_label' => __( 'Learn how the SEO analysis can help you rank.', 'wordpress-seo' ),
		'read_more_url'   => 'https://yoa.st/2ak',
		'order'           => 10,
	),
	(object) array(
		'name'            => __( 'Readability analysis', 'wordpress-seo' ),
		'setting'         => 'content_analysis_active',
		'label'           => __( 'The readability analysis offers suggestions to improve the structure and style of your text.', 'wordpress-seo' ),
		'read_more_label' => __( 'Discover why readability is important for SEO.', 'wordpress-seo' ),
		'read_more_url'   => 'https://yoa.st/2ao',
		'order'           => 20,
	),
	(object) array(
		'name'            => __( 'Cornerstone content', 'wordpress-seo' ),
		'setting'         => 'enable_cornerstone_content',
		'label'           => __( 'The cornerstone content feature lets you to mark and filter cornerstone content on your website.', 'wordpress-seo' ),
		'read_more_label' => __( 'Find out how cornerstone content can help you improve your site structure.', 'wordpress-seo' ),
		'read_more_url'   => 'https://yoa.st/dashboard-help-cornerstone',
		'order'           => 30,
	),
	(object) array(
		'name'            => __( 'Text link counter', 'wordpress-seo' ),
		'setting'         => 'enable_text_link_counter',
		'label'           => __( 'The text link counter helps you improve your site structure.', 'wordpress-seo' ),
		'read_more_label' => __( 'Find out how the text link counter can enhance your SEO.', 'wordpress-seo' ),
		'read_more_url'   => 'https://yoa.st/2aj',
		'order'           => 40,
	),
	(object) array(
		'name'            => __( 'XML sitemaps', 'wordpress-seo' ),
		'setting'         => 'enable_xml_sitemap',
		/* translators: %s expands to Yoast SEO */
		'label'           => sprintf( __( 'Enable the XML sitemaps that %s generates.', 'wordpress-seo' ), 'Yoast SEO' ),
		'read_more_label' => __( 'Read why XML Sitemaps are important for your site.', 'wordpress-seo' ),
		'read_more_url'   => 'https://yoa.st/