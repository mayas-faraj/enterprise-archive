//global fn called by vendor
function ratingsDisplayed(totalReviewCount, avgRating, ratingsOnlyReviewCount) {
    $('.BVRatingSummaryLinks a[href="#reviews"]').click(function() { $('.ui-tabs-nav a[href="#RatingsAndReviews"]').trigger('click') });
}

/*global $ document*/
var DELL = window.DELL || {};
DELL.com = DELL.com || {};
DELL.com.bv = DELL.com.BV || {};

(function($) {
    (function() {
        var undefined;
        DELL.com.Utils.Initialize({
            initialize: function() {

                var urlDiv = document.getElementById('BVUrl');
                var frame = document.getElementById('BVFrame');

                var bvContainer = document.getElementById('BVContainerPageURL');
                if (bvContainer != null) {
                    bvContainer.innerHTML = bvContainer.innerHTML.replace(/http:\/\/[^\/]*/i, 'http://' + document.location.host);
                }

                if (urlDiv && frame) {
                    var domain = 'dell.com';
                    try {
                        if (document.domain != domain)
                            document.domain = domain;
                        frame.src = urlDiv.innerHTML;
                    }

                    catch (e) { }

                }
            }
        });

    }).call(DELL.com.BV)
})(jQuery);