<?php
/**
 * Request AgriLife People API data as a JSON file.
 *
 * @link       https://github.com/AgriLife/agrilife-faculty-search/blob/master/src/class-ajax.php
 * @since      0.1.0
 * @package    agrilife-faculty-search
 * @subpackage agrilife-faculty-search/src
 */

namespace FacultySearch;

/**
 * Generates JSON file via an AJAX call.
 *
 * @package agrilife-faculty-search
 * @since 0.1.0
 */
class Ajax {

	/**
	 * WordPress admin ajax URL.
	 *
	 * @var string
	 */
	private static $ajax_url = '';

	/**
	 * Initialize the class
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function __construct() {

		self::$ajax_url = admin_url( 'admin-ajax.php' );

		add_action( 'wp_ajax_get_people', '\FacultySearch\Ajax::get_people' );
		add_action( 'wp_ajax_nopriv_get_people', '\FacultySearch\Ajax::get_people' );

	}

	/**
	 * Set the ajax url and generate the admin url as a JavaScript variable.
	 *
	 * @since 0.1.0
	 * @param string $handle Registered script handle.
	 * @return void
	 */
	public static function set_ajax_url( $handle = 'agrilife-faculty-search' ) {

		$url = array(
			'ajax' => self::$ajax_url,
		);

		wp_localize_script( $handle, 'url', $url );

	}

	/**
	 * Call the AgriLife People API, store its results as a transient, and then output it as JSON.
	 * This function cannot refer to its "Ajax" class using "$this" due to how it is invoked.
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function get_people() {

		$cached          = true;
		$agrilife_people = get_transient( 'agrilife_people_list' );
		$specializations = get_transient( 'agrilife_people_specializations' );

		if ( false === $agrilife_people ) {

			$cached = false;

			// Get from API.
			require_once plugin_dir_path( dirname( dirname( __FILE__ ) ) ) . 'agrilife-people-api/src/Data.php';
			$api            = new \AgriLife\PeopleAPI\Data();
			$application_id = 3;
			$hash           = base64_encode( md5( $application_id . AGRILIFE_API_KEY, true ) );
			$limitedunits   = array( 286, 290, 291, 292, 294, 295, 296, 297, 298, 300, 302, 304, 314, 329, 353, 354, 355, 356, 357, 358, 359, 361, 362, 363, 364, 365, 366, 379, 396 );

			$data = array(
				'validation_key'     => $hash,
				'site_id'            => $application_id,
				'limited_units'      => implode( ',', $limitedunits ),
				'include_affiliated' => 1,
			);

			$apidata = $api->call( 'people', $data );
			$results = $apidata['json'];

			if ( 200 === $results['status'] ) {

				$payload         = $results['people'];
				$parsed_people   = array();
				$specializations = array();

				foreach ( $payload as $p ) {

					if ( 'faculty' === strtolower( $p['organizational_role'] ) ) {

						// The length of the class property names greatly impacts the size of the JSON file.
						$person     = new \stdClass();
						$person->fn = $p['first_name'];

						if ( $p['middle_initial'] ) {
							$person->mi = $p['middle_initial'];
						}

						$person->ln = $p['last_name'];
						$person->pn = $p['preferred_name'];
						$person->em = $p['email_address'];
						$person->dp = $p['positions'][0]['unit_name'];
						$person->tl = $p['positions'][0]['position_title'];
						$person->ph = $p['phone_number'];
						$person->a1 = $p['physical_address_1'];

						if ( $p['physical_address_2'] ) {
							$person->a2 = $p['physical_address_2'];
						}

						$person->ct = $p['physical_address_city'];
						$person->st = $p['physical_address_state'];
						$person->zp = preg_replace( '/-\d+$/', '', $p['physical_address_postal_code'] );

						if ( $p['directory_profile'][0]['_links'][0]['website'] ) {
							$person->web = $p['directory_profile'][0]['_links'][0]['website'];
						}

						if ( $p['directory_profile'][0]['_links'][0]['picture'] ) {
							$person->pc = $p['directory_profile'][0]['_links'][0]['picture'];
						}

						if ( $p['directory_profile'][0]['_links'][0]['link_cv'] ) {
							$person->cv = $p['directory_profile'][0]['_links'][0]['link_cv'];
						}

						if ( $p['directory_profle'][0]['_links'] ) {
							$person->lk = $p['directory_profle'][0]['_links'];
						}

						if ( $p['unit_name'] ) {
							$person->ut = $p['unit_name'];
						}

						// Parse specializations.
						if ( ! empty( $p['specializations'] ) ) {

							$parsed = array();

							foreach ( $p['specializations'] as $s ) {

								// Capitalize specialization names in case faculty did not in their ALP settings.
								$s = ucwords( $s );

								// Add unique specialization to collection.
								if ( ! array_key_exists( $s, $specializations ) ) {

									$index                 = count( $specializations );
									$specializations[ $s ] = $index;

								}

								$parsed[] = $specializations[ $s ];

							}

							$person->sp = $parsed;

						}

						$parsed_people[] = $person;

					}
				}

				$agrilife_people = $parsed_people;

			} else {

				$agrilife_people = false;
				$specializations = false;

			}

			// Store data.
			set_transient( 'agrilife_people_list', $agrilife_people, WEEK_IN_SECONDS );
			set_transient( 'agrilife_people_specializations', $specializations, WEEK_IN_SECONDS );

		}

		$return = array(
			'cached'          => $cached,
			'people'          => $agrilife_people,
			'specializations' => $specializations,
		);

		die( wp_json_encode( $return ) );

	}

}
