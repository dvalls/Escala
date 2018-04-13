$("#pesquisa").focus();

// quick search regex
var qsRegex;

// init Isotope
var $grid = $('.grid').isotope({

    LayoutMode: 'fitColumns',
    itemSelector: '.grid-item',

    filter: function() {
        return qsRegex ? $(this).text().match( qsRegex ) : true;
    }
});

// use value of search field to filter
var $quicksearch = $('#pesquisa').keyup( debounce( function() {
    qsRegex = new RegExp( $quicksearch.val(), 'gi' );
    $grid.isotope();
}, 200 ) );

// debounce so filtering doesn't happen every millisecond
function debounce( fn, threshold ) {
    var timeout;
    return function debounced() {
        if ( timeout ) {
            clearTimeout( timeout );
        }
        function delayed() {
            fn();
            timeout = null;
        }
        timeout = setTimeout( delayed, threshold || 100 );
    }
}