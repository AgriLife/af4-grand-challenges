<?php
/**
 * Assets for the plugin.
 *
 * @link       https://github.com/AgriLife/agrilife-faculty-search/blob/master/src/class-checkdependency.php
 * @since      0.1.0
 * @package    agrilife-faculty-search
 * @subpackage agrilife-faculty-search/src
 */

namespace FacultySearch;

/**
 * Informs user of missing dependencies.
 *
 * @package agrilife-faculty-search
 * @since 0.1.0
 */
class CheckDependency {

	/**
	 * Initialize the class
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function __construct() {

		if ( ! is_plugin_active( 'agrilife-people-api/agrilife-people-api.php' ) ) {
			add_action( 'admin_notices', array( $this, 'error_notice' ) );
		}

	}

	/**
	 * Display the error notice.
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function error_notice() {

		wp_kses_post( '<div class="error notice"><p>The AgriLife Faculty Search plugin requires that you have also installed and activated the AgriLife People API plugin on this site. <a target="_blank" href="https://github.com/AgriLife/agrilife-people-api/releases/latest">You can download it here</a></p></div>' );
	}

}
