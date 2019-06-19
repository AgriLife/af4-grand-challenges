<?php
/**
 * Assets for the plugin.
 *
 * @link       https://github.com/AgriLife/af4-grand-challenges/blob/master/src/class-assets.php
 * @since      0.1.0
 * @package    af4-grand-challenges
 * @subpackage af4-grand-challenges/src
 */

namespace GrandChallenges;

/**
 * Create shortcode to display the faculty search form.
 *
 * @package af4-grand-challenges
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

		add_shortcode( 'grand_challenges_people', array( $this, 'create_shortcode' ) );
		add_shortcode( 'grand_challenges_people_search', array( $this, 'create_search' ) );
		add_action( 'wp_enqueue_scripts', '\GrandChallenges\Assets::register_people_assets' );
		add_action( 'wp_enqueue_scripts', '\GrandChallenges\Assets::register_autocomplete_assets' );

	}

	/**
	 * Output for grand_challenges_people shortcode.
	 *
	 * @since 0.1.0
	 * @return string
	 */
	public function create_shortcode() {

		\GrandChallenges\Ajax::set_ajax_url();
		wp_enqueue_script( 'gc-search' );
		wp_enqueue_script( 'gc-autocomplete-list' );

		ob_start(); ?>
		<div class="gc-list">
			<div class="people-search-form center">
				<label class="p">
					<h4>Search faculty by specialty</h4>
				</label>
				<div class="grid-x p">
					<div class="cell medium-6 small-12 challenge" data-challenge="food"><a href="#Food" class="button expanded button-radius secondary">Feeding Our World</a></div>
					<div class="cell medium-6 small-12 challenge" data-challenge="environment"><a href="#Environment" class="button expanded button-radius secondary">Protecting Our Environment</a></div>
				</div>
				<div class="grid-x p">
					<div class="cell medium-6 small-12 challenge" data-challenge="health"><a href="#Health" class="button expanded button-radius secondary">Improving Our Health</a></div>
					<div class="cell medium-6 small-12 challenge" data-challenge="youth"><a href="#Youth" class="button expanded button-radius secondary">Enriching Our Youth</a></div>
				</div>
				<div class="grid-x p">
					<div class="cell medium-6 small-12 challenge" data-challenge="economy"><a href="#Economy" class="button expanded button-radius secondary">Growing Our Economy</a></div>
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
			<ul id="people-listing-ul" class="grid-x reset"></ul>
		</div>
		<script type="text/template" id="people-template">
			<li class="cell medium-4 small-12 people-listing-item">
				<div class="grid-x margin-collapse role people-container">
					<div class="cell shrink people-image">
						{{ if ( ! _.isEmpty(picture)) { }}
							{{ if ( ! _.isEmpty(profile)) { }}<a href="{{= profile }}">{{ } }}<img src="{{= picture }}" alt="{{= preferredname }} {{= lastname }}" />{{ if ( ! _.isEmpty(profile)) { }}</a>{{ } }}
						{{ } }}
					</div>
					<div class="cell auto info">
						<h2 class="people-name">{{ if ( ! _.isEmpty(profile)) { }}<a href="{{= profile }}">{{ } }}{{= preferredname }} {{= lastname }}{{ if ( ! _.isEmpty(profile)) { }}</a>{{ } }}</h2>
						{{ if ( ! _.isEmpty(title)) { }}<h3>{{= title }}</h3>{{ } }}
						<p class="people-dept">{{= department }}<br />
							{{= physicaladdress1 }}<br />
							{{ if ( 'College Station' !== physicaladdresscity ) { }}{{= physicaladdresscity }}<br />
							{{= physicaladdressstate }}<br />
							{{= physicaladdresspostalcode }}<br />
							{{= unitname }}<br />{{ } }}
							{{= phonenumber }}</p>
						<p class="people-email email"><a href="mailto:{{= emailaddress }}">{{= _.escape(emailaddress) }}</a></p>
						{{ if (specializations != false) { }}
							<div class="people-specialty-list expanded">
								<ul>
									{{ _.each(specializations, function(sp) { }}
										<li>{{= sp }}</li>
									{{ }); }}
								</ul>
							</div>
						{{ } }}
					</div>
				</div>
			</li>
		</script>

		<?php
		$return = ob_get_clean();

		return $return;

	}

	/**
	 * Output for grand_challenges_people_search shortcode.
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
		\GrandChallenges\Ajax::set_ajax_url();
		wp_enqueue_script( 'gc-search' );
		wp_enqueue_script( 'gc-autocomplete-list' );
		ob_start();
		?>
			<label>
				<h4 class="p">Enter a Grand Challenge keyword to locate associated faculty</h4>
			</label>
			<form role="search" class="people-searchform" method="get" id="searchform" action="<?php echo esc_url( home_url() ); ?>/<?php echo esc_url( $a['page'] ); ?>">
				<input type="text" class="s" name="p" id="s" placeholder="Search for a term" /><br />
			</form>
		<?php
		$return = ob_get_clean();

		return $return;

	}

}
