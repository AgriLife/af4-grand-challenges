<?php
/**
 * The file that defines the core plugin class
 *
 * A class definition that includes attributes and functions used across both the
 * public-facing side of the site and the admin area.
 *
 * @link       https://github.com/AgriLife/af4-grand-challenges/blob/master/src/class-grandchallenges.php
 * @since      0.1.0
 * @package    af4-grand-challenges
 * @subpackage af4-grand-challenges/src
 */

/**
 * The core plugin class
 *
 * @since 0.1.0
 * @return void
 */
class GrandChallenges {

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

		add_action( 'init', array( $this, 'init' ) );

	}

	/**
	 * Initialize the various classes
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function init() {

		// Load required assets.
		require_once AF4_GC_DIR_PATH . '/src/class-assets.php';
		$assets = new \GrandChallenges\Assets();

		// Load shortcodes.
		require_once AF4_GC_DIR_PATH . '/src/class-shortcode.php';
		$shortcode = new \GrandChallenges\Shortcode();

		// Load ajax.
		require_once AF4_GC_DIR_PATH . '/src/class-ajax.php';
		$ajax = new \GrandChallenges\Ajax();

		/* Flush rewrite rules on plugin installation */
		if ( get_option( 'af4_gc_flush_rewrite_rules_flag' ) ) {
			flush_rewrite_rules();
			delete_option( 'af4_gc_flush_rewrite_rules_flag' );
		}

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
