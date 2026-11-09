// JavaScript Document

jQuery(document).ready(function () {
	"use strict";	
	jQuery('.owl-carousel').owlCarousel({
		loop: true,
		nav: true,
		dots: false,
		animateOut: 'fadeOutDown',
		animateIn: 'fadeInUp',
		margin: 10,
		autoplay: true,
		autoplayTimeout: 3000,
		autoplayHoverPause: true,
		responsiveClass: true,
		navText : ["<i class='fa fa-chevron-right'></i>","<i class='fa fa-chevron-left'></i>"],
		responsive: {
		  0: {
			items: 1,
		  },
		  600: {
			items: 1,
		  }
		}
	  });
});