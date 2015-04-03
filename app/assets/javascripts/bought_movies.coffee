
window.application ||= {}
window.application.boughtMovies = []

##
# Preload a list of all bought movies.
##
populateList = (data) ->
    window.application.boughtMovies = jQuery.map(data, (element, i)-> element.movie_id)    

handleError = (data) ->
    #new Flash "There's been an error.", 'error'

jQuery
    .get("/bought_movies.json", {}, async:false, dataType:'json')
    .success(populateList)
    .fail(handleError)
