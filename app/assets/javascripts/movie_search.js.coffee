class MovieSearch


    constructor: (@dom) ->
        handleKeyup = (ev) =>
            do @submit if ev.keyCode == 13
        jQuery(@dom).keyup(handleKeyup)
        @movieIndex = window.application[jQuery(@dom).data('target')]


    submit: ->
        q = jQuery(@dom).val()
        jQuery(@dom).val('')
        @movieIndex.search q





jQuery('[data-widget=movie-search]').each ->
    movieSearch = new MovieSearch this
    id = jQuery(this).attr('id')
    window.application[id] = movieSearch
