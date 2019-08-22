class ApplicationController < Sinatra::Base
    
    configure do
      set :public_folder, 'public'
      set :views, 'app/views' 
      enable :sessions
      # set :session_secret, 'password_security'
    end
  
    get '/' do
      erb :'peaks/index'
    end

    helpers do
        
      def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find_by(id: session[:user_id])
      end

      def authenticate
         if !logged_in?
           redirect '/login'
         end
      end
      
  end

end

