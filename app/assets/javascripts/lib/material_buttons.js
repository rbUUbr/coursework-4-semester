// Bootstrap Material Style button  by Bootstrapthemes.co
(function($) {
    $(".bt-ripple").click(function(e) {
        var rippler = $(this);

        // create .ink element if it doesn't exist
        if (rippler.find(".ripple").length == 0) {
            rippler.append("<span class='ripple'></span>");
        }

        var ink = rippler.find(".ripple");

        // prevent quick double clicks
        ink.removeClass("animate");

        // set .ripple diametr
        if (!ink.height() && !ink.width()) {
            var d = Math.max(rippler.outerWidth(), rippler.outerHeight());
            ink.css({
                height: d,
                width: d
            });
        }

        // get click coordinates
        var x = e.pageX - rippler.offset().left - ink.width() / 2;
        var y = e.pageY - rippler.offset().top - ink.height() / 2;

        // set .ripple position and add class .animate
        ink.css({
            top: y + 'px',
            left: x + 'px'
        }).addClass("animate");
    });
})(jQuery);