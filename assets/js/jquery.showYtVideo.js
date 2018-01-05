(function($) {
    $.showYtVideo = function(options) {

        options = $.extend({
            ymodalSize: 'm',
            shadowOpacity: 0.5,
            shadowColor: '#000',
            clickOutside: 1,
            closeButton: 1,
            videoId: ''
        }, options);

        var ymodal = $('<div class="ymodal size-' + options.ymodalSize + '"></div>');
        var closeButton = $('<div class="ymodal-close">&#215;</div>');

        if (options.closeButton) {
            closeButton.appendTo(ymodal);   
        }
        
        var ymodalBg = $('<div class="ymodal-bg"></div>');
        
        ymodal.appendTo('body');
        ymodalBg.appendTo('body');

        var videoWidth = ymodal.width();
        var videoHeight = ymodal.height();
        var ymodalWidth = ymodal.outerWidth();
        var ymodalHeight = ymodal.outerHeight();


        if (options.videoId) {
            var iframe = $('<iframe width="'
                + videoWidth
                + '" height="'
                + videoHeight
                + '" src="https://www.youtube.com/embed/'
                + options.videoId
                + '" frameborder="0" allowfullscreen></iframe>');
console.log(ymodal);
            iframe.appendTo(ymodal);      
        } else {
            console.error('showYtVideo plugin error: videoId not specified');
        }

        ymodal.css({
            marginLeft: -ymodalWidth/2,
            marginTop: -ymodalHeight/2
        });

        ymodalBg.css({
            opacity: options.shadowOpacity,
            backgroundColor: options.shadowColor
        });


        closeButton.on('click', function() {
            $(this).parent().fadeOut(350, function() {
                $(this).detach();
                ymodalBg.detach();
            })
        });
        

        if (options.clickOutside) {
            $(document).mouseup(function(e) {
                if (!ymodal.is(e.target) && ymodal.has(e.target).length === 0) {
                    ymodal.fadeOut(350, function() {
                        $(this).detach();
                        ymodalBg.detach();
                    });
                }
            });
        }
    }   
})(jQuery);