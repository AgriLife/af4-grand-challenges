<?php
/**
 * Assets for the plugin.
 *
 * @link       https://github.com/AgriLife/agrilife-faculty-search/blob/master/src/class-assets.php
 * @since      0.1.0
 * @package    agrilife-faculty-search
 * @subpackage agrilife-faculty-search/src
 */

namespace FacultySearch;

/**
 * Create shortcode to display the faculty search form.
 *
 * @package agrilife-faculty-search
 * @since 0.1.0
 */
class Shortcode {

	/**
	 * Initialize the class
	 *
	 * @since 0.1.0
	 * @return void
	 */
	public function __construct() {

		add_shortcode( 'faculty_search_categories', array( $this, 'create_shortcode' ) );
		add_shortcode( 'faculty_search', array( $this, 'create_search' ) );
		add_action( 'wp_enqueue_scripts', '\FacultySearch\Assets::register_assets' );
		add_action( 'wp_enqueue_scripts', '\FacultySearch\Assets::register_autocomplete_assets' );

	}

	/**
	 * Output for faculty_search_categories shortcode.
	 *
	 * @since 0.1.0
	 * @param array $atts Shortcode attributes.
	 * @return string
	 */
	public function create_shortcode( $atts ) {

		$a = shortcode_atts(
			array(
				'page'           => '',
				'specialization' => '',
			),
			$atts
		);

		$a['specialization'] = esc_attr( $a['specialization'] );

		\FacultySearch\Ajax::set_ajax_url( $a['specialization'] );
		wp_enqueue_style( 'agrilife-faculty-search' );
		wp_enqueue_script( 'agrilife-faculty-search' );

		ob_start(); ?>
		<div class="afs-list">
			<div class="people-search-form center">
				<label class="p">
					<h4>Search faculty by specialty</h4>
				</label>
				<div class="grid-x">
					<div class="cell medium-6 small-12 category" data-category="Food"><a href="#Food" class="button expanded button-radius secondary">Feeding Our World</a></div>
					<div class="cell medium-6 small-12 category" data-category="Environment"><a href="#Environment" class="button expanded button-radius secondary">Protecting Our Environment</a></div>
				</div>
				<div class="grid-x">
					<div class="cell medium-6 small-12 category" data-category="Health"><a href="#Health" class="button expanded button-radius secondary">Improving Our Health</a></div>
					<div class="cell medium-6 small-12 category" data-category="Youth"><a href="#Youth" class="button expanded button-radius secondary">Enriching Our Youth</a></div>
				</div>
				<div class="grid-x">
					<div class="cell medium-6 small-12 category" data-category="Economy"><a href="#Economy" class="button expanded button-radius secondary">Growing Our Economy</a></div>
				</div>
				<?php

				global $post;

				$allowed_html = array(
					'label'  => array(),
					'h4'     => array(
						'class' => array(),
					),
					'form'   => array(
						'action'              => array(),
						'method'              => array(),
						'id'                  => array(),
						'class'               => array(),
						'name'                => array(),
						'target'              => array(),
						'novalidate'          => array(),
						'data-specialization' => array(),
					),
					'input'  => array(
						'type'        => array(),
						'class'       => array(),
						'name'        => array(),
						'id'          => array(),
						'placeholder' => array(),
					),
					'select' => array(
						'name' => array(),
						'id'   => array(),
					),
					'option' => array(
						'value' => array(),
					),
					'div'    => array(
						'class' => array(),
					),
					'button' => array(
						'type'  => array(),
						'class' => array(),
					),
					'br'     => array(),
				);

				ob_start();
				?>
					<div class="faculty-search-header grid-container">
						<form role="search" class="people-searchform grid-x grid-padding-x" method="get" id="searchform" action="<?php echo esc_url( home_url() ); ?>/<?php echo esc_url( $post->post_name ); ?>" data-specialization="<?php echo esc_attr( $a['specialization'] ); ?>">
							<div class="cell medium-3"><select name="department" id="department"><option value="">Department</option>%s</select></div><div class="cell medium-3"><input type="text" class="s" name="p" id="s" placeholder="Search for a term" /></div><div class="cell medium-2"><input type="text" class="s" name="facultyname" id="n" placeholder="Enter name" /></div>
							<div class="cell medium-2"><button type="submit" class="button">Filter</button></div>
							<div class="cell medium-2"><button type="button" class="button clear">Clear</button></div>
						</form>
					</div>
				<?php
				$search = ob_get_clean();

				$departments = '';
				$dept_data   = get_transient( 'agrilife_faculty_departments' );
				if ( false !== $dept_data ) {
					foreach ( $dept_data as $key => $value ) {
						$departments .= sprintf( '<option value="%s">%s</option>', $key, $value );
					}
				}
				$specializations = '';
				$spec_data       = get_transient( 'agrilife_faculty_specializations' );
				if ( false !== $spec_data ) {
					foreach ( $spec_data as $key => $value ) {
						$specializations .= sprintf( '<option value="%s">%s</option>', $key, $value );
					}
				}

				$search = sprintf( $search, $departments );

				echo wp_kses(
					$search,
					$allowed_html
				);

				?>
			</div>
			<div class="column-headings grid-container"><div class="grid-x grid-padding-x"><div class="cell"></div><div class="cell medium-21"><strong>Name/Title</strong></div><div class="cell medium-21"><strong>Phone/Email</strong></div><div class="cell medium-21"><strong>Department</strong></div><div class="cell medium-auto"><strong>Research Interests</strong></div></div></div>
			<ul id="people-listing-ul" class="reset"></ul>
		</div>
		<script type="text/template" id="people-template">
			<li class="people-listing-item dept-{{= person.d}}{{ if ( ! _.isEmpty(person.s)) { }}{{ _.each(person.s, function(s){ }} spec-{{= s}}{{ }); }}{{ } }}">
				<div class="role people-container grid-container">
					<div class="person-info grid-x grid-padding-x">
						<div class="person-image cell shrink">
							{{ if ( ! _.isUndefined(person.pc)) { }}
								{{ if ( ! _.isEmpty(person.pf)) { }}<a href="{{= person.pf }}">{{ } }}<img src="{{= person.pc }}" alt="{{= person.f }} {{= person.l }}" />{{ if ( ! _.isEmpty(person.pf)) { }}</a>{{ } }}
							{{ } else { }}
								{{ if ( ! _.isEmpty(person.pf)) { }}<a href="{{= person.pf }}">{{ } }}<img src="<?php echo esc_url( AGFS_DIR_URL ); ?>img/agrilife-default-people-image-single.png" alt="{{= person.f }} {{= person.l }}" />{{ if ( ! _.isEmpty(person.pf)) { }}</a>{{ } }}
							{{ } }}
						</div>
						<div class="person-name cell medium-21"><div class="people-name"><strong>{{ if ( ! _.isEmpty(person.pf)) { }}<a href="{{= person.pf }}">{{ } }}{{= person.f }} {{= person.l }}{{ if ( ! _.isEmpty(person.pf)) { }}</a>{{ } }}</strong></div>{{ if ( ! _.isEmpty(person.t)) { }}<div>{{= person.t }}</div>{{ } }}</div>
						<div class="person-contact cell medium-21">{{ if ( ! _.isEmpty(person.p)) { }}<a href="tel:{{= person.pt}}">{{= person.p}}</a><br />{{ } }}{{ if ( ! _.isEmpty(person.e)) { }}<p class="people-email email"><a href="mailto:{{= person.e }}">{{= _.escape(person.e) }}</a></p>{{ } }}</div>
						<div class="person-dept cell medium-21">{{ if ( ! _.isEmpty(person.fd)) { }}{{= person.fd }}{{ } }}</div>
						<div class="person-interests cell medium-auto">{{ if ( ! _.isEmpty(person.fs)) { }}<ul>{{ _.each(person.fs, function(fs){ }}<li>{{= fs}}</li>{{ }); }}</ul>{{ } }}</div>
					</div>
				</div>
				{{ if ( person.s.length > 4 ) { }}<button class="faculty-search-expand" type="button" onclick="if ( ! this.parentNode.classList.contains('expanded') ) { this.innerHTML = '[-]'; this.parentNode.classList.add('expanded'); } else { this.innerHTML = '[+]'; this.parentNode.classList.remove('expanded'); }">[+]</button>{{ } }}
			</li>
		</script>

		<?php
		$return = ob_get_clean();

		return $return;

	}

	/**
	 * Output for faculty_search shortcode.
	 *
	 * @since 0.1.0
	 * @param array $atts Shortcode attributes.
	 * @return string
	 */
	public function create_search( $atts ) {

		$a = shortcode_atts(
			array(
				'page'           => '',
				'specialization' => '',
			),
			$atts
		);

		$a['specialization'] = esc_attr( $a['specialization'] );

		\FacultySearch\Ajax::set_ajax_url( $a['specialization'] );
		wp_enqueue_style( 'agrilife-faculty-search' );
		wp_enqueue_script( 'agrilife-faculty-search' );
		ob_start();
		?>
			<div class="faculty-search-header grid-container">
				<form role="search" class="people-searchform grid-x grid-padding-x p" method="get" id="searchform" action="<?php echo esc_url( home_url() ); ?>/<?php echo esc_url( $a['page'] ); ?>" data-specialization="<?php echo esc_attr( $a['specialization'] ); ?>">
					<div class="cell medium-3"><select name="department" id="department"><option value="">Department</option>%s</select></div><div class="cell medium-3"><input type="text" class="s" name="p" id="s" placeholder="Search for a term" /></div><div class="cell medium-2"><input type="text" class="s" name="person_name" id="n" placeholder="Enter name" /></div>
					<div class="cell medium-2"><button type="submit" class="button maroon">Filter</button></div>
					<div class="cell medium-2"><button type="button" class="button dark-gray clear">Clear</button></div>
				</form>
			</div>
		<?php
		$return = ob_get_clean();

		return $return;

	}

}
