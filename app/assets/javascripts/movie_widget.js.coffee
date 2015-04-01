template = Handlebars.compile( jQuery('#movie_widget_template').html() )

class MovieWidget


    constructor: (@data) ->
        console.log 'MovieWidget-constructor'
        @dom = jQuery(template(@data))
        jQuery(@dom).find('.show_login_button').one('click', @showLoginAdvertise)


    expand: ->
        console.log 'MovieWidget-expand'


    collapse: ->
        console.log 'MovieWidget-collapse'


    showLoginAdvertise: =>
        console.log 'MovieWidget-showLoginAdvertise'
        jQuery(@dom).find('.login_advertise').slideDown('fast')


    buy: ->
        console.log 'MovieWidget-buy'




window.application ||= {}
window.application.MovieWidget = MovieWidget
