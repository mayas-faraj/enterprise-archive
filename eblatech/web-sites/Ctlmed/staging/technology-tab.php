<style>
	/*.c-tabs-nav__link.is-active::after {
		content: ' ';
		height: 0;
		position: relative;
		z-index: 2;
		top: 15px;
		left: 0px;
		width: 0;
		border: 10px solid transparent;
		
		border-bottom-color: red;
		
		float: left;
	}*/

	.c-tabs-nav {
		display: flex;
		list-style: none;
		margin: 20px 0px 20px 0px;
		padding: 0;
	}

	.c-tabs-nav__link {
		flex: 1;
		margin-right: 4px;
		padding: 12px;
		color: #fff;
		font-weight: 700;
		background-color: #b3b3b3;
		text-align: center;
		transition: color 0.3s;
	}

	.c-tabs-nav__link:last-child {
		margin-right: 0;
	}

	.c-tabs-nav__link:hover {
		color: #6d6d6d;
	}

	.c-tabs-nav__link.is-active {
		color: #dc446e;
		background-color: #e7e7e7;
	}

	.c-tabs-nav__link i,
	.c-tabs-nav__link span {
		margin: 0;
		padding: 0;
		line-height: 1;
	}

	.c-tabs-nav__link i {
		font-size: 18px;
	}

	.c-tabs-nav__link span {
		display: none;
		font-size: 18px;
	}

	@media all and (min-width: 720px) {
		.c-tabs-nav__link i {
			margin-bottom: 12px;
			font-size: 22px;
		}
		.c-tabs-nav__link span {
			display: block;
		}
	}
	/**
 * Tab
 */

	.c-tab {
		display: none;
		background-color: #e7e7e7;
	}

	.c-tab.is-active {
		display: block;
	}

	.c-tab__content {
		padding: 1.5rem;
	}

	div.c-tab__content,
	ul,
	li {
		display: block;
	}
	div.c-tab__content ul li{
	 
		width: 33%;
	}
	div.c-tab__content ul li ul li{
		 color: #336da6 !important;
border: none !important;
padding: 7px 0;
		width: 100%;
	}
	div.c-tab__content, ul,	li {
		float: left;
		padding: 0 15px;
	
	}

	div.c-tab__content ul li a {
		color: #ff9900 !important;
		border-bottom: 2px solid #ff9900;
		width: 100%;
		padding: 14px 0;
		display: block;
	}
	div.c-tab__content ul li ul  li a {
		color: #000 !important;
		display: block;
		float: none;
		border-bottom: none;
		padding-top: 1px;
		padding-bottom: 1px;
	}
	div.c-tab__content	ul	li ul li {
		float: none;
			padding-top: 1px;
		padding-bottom: 1px;
		
/*		max-width: 33%;*/
/*		display: block;*/
/*		background-color: brown;*/
	}

</style>

<section class="no-padding ctl-products">
	<div class="container">
		<h3 class="text-center">Find Your Solution</h3>
<p class="text-center">
Discover our portfolio of CTL Medical products.</p>

		<div id="tabs" class="c-tabs no-js">
			<div class="c-tabs-nav">
				<a href="#" class="c-tabs-nav__link ">Product Categories<i class="fa fa-chevron-down "></i> <i class="fa fa-chevron-up hidden"></i></a>
 
			</div>
<!--			<div class="c-tab ">
				<div class="c-tab__content">
					<ul class="">
						<li >
							<a class="text-center"href="">Matisse™</a>
							<ul>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-matisse-ticro">Matisse “TiCro”: Titanium ACIF Interbody</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-matisse">Matisse™ - ACIF Cage</a></li>
							</ul>
						</li>
						<li>
							<a class="text-center"href="">	Van Gogh™</a>
							<ul>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-vangogh">Van Gogh™ - Cervical Plating System</a></li>
							</ul>
						</li>
						<li  >
							<a class="text-center" href="">Cezanne™</a>
							<ul >
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-cezanne">Cezanne™ - Banana TLIF System</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-cezanne2">Cezanne-II™ - Bullet TLIF System</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-cezanne-dps">Cezanne™ DISC PREP SET</a></li>
							</ul>
							</li>
						<li  >
							<a class="text-center" href="">Raphael™</a>
							<ul >
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-raphael">Raphael™ - Pedicle Fixation System</a></li>
							</ul>
						</li>
						<li >
							<a class="text-center" href="">Renoir™ </a>
							<ul >
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-renoir">Renoir™ - Posterior C-T Fixation System</a></li>
							</ul>
						</li>
						<li  >
							<a class="text-center" href="">Degas™ </a>
							<ul >
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-degas">Degas™ - Cervical Plating System</a></li>
							</ul>
						</li>
						<li >
							<a class="text-center" href="">Picasso™</a>
							<ul >
								

							</ul>
						</li>
						
					</ul>
				</div>
			</div>
-->
 <div class="c-tab ">
				<div class="c-tab__content">
					<ul class="">
						<li >
							<a class="text-center"href="">Cervical and Cervico-Thoracic Systems</a>
							<ul>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-matisse-ticro">Matisse “TiCro”: Titanium ACIF Interbody</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Matisse Interbody</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-vangogh">Van Gogh™ - Cervical Plating System</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-degas">Degas™ - Cervical Plating System</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-renoir">Renoir™ - Posterior C-T Fixation System</a></li>
								
								 
							</ul>
						</li>
					 
						<li  >
							<a class="text-center" href="">Thoracolumbar Posterior Fixation </a>
							<ul >
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Raphael Cortical Screw System</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Raphael Pedicle Screw “Open” System </a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-raphael">Raphael™ - Pedicle Fixation System</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-picasso2">Picasso™ II - MIS / Percutaneous System</a></li><li><a href="" class="product-box" data-toggle="modal" data-target="# ">Standalone ALIF Fixation System (Coming Soon)</a></li>
								
							</ul>
						</li>
						 
						<li >
							<a class="text-center" href="">Thoracolumbar Posterior Interbody  </a>
							<ul >
								<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-cezanne">Cezanne™ - Banana TLIF System</a></li>
<li><a href="" class="product-box" data-toggle="modal" data-target="#modal-cezanne2">Cezanne-II™ - Bullet TLIF System</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Cezanne DLIF (Direct Lateral)</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Standalone Cervical Fixation System (Coming Soon)</a></li>
							</ul>
						</li>
						<li  >
							<a class="text-center" href="">Lumbar Access and Key Instruments </a>
							<ul >
								
								
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Standalone Cervical Fixation System (Coming Soon)</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">DLIF Lateral Retractor </a></li>
							 
								
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">TLIF Disc Preparation Set (Will provide Image)</a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Rongeur (Will provide Image)  </a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Rod reducer (Will provide Image) </a></li>
								<li><a href="" class="product-box" data-toggle="modal" data-target="# ">Discectomy Sets (Will provide Image) </a></li>	
							</ul>
							</li>
						
					 </ul>
				</div>
			</div>

		</div>
	</div>
</section>
<script>
	(function() {

		'use strict';

		/**
		 * tabs
		 *
		 * @description The Tabs component.
		 * @param {Object} options The options hash
		 */
		var tabs = function(options) {

			var el = document.getElementById(options.el);
			//console.log(el);
			var tabNavigationLinks = el.querySelectorAll(options.tabNavigationLinks);
			var tabContentContainers = el.querySelectorAll(options.tabContentContainers);
			var activeIndex = -1;
			var initCalled = false;

			/**
			 * init
			 *
			 * @description Initializes the component by removing the no-js class from
			 *   the component, and attaching event listeners to each of the nav items.
			 *   Returns nothing.
			 */
			var init = function() {
				if (!initCalled) {
					initCalled = true;
					el.classList.remove('no-js');

					for (var i = 0; i < tabNavigationLinks.length; i++) {
						var link = tabNavigationLinks[i];
						handleClick(link, i);
					}
				}
			};

			/**
			 * handleClick
			 *
			 * @description Handles click event listeners on each of the links in the
			 *   tab navigation. Returns nothing.
			 * @param {HTMLElement} link The link to listen for events on
			 * @param {Number} index The index of that link
			 */
			var handleClick = function(link, index) {
				link.addEventListener('click', function(e) {
					e.preventDefault();
					goToTab(index);

				});
			};

			/**
			 * goToTab
			 *
			 * @description Goes to a specific tab based on index. Returns nothing.
			 * @param {Number} index The index of the tab to go to
			 */
			var goToTab = function(index) {
				console.log(tabNavigationLinks[index]);
				var i_ups = tabNavigationLinks[index].querySelectorAll('i.fa-chevron-up');
				var i_downs = tabNavigationLinks[index].querySelectorAll('i.fa-chevron-down');
				var is_up =false;
				var is_down=false;
						
				if (activeIndex == -1) {
					for (var i = 0; i < tabContentContainers.length; i++) {
						tabContentContainers[i].classList.remove('is-active');
						tabNavigationLinks[i].classList.remove('is-active');
						
					}
					tabNavigationLinks[index].classList.add('is-active');
					tabContentContainers[index].classList.add('is-active');
					activeIndex = index;
					is_up = true;
					is_down = false;
				} else
				if (index === activeIndex) {
					//$(tabContentContainers[index]).toggle('is-active');					
					tabNavigationLinks[index].classList.remove('is-active');
					tabContentContainers[index].classList.remove('is-active');
					activeIndex = -1;
					is_down=true;
					is_up = false;
				} else
				if (index >= 0 && index <= tabNavigationLinks.length) {
					for (var i = 0; i < tabContentContainers.length; i++) {
						tabContentContainers[i].classList.remove('is-active');
						tabNavigationLinks[i].classList.remove('is-active');
						
					}
					
					tabNavigationLinks[index].classList.add('is-active');
					tabContentContainers[index].classList.add('is-active');
					activeIndex = index;
					is_up = true;
					is_down = false;
				}
				if (is_up === true)
					{
						for (var j = 0; j < i_ups.length; j++) {
							if (i_ups[j])
								i_ups[j].classList.remove('hidden');
						}
						for (var j = 0; j < i_downs.length; j++) {
							if (i_downs[j])
								i_downs[j].classList.add('hidden');
						}
					}
				if (is_down === true){
					for (var j = 0; j < i_ups.length; j++) {
							if (i_ups[j])
								i_ups[j].classList.add('hidden');
						}
					for (var j = 0; j < i_downs.length; j++) {
							if (i_downs[j])
								i_downs[j].classList.remove('hidden');
						}
			}
			};

			/**
			 * Returns init and goToTab
			 */
			return {
				init: init,
				goToTab: goToTab
			};

		};

		/**
		 * Attach to global namespace
		 */
		window.tabs = tabs;
		var myTabs = tabs({
			el: 'tabs',
			tabNavigationLinks: '.c-tabs-nav__link',
			tabContentContainers: '.c-tab'
		});

		myTabs.init();
	})();

</script>
