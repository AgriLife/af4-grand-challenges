<?php
/**
 * Assets for the plugin.
 *
 * @link       https://github.com/AgriLife/af4-grand-challenges/blob/master/src/class-assets.php
 * @since      0.1.0
 * @package    af4-grand-challenges
 * @subpackage af4-grand-challenges/src
 */

namespace GrandChallenges;

/**
 * Loads required theme assets
 *
 * @package af4-grand-challenges
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
	public static function register_people_assets() {

		wp_register_script(
			'gc-search',
			AF4_GC_DIR_URL . '/js/grand-challenges-search.js',
			array( 'underscore' ),
			filemtime( AF4_GC_DIR_PATH . 'js/grand-challenges-search.js' ),
			true
		);

		wp_register_script(
			'gc-autocomplete-list',
			AF4_GC_DIR_URL . '/js/grand-challenges-autocomplete-list.js',
			array( 'jquery-ui-autocomplete' ),
			filemtime( AF4_GC_DIR_PATH . 'js/grand-challenges-autocomplete-list.js' ),
			true
		);

		wp_enqueue_style(
			'plugin_name-admin-ui-css',
			'//ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/themes/smoothness/jquery-ui.css',
			false,
			'1.8.21',
			false
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
