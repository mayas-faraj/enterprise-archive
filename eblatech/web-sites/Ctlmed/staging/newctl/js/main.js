jQuery.validator.setDefaults({
    debug: true,
    success: "valid"

});

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

jQuery(document).ready(function () {
	"use strict";
		
	jQuery(window).load(function() {
		var preload = jQuery(".preload");
	  	preload.fadeOut("slow");
	});
	
	var searchSection = jQuery(".search-secion");
	var searchSectionTextField = jQuery(".search-secion .form-control");
	jQuery(".main-menu").on ("click", ".search-icon", function(e){
		e.preventDefault();
		searchSection.slideToggle("fast");
		searchSectionTextField.focus();
	});

	jQuery("body").on("click", ".close-search a" , function(event){
		event.preventDefault();
		searchSection.slideToggle("fast");
	});
	
	jQuery(".navbar-default").on("click", ".main-menu li a i.fa-angle-down", function (event) {
        event.preventDefault();
		event.stopPropagation();
		var that = jQuery(this);
	    that.parent().next().slideToggle();
    });
    jQuery("body").on("click", ".scrolling a", function(e) {
        var ref = jQuery(this).attr("href");
        e.preventDefault();
        jQuery('html, body').animate({
            scrollTop: jQuery(ref).offset().top
        }, 1000);

    });

    jQuery.validator.addMethod("phoneUS", function (phone_number, element) {
        phone_number = phone_number.replace(/\s+/g, "");
        return this.optional(element) || phone_number.length > 9 && phone_number.match(/^(\+[0-9][0-9]*(\([0-9]*\)|-[0-9]*-))?[0]?[0-9][0-9\- ]*$/);
    }, "Please specify a valid phone number");

    jQuery.validator.addMethod("onlyCharacters", function(value, element) {
        return this.optional(element) || value == value.match(/^[a-zA-Z\s]+$/);
		
    },"Please Enter only letters");
	
	jQuery(window).on("scroll", function() {
        var scroll = jQuery(window).scrollTop();
		var headerSelector = jQuery("header.stuck");
        if (scroll >= 200) {
            headerSelector.addClass("stuckHeader");
        }
        else {
			headerSelector.removeClass("stuckHeader");
		}
	});
    jQuery( "#contactForm" ).validate( {
        submitHandler: function (form) {
            form.submit();
        },
        rules: {
            firstname:{
                required: true,
                onlyCharacters: false
            },
            lastname: {
                required: true,
                onlyCharacters: false
            },
            phone: {
                required: true,
                phoneUS: true
            }
        },
        messages: {
            phone: "Please enter a valid phone number"
        },
        errorElement: "em",
        errorPlacement: function ( error, element ) {
            // Add the `help-block` class to the error element
            error.addClass( "help-block" );

            if ( element.prop( "type" ) === "checkbox" ) {
                error.insertAfter( element.parent( "label" ) );
            } else {
                error.insertAfter( element );
            }
        },
        highlight: function ( element, errorClass, validClass ) {
            jQuery( element ).parents( ".form-group" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
            jQuery( element ).parents( ".form-group" ).addClass( "has-success" ).removeClass( "has-error" );
        }
    } );
	var selected_menu_item = getParameterByName('menu');
	selected_menu_item = (selected_menu_item?selected_menu_item:'home');
	$("li."+selected_menu_item).addClass("current-menu-item");
		
});