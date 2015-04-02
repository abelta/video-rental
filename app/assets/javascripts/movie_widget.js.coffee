class MovieWidget


    constructor: (@data, template) ->
        template ||= Handlebars.compile( jQuery('#movie_widget_template').html() )
        @dom = jQuery(template(@data))

        jQuery(@dom).find('.show_login_button').one('click', @showLoginAdvertise)
        jQuery(@dom).find('.buy_movie_button').click(@buy)

    
    showLoginAdvertise: =>
        jQuery(@dom).find('.login_advertise').slideDown('fast')


    buy: (ev) =>
        handleError = (data) ->
            new Flash "There's been an error.", 'error'
        handleSuccess = (data) =>
            window.application.boughtMovies.push(@data.id)
            jQuery(ev.currentTarget).attr('disabled', 'disabled').text("IN LIBRARY")
            new Flash "Movie added to collection", 'notice'
        movie_data = 
            movie:
                movie_id: @data.id
                title: @data.title
                poster_url: @data.posters.thumbnail
        jQuery
            .post('/movies/buy', movie_data)
            .success(handleSuccess)
            .fail(handleError)




window.application ||= {}
window.application.MovieWidget = MovieWidget
