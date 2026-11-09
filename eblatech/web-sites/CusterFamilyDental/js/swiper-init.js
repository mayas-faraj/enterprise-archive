jQuery(document).ready(function () {
    "use strict";
    var carousel = new Swiper('.service-detail', {
        pagination: '.carousel-pagination',
        slidesPerView: 3,
        paginationClickable: true,
        spaceBetween: 40,
        breakpoints: {
            991: {
                slidesPerView: 2,
                spaceBetween: 50
            },
            767: {
                slidesPerView: 1,
                spaceBetween: 50
            }
        }
    });
    var The_team = new Swiper('.meet-the-team', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 3,
        paginationClickable: true,
        spaceBetween: 40,
        breakpoints: {
            991: {
                slidesPerView: 2,
                spaceBetween: 50
            },
            767: {
                slidesPerView: 1,
                spaceBetween: 50
            }
        }
    });

    var testimonials = new Swiper('.style-1', {
        pagination: '.carousel-pagination',
        slidesPerView: 1,
        paginationClickable: true,
        spaceBetween: 50,
        breakpoints:{
            991: {
                slidesPerView: 1,
                spaceBetween: 50
            },
            767: {
                slidesPerView: 1,
                spaceBetween: 50
            }
        }
    });

    var testimonialsStyle2 = new Swiper('.style-2', {
        pagination: '.carousel-pagination',
        slidesPerView: 3,
        paginationClickable: true,
        spaceBetween: 52,
        breakpoints:{
            991: {
                slidesPerView: 2,
                spaceBetween: 51
            },
            767: {
                slidesPerView: 1,
                spaceBetween: 51
            }
        }
    });

});