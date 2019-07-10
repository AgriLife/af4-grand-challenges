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
		$agrilife_people = get_transient( 'agrilife_faculty_list' );
		$specializations = get_transient( 'agrilife_faculty_specializations' );

		if ( false === $agrilife_people || false === get_transient( 'agrilife_faculty_specializations' ) ) {
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
				$departments     = array();

				foreach ( $payload as $p ) {

					$title             = $p['positions'][0]['position_title'];
					$skip              = false;
					$prohibited_titles = array( 'Adjunct Professor', 'Professor Emeritus', 'Assistant Professor', 'Retired', 'Visiting Professor' );

					if ( 'faculty' !== strtolower( $p['organizational_role'] ) ||
						empty( $p['specializations'] ) ||
						false === strpos( $title, 'Professor' )
					) {

						$skip = true;

					} else {

						foreach ( $prohibited_titles as $value ) {

							if ( false !== strpos( $title, $value ) ) {

								$skip = true;
								break;

							}
						}
					}

					if ( $skip ) {

						continue;

					}

					// The length of the class property names greatly impacts the size of the JSON file.
					$person    = new \stdClass();
					$person->f = $p['preferred_name'];
					$person->l = $p['last_name'];
					$title     = str_replace( 'Professor', '$P', $title );
					$title     = str_replace( 'Associate', '$A', $title );
					$title     = str_replace( 'Extension', '$E', $title );
					$title     = str_replace( 'Specialist', '$S', $title );
					$title     = str_replace( 'Management', '$M', $title );
					$title     = str_replace( 'Department Head', '$H', $title );
					$person->t = $title;
					$email     = str_replace( '@ag.tamu.edu', '$AT', $p['email_address'] );
					$email     = str_replace( '@tamu.edu', '$T', $email );
					$person->e = $email;
					$person->p = $p['phone_number'];

					// Handle departments.
					$dept = $p['positions'][0]['unit_name'];

					// Add unique department to collection.
					if ( ! array_key_exists( $dept, $departments ) ) {

						$index                = count( $departments );
						$departments[ $dept ] = $index;

					}

					$person->d = $departments[ $dept ];

					if ( $p['directory_profile'][0]['_links'][0]['website'] ) {
						$person->pf = $p['directory_profile'][0]['_links'][0]['website'];
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

						$person->s = $parsed;

					}

					$parsed_people[] = $person;

				}

				// Sort people alphabetically by last name.
				usort(
					$parsed_people,
					function( $a, $b ) {
						return strcmp( $a->ln, $b->ln );
					}
				);
				$agrilife_people = $parsed_people;

				$specializations = array_keys( $specializations );
				$departments     = array_keys( $departments );

			} else {

				$agrilife_people = false;
				$specializations = false;
				$departments     = false;

			}

			// Store data.
			set_transient( 'agrilife_faculty_list', $agrilife_people, WEEK_IN_SECONDS );
			set_transient( 'agrilife_faculty_specializations', $specializations, WEEK_IN_SECONDS );

		}

		$return = array(
			'cached'          => $cached,
			'people'          => $agrilife_people,
			'specializations' => $specializations,
			'departments'     => $departments,
		);

		die( wp_json_encode( $return ) );

	}

}
