<?php
/**
 * The file that defines the core plugin class
 *
 * A class definition that includes attributes and functions used across both the
 * public-facing side of the site and the admin area.
 *
 * @link       https://github.com/AgriLife/agrilife-faculty-search/blob/master/src/class-FacultySearch.php
 * @since      0.1.0
 * @package    agrilife-faculty-search
 * @subpackage agrilife-faculty-search/src
 */

/**
 * The core plugin class
 *
 * @since 0.1.0
 * @return void
 */
class FacultySearch {

	/**
	 * File name
	 *
	 * @var file
	 */
	private static $file = __FILE__;

	/**
	 * Instance
	 *
	 * @var instance
	 */
	private static $instance;

	/**
	 * Initialize the class
	 *
	 * @since 0.1.0
	 * @return void
	 */
	private function __construct() {

		$this->require_classes();

	}

	/**
	 * Load classes so they are visible to plugins.
	 *
	 * @since 0.2.0
	 * @return void
	 */
	private function require_classes() {

		// Load required assets.
		require_once AGFS_DIR_PATH . '/src/class-assets.php';
		$afs_assets = new \FacultySearch\Assets();

		// Load shortcodes.
		require_once AGFS_DIR_PATH . '/src/class-shortcode.php';
		$afs_shortcode = new \FacultySearch\Shortcode();

		// Load ajax.
		require_once AGFS_DIR_PATH . '/src/class-ajax.php';
		$afs_ajax = new \FacultySearch\Ajax();

	}

	/**
	 * Autoloads any classes called within the theme
	 *
	 * @since 0.1.0
	 * @param string $classname The name of the class.
	 * @return void.
	 */
	public static function autoload( $classname ) {

		$filename = dirname( __FILE__ ) .
			DIRECTORY_SEPARATOR .
			str_replace( '_', DIRECTORY_SEPARATOR, $classname ) .
			'.php';

		if ( file_exists( $filename ) ) {
			require $filename;
		}

	}

	/**
	 * Return instance of class
	 *
	 * @since 0.1.0
	 * @return object.
	 */
	public static function get_instance() {

		return null === self::$instance ? new self() : self::$instance;

	}

}
