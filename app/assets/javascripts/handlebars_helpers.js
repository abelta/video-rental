Handlebars.registerHelper('ifInBoughtList', function(elem, options) {
  if(window.application.boughtMovies.indexOf(parseInt(elem)) > -1) {
    return options.fn(this);
  }
  return options.inverse(this);
});
