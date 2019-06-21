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

/* Code for plugins */
register_deactivation_hook( __FILE__, 'flush_rewrite_rules' );
register_activation_hook( __FILE__, 'agrilife_faculty_search_activation' );

/**
 * Helper option flag to indicate rewrite rules need flushing
 *
 * @since 0.1.0
 * @return void
 */
function agrilife_faculty_search_activation() {
	$theme = wp_get_theme();
	if ( 'AgriFlex4' !== $theme->name ) {
		$error = sprintf(
			/* translators: %s: URL for plugins dashboard page */
			__(
				'Plugin NOT activated: The <strong>Faculty Search Plugin</strong> needs the <strong>AgriFlex4 Theme</strong> to be installed and activated first. <a href="%s">Back to plugins page</a>',
				'agrilife-faculty-search'
			),
			get_admin_url( null, '/plugins.php' )
		);
		wp_die( wp_kses_post( $error ) );
	}

	if ( ! get_option( 'agfs_flush_rewrite_rules_flag' ) ) {
		add_option( 'agfs_rewrite_rules_flag', true );
	}
}

/**
 * The core plugin class that is used to initialize the plugin
 */
require AGFS_DIR_PATH . 'src/class-facultysearch.php';

/* Autoload all classes */
spl_autoload_register( 'FacultySearch::autoload' );
FacultySearch::get_instance();
