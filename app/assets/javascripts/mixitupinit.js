$(function(){
    var $showMore = $('#ShowMore');
    var $container = $('#Roomlist');
    var pagelimit = 4;

    $container.mixItUp({
        pagination: {limit: pagelimit},
        load: {filter: '.allrooms'},
        callbacks: {
            onMixLoad: function(state) {
                var total = state.$targets.length;
                if (total > 4) {
                    $showMore.addClass('visible');
                }
            }
        }
    });

    $showMore.on('click', function() {
        if (!$showMore.hasClass('show-more')) {
            $showMore.addClass('show-more').text('Показать все');
            $container.mixItUp('paginate', {
                limit: pagelimit
            });
        } else {
            $showMore.removeClass('show-more').text('Скрыть');
            $container.mixItUp('paginate', {
                limit: 999
            });
        }
    });

    $container.on('mixEnd', function(e, state){
        $showMore.removeClass('visible');
        var length = state.$show.length;
        var total = state.$targets.length;

        if (length >= pagelimit && length < total) {
            $showMore.addClass('visible');
        }
        if (length == total && length >= pagelimit) {
            $showMore.addClass('visible');
        }
    });
});