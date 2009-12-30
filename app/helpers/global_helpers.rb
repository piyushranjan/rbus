module Merb
  module GlobalHelpers
    # helpers defined here available to all views.  
    def show_rocket?
      request.route.to_s == "/" and ((session.user and session.user.trips.blank?) or (not session.user))
    end

    def twitter_widget
    "<script src=\"http://widgets.twimg.com/j/2/widget.js\"></script>
       <script>
         new TWTR.Widget({
         version: 2,
         type: 'profile',
         rpp: 4,
         interval: 6000,
         width: 250,
         height: 300,
         theme: {
           shell: {
             background: '#333333',
             color: '#ffffff'
           },
           tweets: {
             background: '#000000',
             color: '#ffffff',
             links: '#4aed05'
           }
         },
        features: {
          scrollbar: false,
          loop: false,
          live: false,
          hashtags: true,
          timestamp: true,
          avatars: true,
          behavior: 'all'
        }
      }).render().setUser('rbus_in').start();
    </script>"
  end

  end

end
