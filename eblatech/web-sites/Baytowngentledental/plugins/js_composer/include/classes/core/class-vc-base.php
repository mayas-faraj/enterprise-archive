<?php
if ( ! defined( 'ABSPATH' ) ) {
	die( '-1' );
}

/**
 * WPBakery Visual Composer main class.
 *
 * @package WPBakeryVisualComposer
 * @since   4.2
 */

/**
 * Visual Composer basic class.
 * @since 4.2
 */
class Vc_Base {
	/**
	 * Shortcode's edit form.
	 *
	 * @since  4.2
	 * @access protected
	 * @var bool|Vc_Shortcode_Edit_Form
	 */
	protected $shortcode_edit_form = false;

	/**
	 * Templates management panel.
	 * @deprecated 4.4 updated to $templates_panel_editor, use Vc_Base::setTemplatesPanelEditor
	 * @since  4.2
	 * @access protected
	 * @var bool|Vc_Templates_Editor
	 */
	protected $templates_editor = false;
	/**
	 * Templates management panel editor.
	 * @since  4.4
	 * @access protected
	 * @var bool|Vc_Templates_Panel_Editor
	 */
	protected $templates_panel_editor = false;
	/**
	 * Post object for VC in Admin.
	 *
	 * @since  4.4
	 * @access protected
	 * @var bool|Vc_Post_Admin
	 */
	protected $post_admin = false;
	/**
	 * Post object for VC.
	 *
	 * @since  4.4.3
	 * @access protected
	 * @var bool|Vc_Post_Admin
	 */
	protected $post = false;
	/**
	 * List of shortcodes map to VC.
	 *
	 * @since  4.2
	 * @access public
	 * @var array WPBakeryShortCodeFishBones
	 */
	protected $shortcodes = array();

	/**
	 * @deprecated 4.4 due to autoload logic
	 * @var Vc_Vendors_Manager $vendor_manager
	 */
	protected $vendor_manager;

	/**
	 * Load default object like shortcode parsing.
	 *
	 * @since  4.2
	 * @access public
	 */
	public function init() {
		do_action( 'vc_before_init_base' );
		if ( is_admin() ) {
			$this->postAdmin()->init();
		}
		add_filter( 'body_class', array(
			&$this,
			'bodyClass',
		) );
		add_filter( 'the_excerpt', array(
			&$this,
			'excerptFilter',
		) );
		add_action( 'wp_head', array(
			&$this,
			'addMetaData',
		) );
		add_action( 'wp_head', array(
			&$this,
			'addIEMinimalSupport',
		) );
		if ( is_admin() ) {
			$this->initAdmin();
		} else {
			$this->initPage();
		}
		do_action( 'vc_after_init_base' );
	}

	/**
	 * Post object for interacting with Current post data.
	 * @since 4.4
	 * @return Vc_Post_Admin
	 */
	public function postAdmin() {
		if ( false === $this->post_admin ) {
			require_once vc_path_dir( 'CORE_DIR', 'class-vc-post-admin.php' );
			$this->post_admin = new Vc_Post_Admin();
		}

		return $this->post_admin;
	}

	/**
	 * Build VC for frontend pages.
	 *
	 * @since  4.2
	 * @access public
	 */
	public function initPage() {
		do_action( 'vc_build_page' );
		add_action( 'template_redirect', array(
			&$this,
			'frontCss',
		) );
		add_action( 'template_redirect', array(
			'WPBMap',
			'addAllMappedShortcodes',
		) );
		add_action( 'wp_head', array(
			&$this,
			'addFrontCss',
		), 1000 );
		add_action( 'wp_head', array(
			&$this,
			'addNoScript',
		), 1000 );
		add_action( 'template_redirect', array(
			&$this,
			'frontJsRegister',
		) );
		add_filter( 'the_content', array(
			&$this,
			'fixPContent',
		), 11 );
	}

	/**
	 * Load admin required modules and elements
	 *
	 * @since  4.2
	 * @access public
	 */
	public function initAdmin() {
		do_action( 'vc_build_admin_page' );
		// Build settings for admin page;
		//$this->registerAdminJavascript();
		//$this->registerAdminCss();

		// editors actions:
		$this->editForm()->init();
		$this->templatesPanelEditor()->init();
		// ajax params/shortcode action
		add_action( 'wp_ajax_wpb_single_image_src', array(
			&$this,
			'singleImageSrc',
		) ); // @todo move it
		add_action( 'wp_ajax_wpb_gallery_html', array(
			&$this,
			'galleryHTML',
		) ); // @todo move it

		// plugins list page actions links
		add_filter( 'plugin_action_links', array(
			&$this,
			'pluginActionLinks',
		), 10, 2 );
	}

	/**
	 * Setter for edit form.
	 * @since 4.2
	 *
	 * @param Vc_Shortcode_Edit_Form $form
	 */
	public function setEditForm( Vc_Shortcode_Edit_Form $form ) {
		$this->shortcode_edit_form = $form;
	}

	/**
	 * Get Shortcodes Edit form object.
	 *
	 * @see    Vc_Shortcode_Edit_Form::__construct
	 * @since  4.2
	 * @access public
	 * @return Vc_Shortcode_Edit_Form
	 */
	public function editForm() {
		return $this->shortcode_edit_form;
	}

	/**
	 * Setter for Templates editor.
	 * @deprecated 4.4 updated to panel editor see Vc_Templates_Panel_Editor::__construct
	 * @use setTemplatesPanelEditor
	 * @since 4.2
	 *
	 * @param Vc_Templates_Editor $editor
	 */
	public function setTemplatesEditor( Vc_Templates_Editor $editor ) {
		// _deprecated_function( 'Vc_Base::setTemplatesEditor', '4.4 (will be removed in 4.10)', 'Vc_Base::setTemplatesPanelEditor' );
		$this->templates_editor = $editor;
	}

	/**
	 * Setter for Templates editor.
	 * @since 4.4
	 *
	 * @param Vc_Templates_Panel_Editor $editor
	 */
	public function setTemplatesPanelEditor( Vc_Templates_Panel_Editor $editor ) {
		$this->templates_panel_editor = $editor;
	}

	/**
	 * Get templates manager.
	 * @deprecated updated to panel editor see Vc_Templates_Panel_Editor::__construct
	 * @see    Vc_Templates_Editor::__construct
	 * @since  4.2
	 * @access public
	 * @return bool|Vc_Templates_Editor
	 */
	public function templatesEditor() {
		// _deprecated_function( 'Vc_Base::templatesEditor', '4.4 (will be removed in 4.10)', 'Vc_Base::templatesPanelEditor' );

		return $this->templates_editor;
	}

	/**
	 * Get templates manager.
	 * @see    Vc_Templates_Panel_Editor::__construct
	 * @since  4.4
	 * @access public
	 * @return bool|Vc_Templates_Panel_Editor
	 */
	public function templatesPanelEditor() {
		return $this->templates_panel_editor;
	}

	/**
	 * Save method for edit_post action.
	 * @deprecated 4.9
	 * @since  4.2
	 * @access public
	 *
	 * @param null $post_id
	 */
	public function save( $post_id = null ) {
		// _deprecated_function( '\Vc_Base::save', '4.9 (will be removed in 4.11)', '\Vc_Post_Admin::save' );
	}

	/**
	 * Add new shortcode to Visual composer.
	 *
	 * @see    WPBMap::map
	 * @since  4.2
	 * @access public
	 * @deprecated 4.9
	 *
	 * @param array $shortcode - array of options.
	 */
	public function addShortCode( array $shortcode ) {
		// _deprecated_function( '\Vc_Base::addShortcode', '4.9 (will be removed in 4.11)', '\Vc_Post_Admin::save' );
		if ( ! isset( $this->shortcodes[ $shortcode['base'] ] ) ) {
			require_once vc_path_dir( 'SHORTCODES_DIR', 'shortcodes.php' );
			$this->shortcodes[ $shortcode['base'] ] = new WPBakeryShortCodeFishBones( $shortcode );
		}

	}

	/**
	 * Get shortcode class instance.
	 *
	 * @see    WPBakeryShortCodeFishBones
	 * @since  4.2
	 * @access public
	 *
	 * @param string $tag
	 *
	 * @return Vc_Shortcodes_Manager|null
	 */
	public function getShortCode( $tag ) {
		return Vc_Shortcodes_Manager::getInstance()->setTag( $tag );
	}

	/**
	 * Remove shortcode from shortcodes list of VC.
	 *
	 * @since  4.2
	 * @access public
	 *
	 * @param $tag - shortcode tag
	 */
	public function removeShortCode( $tag ) {
		remove_shortcode( $tag );
	}

	/**
	 * @todo move it
	 * @since 4.2
	 */
	public function singleImageSrc() {
		// @todo again, this method should be moved (comment added on 4.8)
		vc_user_access()
			->checkAdminNonce()
			->validateDie()
			->wpAny( 'edit_posts', 'edit_pages' )
			->validateDie();

		$image_id = (int) vc_post_param( 'content' );
		$params = vc_post_param( 'params' );
		$post_id = vc_post_param( 'post_id' );
		$img_size = vc_post_param( 'size' );
		$img = '';

		if ( ! empty( $params['source'] ) ) {
			$source = $params['source'];
		} else {
			$source = 'media_library';
		}

		switch ( $source ) {
			case 'media_library':
			case 'featured_image':

				if ( 'featured_image' === $source ) {
					if ( $post_id && has_post_thumbnail( $post_id ) ) {
						$img_id = get_post_thumbnail_id( $post_id );
					} else {
						$img_id = 0;
					}
				} else {
					$img_id = preg_replace( '/[^\d]/', '', $image_id );
				}

				if ( ! $img_size ) {
					$img_size = 'thumbnail';
				}

				if ( $img_id ) {
					$img = wp_get_attachment_image_src( $img_id, $img_size );
					if ( $img ) {
						$img = $img[0];
					}
				}

				break;

			case 'external_link':
				if ( ! empty( $params['custom_src'] ) ) {
					$img = $params['custom_src'];
				}
				break;
		}

		die( $img );
	}

	/**
	 * @todo move it
	 * @since 4.2
	 */
	public function galleryHTML() {
		// @todo again, this method should be moved (comment added on 4.8)
		vc_user_access()
			->checkAdminNonce()
			->validateDie()
			->wpAny( 'edit_posts', 'edit_pages' )
			->validateDie();

		$images = vc_post_param( 'content' );
		if ( ! empty( $images ) ) {
			echo fieldAttachedImages( explode( ',', $images ) );
		}
		die();
	}

	/**
	 * Rewrite code or name
	 * @since 4.2
	 */
	public function createShortCodes() {
		_deprecated_function( 'Vc_Base::createShortCodes', '4.2' );
	}

	/**
	 * Set or modify new settings for shortcode.
	 *
	 * This function widely used by WPBMap class methods to modify shortcodes mapping
	 *
	 * @since 4.3
	 *
	 * @param $tag
	 * @param $name
	 * @param $value
	 */
	public function updateShortcodeSetting( $tag, $name, $value ) {
		Vc_Shortcodes_Manager::getInstance()
		                     ->getElementClass( $tag )
		                     ->setSettings( $name, $value );
	}

	/**
	 * Build custom css styles for page from shortcodes attributes created by VC editors.
	 *
	 * Called by save method, which is hooked by edit_post action.
	 * Function creates meta data for post with the key '_wpb_shortcodes_custom_css'
	 * and value as css string, which will be added to the footer of the page.
	 *
	 * @since  4.2
	 * @access public
	 *
	 * @param $post_id
	 */
	public function buildShortcodesCustomCss( $post_id ) {
		$post = get_post( $post_id );
		/**
		 * vc_filter: vc_base_build_shortcodes_custom_css
		 * @since 4.4
		 */
		$css = apply_filters( 'vc_base_build_shortcodes_custom_css', $this->parseShortcodesCustomCss( $post->post_content ) );
		if ( empty( $css ) ) {
			delete_post_meta( $post_id, '_wpb_shortcodes_custom_css' );
		} else {
			update_post_meta( $post_id, '_wpb_shortcodes_custom_css', $css );
		}
	}

	/**
	 * Parse shortcodes custom css string.
	 *
	 * This function is used by self::buildShortcodesCustomCss and creates css string from shortcodes attributes
	 * like 'css_editor'.
	 *
	 * @see    WPBakeryVisualComposerCssEditor
	 * @since  4.2
	 * @access public
	 *
	 * @param $content
	 *
	 * @return string
	 */
	public function parseShortcodesCustomCss( $content ) {
		$css = '';
		if ( ! preg_match( '/\s*(\.[^\{]+)\s*\{\s*([^\}]+)\s*\}\s*/', $content ) ) {
			return $css;
		}
		WPBMap::addAllMappedShortcodes();
		preg_match_all( '/' . get_shortcode_regex() . '/', $content, $shortcodes );
		foreach ( $shortcodes[2] as $index => $tag ) {
			$shortcode = WPBMap::getShortCode( $tag );
			$attr_array = shortcode_parse_atts( trim( $shortcodes[3][ $index ] ) );
			if ( isset( $shortcode['params'] ) && ! empty( $shortcode['params'] ) ) {
				foreach ( $shortcode['params'] as $param ) {
					if ( 'css_editor' === $param['type'] && isset( $attr_array[ $param['param_name'] ] ) ) {
						$css .= $attr_array[ $param['param_name'] ];
					}
				}
			}
		}
		foreach ( $shortcodes[5] as $shortcode_content ) {
			$css .= $this->parseShortcodesCustomCss( $shortcode_content );
		}

		return $css;
	}

	/**
	 * Hooked class method by wp_head WP action to output post custom css.
	 *
	 * Method gets post meta value for page by key '_wpb_post_custom_css' and if it is not empty
	 * outputs css string wrapped into style tag.
	 *
	 * @since  4.2
	 * @access public
	 *
	 * @param int $id
	 */
	public function addPageCustomCss( $id = null ) {
		if ( ! is_singular() ) {
			return;
		}
		if ( ! $id ) {
			$id = get_the_ID();
		}
		if ( $id ) {
			$post_custom_css = get_post_meta( $id, '_wpb_post_custom_css', true );
			if ( ! empty( $post_custom_css ) ) {
				$post_custom_css = strip_tags( $post_custom_css );
				echo '<style type="text/css" data-type="vc_custom-css">';
				echo $post_custom_css;
				echo '</style>';
			}
		}
	}

	/**
	 * Hooked class method by wp_footer WP action to output shortcodes css editor settings from page meta data.
	 *
	 * Method gets post meta value for page by key '_wpb_shortcodes_custom_css' and if it is not empty
	 * outputs css string wrapped into style tag.
	 *
	 * @since  4.2
	 * @access public
	 *
	 * @param int $id
	 *
	 */
	public function addShortcodesCustomCss( $id = null ) {
		if ( ! is_singular() ) {
			return;
		}
		if ( ! $id ) {
			$id = get_the_ID();
		}

		if ( $id ) {
			$shortcodes_custom_css = get_post_meta( $id, '_wpb_shortcodes_custom_css', true );
			if ( ! empty( $shortcodes_custom_css ) ) {
				$shortcodes_custom_css = strip_tags( $shortcodes_custom_css );
				echo '<style type="text/css" data-type="vc_shortcodes-custom-css">';
				echo $shortcodes_custom_css;
				echo '</style>';
			}
		}
	}

	/**
	 * Add css styles for current page and elements design options added w\ editor.
	 */
	public function addFrontCss() {
		$this->addPageCustomCss();
		$this->addShortcodesCustomCss();
	}

	public function addNoScript() {
		echo '<noscript>';
		echo '<style type="text/css">';
		echo ' .wpb_animate_when_almost_visible { opacity: 1; }';
		echo '</style>';
		echo '</noscript>';
	}

	/**
	 * Register front css styles.
	 *
	 * Calls wp_register_style for required css libraries files.
	 *
	 * @since  3.1
	 * @access public
	 */
	public function frontCss() {
		wp_register_style( 'flexslider', vc_asset_url( 'lib/bower/flexslider/flexslider.min.css' ), array(), WPB_V