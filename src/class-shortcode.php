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
	 * @return string
	 */
	public function create_shortcode() {

		\FacultySearch\Ajax::set_ajax_url();
		wp_enqueue_style( 'agrilife-faculty-search' );
		wp_enqueue_script( 'agrilife-faculty-search' );

		ob_start(); ?>
		<div class="gc-list">
			<div class="people-search-form center">
				<label class="p">
					<h4>Search faculty by specialty</h4>
				</label>
				<div class="grid-x p">
					<div class="cell medium-6 small-12 category" data-category="Food"><a href="#Food" class="button expanded button-radius secondary">Feeding Our World</a></div>
					<div class="cell medium-6 small-12 category" data-category="Environment"><a href="#Environment" class="button expanded button-radius secondary">Protecting Our Environment</a></div>
				</div>
				<div class="grid-x p">
					<div class="cell medium-6 small-12 category" data-category="Health"><a href="#Health" class="button expanded button-radius secondary">Improving Our Health</a></div>
					<div class="cell medium-6 small-12 category" data-category="Youth"><a href="#Youth" class="button expanded button-radius secondary">Enriching Our Youth</a></div>
				</div>
				<div class="grid-x p">
					<div class="cell medium-6 small-12 category" data-category="Economy"><a href="#Economy" class="button expanded button-radius secondary">Growing Our Economy</a></div>
				</div>
				<?php

				global $post;

				$allowed_html = array(
					'label' => array(),
					'h4'    => array(
						'class' => array(),
					),
					'form'  => array(
						'action'     => array(),
						'method'     => array(),
						'id'         => array(),
						'class'      => array(),
						'name'       => array(),
						'target'     => array(),
						'novalidate' => array(),
					),
					'input' => array(
						'type'        => array(),
						'class'       => array(),
						'name'        => array(),
						'id'          => array(),
						'placeholder' => array(),
					),
					'br'    => array(),
				);

				echo wp_kses(
					$this->create_search( array( 'page' => $post->post_name ) ),
					$allowed_html
				);

				?>
			</div>
			<ul id="people-listing-ul" class="grid-x grid-padding-x reset"></ul>
		</div>
		<script type="text/template" id="people-template">
			<li class="cell medium-4 small-12 people-listing-item p">
				<div class="grid-x grid-padding-x role people-container">
					<div class="cell shrink people-image">
						{{ if ( ! _.isUndefined(person.pc)) { }}
							{{ if ( ! _.isEmpty(person.pf)) { }}<a href="{{= person.pf }}">{{ } }}<img src="{{= person.pc }}" alt="{{= person.pn }} {{= person.ln }}" />{{ if ( ! _.isEmpty(person.pf)) { }}</a>{{ } }}
						{{ } else { }}
							{{ if ( ! _.isEmpty(person.pf)) { }}<a href="{{= person.pf }}">{{ } }}<img src="<?php echo esc_url( AGFS_DIR_URL ); ?>img/agrilife-default-people-image-single.png" alt="{{= person.pn }} {{= person.ln }}" />{{ if ( ! _.isEmpty(person.pf)) { }}</a>{{ } }}
						{{ } }}
					</div>
					<div class="cell auto info">
						<h2 class="people-name p">{{ if ( ! _.isEmpty(person.pf)) { }}<a href="{{= person.pf }}">{{ } }}{{= person.pn }} {{= person.ln }}{{ if ( ! _.isEmpty(person.pf)) { }}</a>{{ } }}</h2>
						{{ if ( ! _.isEmpty(person.tl)) { }}<p><strong>{{= person.tl }}</strong></p>{{ } }}
						<p class="people-dept">{{ if ( ! _.isEmpty(person.dp)) { }}{{= person.dp }}<br />{{ } }}
							{{ if ( ! _.isEmpty(person.a1)) { }}<em>{{= person.a1 }}</em><br />{{ } }}
							{{ if ( 'College Station' !== person.ct ) { }}{{ if ( ! _.isEmpty(person.a2)) { }}<em>{{= person.a2 }}</em><br />{{ } }}<em>{{ if ( ! _.isEmpty(person.ct) ) { }}{{= person.ct }}, {{ } }}{{ if ( ! _.isEmpty(person.st) ) { }}{{= person.st }} {{ } }}{{ if ( ! _.isEmpty(person.zp) ) { }}{{= person.zp }}{{ } }}</em>{{ } }}</p>
						<p class="people-email email">{{ if ( ! _.isEmpty(person.ph)) { }}<a href="tel:{{= person.ph.replace(/^(\d{3})\D+(\d{3})\D+(\d{4})/, '+1-$1-$2-$3') }}">{{= person.ph.replace(/^(\d{3})\D+(\d{3})\D+(\d{4})/, '($1) $2-$3') }}</a><br />{{ } }}
							<a href="mailto:{{= person.em }}">{{= _.escape(person.em) }}</a></p>
					</div>
				</div>
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
				'page' => '',
			),
			$atts
		);
		\FacultySearch\Ajax::set_ajax_url();
		wp_enqueue_style( 'agrilife-faculty-search' );
		wp_enqueue_script( 'agrilife-faculty-search' );
		ob_start();
		?>
			<label>
				<h4 class="p">Enter a Grand category keyword to locate associated faculty</h4>
			</label>
			<form role="search" class="people-searchform" method="get" id="searchform" action="<?php echo esc_url( home_url() ); ?>/<?php echo esc_url( $a['page'] ); ?>">
				<input type="text" class="s" name="p" id="s" placeholder="Search for a term" /><br />
			</form>
		<?php
		$return = ob_get_clean();

		return $return;

	}

}
