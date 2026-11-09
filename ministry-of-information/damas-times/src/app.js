import sendXhr from "./api.js";
const mainSwiper = new Swiper("#main-slider", {
	autoplay: {
		delay: 3000,
		disableOnIneraction: false
	},
	loop: true,
	pagination: {
		el: ".swiper-pagination"
	},
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev"
	},
	effect: "fade"
});

const breakingSwiper = new Swiper("#breaking-slider", {
	autoplay: {
		delay: 2000,
		disableOnInteraction: true
	},
	loop: true,
	effect: "cards",
	grapCursor: true
});
