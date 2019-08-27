class ApplicationController < Sinatra::Base
    
    configure do
      set :public_folder, 'public'
      set :views, 'app/views' 
      enable :sessions
      set :session_secret, SESSION_SECRET 
    end
  
    get '/' do
      if logged_in?
        redirect '/peaks'
      else
        redirect '/login'
      end
    end

    not_found do
      status 404
      erb :error
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
      
      def cap_all_words(string)
        string.split(" ").map do |w|
          w.capitalize
        end.join(" ").to_s
      end

      def fields_not_empty?
        !params[:name].empty? && !params[:location].empty? && !params[:elevation].empty? && !params[:content].empty?
      end
  
  end

end

