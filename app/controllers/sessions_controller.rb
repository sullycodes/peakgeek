class SessionsController < ApplicationController

    get '/login' do
        redirect '/peaks' if logged_in?
        @failed = false
        erb :'sessions/login'
    end

    post '/login' do    
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password]) #authenticate is method from bcrypt
               session[:user_id] = @user.id
               redirect '/peaks'
        else
            @failed = true
            erb :'sessions/login'
        end
    end
    
    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        @user = User.create(
            name: params[:name],
            username: params[:username], 
            password: params[:password], 
            ability: params[:ability]
            )
        session[:user_id] = @user.id
        redirect '/peaks'   
    end

end