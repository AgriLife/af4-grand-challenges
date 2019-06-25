<?php
/**
 * Assets for the plugin.
 *
 * @link       https://github.com/AgriLife/agrilife-faculty-search/blob/master/src/class-assets.php
 * @since      0.1.0
 * @package    agrilife-faculty-search
 * @subpackage agrilife-faculty-search/src
 */

namespace FacultySearch;

/**
 * Loads required theme assets
 *
 * @package agrilife-faculty-search
 * @since 0.1.0
 */
class Assets {

	/**
	 * Initialize the class
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function __construct() {

	}

	/**
	 * Register people assets.
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public static function register_assets() {

		wp_register_style(
			'agrilife-faculty-search',
			AGFS_DIR_URL . '/css/faculty-search.css',
			array( 'agriflex-default-styles' ),
			filemtime( AGFS_DIR_PATH . 'css/faculty-search.css' ),
			'screen'
		);

		wp_register_script(
			'agrilife-faculty-search',
			AGFS_DIR_URL . 'js/faculty-search.js',
			array( 'underscore', 'jquery-ui-autocomplete' ),
			filemtime( AGFS_DIR_PATH . 'js/faculty-search.js' ),
			true
		);

	}

	/**
	 * Enqueue autocomplete script.
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public static function register_autocomplete_assets() {

		wp_enqueue_script( 'jquery-ui-autocomplete' );

	}
}
