class MovieIndex


    constructor: (@dom) ->
        console.log 'MovieIndex-constructor'
        do @search


    initializeMovies: (data) =>
        console.log 'initializeMovies'
        jQuery(@dom).empty()
        for movie in data.movies
            console.log 'movie', movie
            movieWidget = new window.application.MovieWidget movie
            jQuery(@dom).append(movieWidget.dom)
            
            


    handleError: (data) =>
        console.log 'handleError'
        new Flash "There's been an error.", 'error'


    ##
    # Search is possible with an empty query.
    ##
    search: (q) =>
        if q
            api_anchor = "http://api.rottentomatoes.com/api/public/v1.0/movies.json"
            search_data = 
                    apikey: 'mezff9k5qr6q6499eey4f6te'
                    q: q
                    page_limit: 20
                    page: 1
        else
            api_anchor = "http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json"
            search_data = apikey: 'mezff9k5qr6q6499eey4f6te'

        jQuery.ajax(api_anchor,
                data: search_data                    
                type: 'get'
                dataType: 'jsonp'
                crossDomain: true
            )
            .success(@initializeMovies)
            .fail(@handleError)




window.application ||= {}

jQuery('[data-widget=movie-index]').each ->
    movieIndex = new MovieIndex this
    id = jQuery(this).attr('id')
    window.application[id] = movieIndex
