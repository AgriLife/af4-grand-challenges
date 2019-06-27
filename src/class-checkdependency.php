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
	 * Error message
	 *
	 * @var message
	 */
	private $message = 'The AgriLife Faculty Search plugin requires that you have also installed and activated the AgriLife People API plugin on this site. <a target="_blank" href="https://github.com/AgriLife/agrilife-people-api/releases/latest">You can download it here.</a>';

	/**
	 * Initialize the class.
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function __construct() {

		add_action( 'admin_init', array( $this, 'check_deps' ) );
		register_activation_hook( AGFS_DIR_FILE, array( $this, 'activation' ) );

	}

	/**
	 * Return whether or not all dependencies are met.
	 *
	 * @since 0.1.0
	 * @return boolean
	 */
	public function has_all_dependencies() {

		include_once ABSPATH . 'wp-admin/includes/plugin.php';
		return is_plugin_active( 'agrilife-people-api/agrilife-people-api.php' );

	}

	/**
	 * Activation
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function activation() {

		if ( ! $this->has_all_dependencies() ) {

			deactivate_plugins( plugin_basename( AGFS_DIR_FILE ) );

			$error = sprintf(
				'<p>%s</p><p><a href="%s">Go back to the plugins page</a></p>',
				$this->message,
				admin_url( 'plugins.php' )
			);

			wp_die( wp_kses_post( $error ) );

		}

	}

	/**
	 * Check dependencies on admin pages.
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function check_deps() {

		if ( ! $this->has_all_dependencies() ) {

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

		?>
	<div class="notice error">
		<p><?php wp_kses_post( $this->message ); ?></p>
	</div>
		<?php

	}

}
