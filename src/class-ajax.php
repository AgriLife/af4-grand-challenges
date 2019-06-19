<?php
/**
 * Request AgriLife People API data as a JSON file.
 *
 * @link       https://github.com/AgriLife/af4-grand-challenges/blob/master/src/class-ajax.php
 * @since      0.1.0
 * @package    af4-grand-challenges
 * @subpackage af4-grand-challenges/src
 */

namespace GrandChallenges;

/**
 * Generates JSON file via an AJAX call.
 *
 * @package af4-grand-challenges
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

		add_action( 'wp_ajax_get_people', '\GrandChallenges\Ajax::get_people' );
		add_action( 'wp_ajax_nopriv_get_people', '\GrandChallenges\Ajax::get_people' );

	}

	/**
	 * Set the ajax url and generate the admin url as a JavaScript variable.
	 *
	 * @since 0.1.0
	 * @param string $handle Registered script handle.
	 * @return void
	 */
	public static function set_ajax_url( $handle = 'gc-search' ) {

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

				$payload       = $results['people'];
				$parsed_people = array();

				foreach ( $payload as $p ) {

					if ( 'faculty' === strtolower( $p['organizational_role'] ) ) {

						$person                            = new \stdClass();
						$person->firstname                 = $p['first_name'];
						$person->middleinitial             = $p['middle_initial'];
						$person->lastname                  = $p['last_name'];
						$person->preferredname             = $p['preferred_name'];
						$person->emailaddress              = $p['email_address'];
						$person->website                   = $p['directory_profile'][0]['_links'][0]['website'];
						$person->picture                   = $p['directory_profile'][0]['_links'][0]['picture'];
						$person->cv                        = $p['directory_profile'][0]['_links'][0]['link_cv'];
						$person->profile                   = $p['directory_profle'][0]['_links'][0]['website'];
						$person->links                     = $p['directory_profle'][0]['_links'];
						$person->department                = $p['positions'][0]['unit_name'];
						$person->title                     = $p['positions'][0]['position_title'];
						$person->organizationalrole        = $p['organizational_role'];
						$person->phonenumber               = $p['phone_number'];
						$person->physicaladdress1          = $p['physical_address_1'];
						$person->physicaladdress2          = $p['physical_address_2'];
						$person->physicaladdresscity       = $p['physical_address_city'];
						$person->physicaladdressstate      = $p['physical_address_state'];
						$person->physicaladdresspostalcode = $p['physical_address_postal_code'];
						$person->unitname                  = $p['unit_name'];

						// Parse specializations.
						if ( empty( $p['specializations'] ) ) {

							$person->specializations = false;

						} else {

							$parsed = array();
							foreach ( $p['specializations'] as $s ) {
								array_push( $parsed, strtolower( $s ) );
							}

							$person->specializations = $parsed;

						}

						array_push( $parsed_people, $person );

					}
				}

				$agrilife_people = $parsed_people;

			} else {

				$agrilife_people = false;

			}

			// Store data.
			set_transient( 'agrilife_people_list', $agrilife_people, WEEK_IN_SECONDS );

		}

		$return = array(
			'cached' => $cached,
			'people' => $agrilife_people,
		);

		die( wp_json_encode( $return ) );

	}

}
