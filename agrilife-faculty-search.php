<?php
/**
 * Faculty search feature using the AgriLife People API.
 *
 * @package      agrilife-faculty-search
 * @author       Zachary Watkins
 * @copyright    2019 Texas A&M AgriLife Communications
 * @license      GPL-2.0+
 *
 * @wordpress-plugin
 * Plugin Name:  AgriLife Faculty Search
 * Plugin URI:   https://github.com/AgriLife/agrilife-faculty-search
 * Description:  Faculty search feature using the AgriLife People API.
 * Version:      0.1.0
 * Author:       Zachary Watkins
 * Author URI:   https://github.com/ZachWatkins
 * Author Email: zachary.watkins@ag.tamu.edu
 * Text Domain:  agrilife-faculty-search
 * License:      GPL-2.0+
 * License URI:  http://www.gnu.org/licenses/gpl-2.0.txt
 */

/* Define some useful constants */
define( 'AGFS_DIRNAME', 'agrilife-faculty-search' );
define( 'AGFS_DIR_PATH', plugin_dir_path( __FILE__ ) );
define( 'AGFS_DIR_FILE', __FILE__ );
define( 'AGFS_DIR_URL', plugin_dir_url( __FILE__ ) );
define( 'AGFS_TEXTDOMAIN', 'agrilife-faculty-search' );
define( 'AGFS_TEMPLATE_PATH', AGFS_DIR_PATH . 'templates' );

/**
 * The core plugin class that is used to initialize the plugin
 */
require AGFS_DIR_PATH . 'src/class-facultysearch.php';
spl_autoload_register( 'FacultySearch::autoload' );
FacultySearch::get_instance();

/* Activation hooks */
register_activation_hook( __FILE__, 'ag_faculty_search_activation' );

/**
 * Helper option flag to indicate rewrite rules need flushing
 *
 * @since 0.1.1
 * @return void
 */
function ag_faculty_search_activation() {

	// Check for missing dependencies.
	$theme = wp_get_theme();
	$acf   = is_plugin_active( 'advanced-custom-fields-pro/acf.php' );
	$alp   = is_plugin_active( 'agrilife-people-api/agrilife-people-api.php' );
	if ( false === $acf || false === $alp ) {
		$error = sprintf(
			/* translators: %s: URL for plugins dashboard page */
			__(
				'Plugin NOT activated: The <strong>AgriLife Faculty Search</strong> plugin needs the <strong>Advanced Custom Fields Pro</strong> and <strong>AgriLife People API</strong> plugins to be installed and activated first. <a target="_blank" href="https://github.com/AgriLife/agrilife-people-api/releases/latest">You can download the AgriLife People API plugin here.</a><br><br><a href="%s">Back to plugins page</a>',
				'af4-college'
			),
			get_admin_url( null, '/plugins.php' )
		);
		wp_die( wp_kses_post( $error ) );
	}

}
