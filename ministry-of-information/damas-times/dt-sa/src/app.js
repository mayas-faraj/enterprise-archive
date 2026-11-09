import sendXhr from "./api.js";
//import moment from './node_modules/moment/src/moment';
//import './node_modules/moment/src/locale/ar.js';

//swipper initialization
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

const categorySwiper = new Swiper(".slider-category", {
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
	effect: "flip"
});

//stickey header
let nav=document.getElementsByTagName("nav")[0];
let headerOffset=nav.offsetTop;
document.onscroll=()=>{
	if(window.scrollY>=headerOffset) nav.classList.add("sticky"); else nav.classList.remove("sticky");
}

//search box
document.getElementById("search-text").onkeypress=e=> {
	if(e.key=="Enter") window.location.href="search/"+document.getElementById("search-text").value;
}


//update times of posts
moment.locale("ar");
console.log(moment.locale());
let updateTimer=()=>{
	let ts=document.querySelectorAll("time[datetime]");
	for(let i=0; i<ts.length; i++) ts[i].innerHTML=moment(ts[i].dateTime, "YYYY-MM-DD HH:mm:ss").fromNow();
};
updateTimer();
setInterval(60000, updateTimer);
