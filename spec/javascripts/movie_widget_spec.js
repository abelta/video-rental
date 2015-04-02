describe("MovieWidget", function(){

    
    beforeEach(function(){
        this.data = {"id":"771312088","title":"The Hunger Games: Mockingjay - Part 1","year":2014,"mpaa_rating":"PG-13","runtime":125,"critics_consensus":"","release_dates":{"theater":"2014-11-21","dvd":"2015-03-06"},"ratings":{"critics_rating":"Fresh","critics_score":65,"audience_rating":"Upright","audience_score":74},"synopsis":"The worldwide phenomenon of The Hunger Games continues to set the world on fire with The Hunger Games: Mockingjay - Part 1, which finds Katniss Everdeen (Jennifer Lawrence) in District 13 after she literally shatters the games forever. Under the leadership of President Coin (Julianne Moore) and the advice of her trusted friends, Katniss spreads her wings as she fights to save Peeta (Josh Hutcherson) and a nation moved by her courage. The Hunger Games: Mockingjay - Part 1 is directed by Francis Lawrence from a screenplay by Danny Strong and Peter Craig and produced by Nina Jacobson's Color Force in tandem with producer Jon Kilik. The novel on which the film is based is the third in a trilogy written by Suzanne Collins that has over 65 million copies in print in the U.S. alone. (c) Lionsgate","posters":{"thumbnail":"http://resizing.flixster.com/o5LFh1rOsPGEtzQEDloy-4HQsjE=/54x81/dkpu1ddg7pbsk.cloudfront.net/movie/11/18/98/11189899_ori.jpg","profile":"http://resizing.flixster.com/o5LFh1rOsPGEtzQEDloy-4HQsjE=/54x81/dkpu1ddg7pbsk.cloudfront.net/movie/11/18/98/11189899_ori.jpg","detailed":"http://resizing.flixster.com/o5LFh1rOsPGEtzQEDloy-4HQsjE=/54x81/dkpu1ddg7pbsk.cloudfront.net/movie/11/18/98/11189899_ori.jpg","original":"http://resizing.flixster.com/o5LFh1rOsPGEtzQEDloy-4HQsjE=/54x81/dkpu1ddg7pbsk.cloudfront.net/movie/11/18/98/11189899_ori.jpg"},"abridged_cast":[{"name":"Jennifer Lawrence","id":"770800260","characters":["Katniss Everdeen"]},{"name":"Liam Hemsworth","id":"770833479","characters":["Gale Hawthorne"]},{"name":"Josh Hutcherson","id":"162654356","characters":["Peeta Mellark"]},{"name":"Julianne Moore","id":"162654248","characters":["President Alma Coin"]},{"name":"Sam Claflin","id":"771073196","characters":["Finnick"]}],"alternate_ids":{"imdb":"1951265"},"links":{"self":"http://api.rottentomatoes.com/api/public/v1.0/movies/771312088.json","alternate":"http://www.rottentomatoes.com/m/the_hunger_games_mockingjay_part_1/","cast":"http://api.rottentomatoes.com/api/public/v1.0/movies/771312088/cast.json","reviews":"http://api.rottentomatoes.com/api/public/v1.0/movies/771312088/reviews.json","similar":"http://api.rottentomatoes.com/api/public/v1.0/movies/771312088/similar.json"}}
        this.loggedOuttemplate = Handlebars.compile(
          '<article class="movie_widget row" data-widget="movie-widget">' +
            '<div class="four columns">' +
              '<header>{{title}}</header>' +
              '<img src="{{posters.thumbnail}}" alt="{{title}}"/>' +
            '</div>' +
            '<aside class="details eight columns">' +
              '<p class="year">Year: {{year}}</p>' +
              '<p class="rating">Rating: {{mpaa_rating}}</p>' +
              '<p class="runtime">Runtime: {{runtime}} minutes</p>' +
              '<p class="synopsis">{{synopsis}}</p>' +
              
              '<button class="show_login_button button-primary">BUY</button>' +
              '<aside class="login_advertise" style="display:none">' +
                'You have to <a href="/users/sign_in">login</a> to buy movies.' +
              '</aside>' +
              
            '</aside>' +
          '</article>'
        );
        this.loggedIntemplate = Handlebars.compile(
          '<article class="movie_widget row" data-widget="movie-widget">' +
            '<div class="four columns">' +
              '<header>{{title}}</header>' +
              '<img src="{{posters.thumbnail}}" alt="{{title}}"/>' +
            '</div>' +
            '<aside class="details eight columns">' +
              '<p class="year">Year: {{year}}</p>' +
              '<p class="rating">Rating: {{mpaa_rating}}</p>' +
              '<p class="runtime">Runtime: {{runtime}} minutes</p>' +
              '<p class="synopsis">{{synopsis}}</p>' +
              
              '<button class="buy_movie_button button-primary">BUY</button>' +
              
            '</aside>' +
          '</article>'
        );
    });


    it("has a @dom attribute", function(){
        movieWidget = new window.application.MovieWidget(this.data, this.loggedIntemplate);
        expect(movieWidget.dom).toBeDefined();
    });


    it("has a @data attribute", function(){
        movieWidget = new window.application.MovieWidget(this.data, this.loggedIntemplate);
        expect(movieWidget.data).toBeDefined();
    });


    describe("user is logged in", function(){

        beforeEach(function(){
            movieWidget = new window.application.MovieWidget(this.data, this.loggedIntemplate);
        });

        it("has a buy movie button", function(){
            console.log('dom', movieWidget.dom);
            expect( jQuery(movieWidget.dom).find('.buy_movie_button').length ).toBeGreaterThan(0);
        });

        describe("buy movie button", function(){

            it("performs buy action when clicked");

        });
    });


    describe("user is not logged in", function(){

        beforeEach(function(){
            movieWidget = new window.application.MovieWidget(this.data, this.loggedOuttemplate);
        });

        it("has a login advertise button", function(){
            expect( jQuery(movieWidget.dom).find('.show_login_button').length ).toBeGreaterThan(0);            
        });

        describe("login advertise button", function(){

            it("has a hidden login message", function(){
                message = jQuery(movieWidget.dom).find('.login_advertise');
                expect( message.length ).toEqual(1);
                expect( message.is(':hidden') ).toBeTruthy()
            });

            it("shows a login advertise message when clicked", function(){
                message = jQuery(movieWidget.dom).find('.login_advertise');
                button = jQuery(movieWidget.dom).find('.show_login_button');
                button.click();
                expect( message.is(':animated') ).toBeTruthy()
            });

        });

    });


});