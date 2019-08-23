class SessionsController < ApplicationController

    get '/login' do
        redirect '/peaks' if logged_in?
        @failed = false
        erb :'sessions/login'
    end

    post '/login' do    
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password]) 
               session[:user_id] = @user.id
               redirect '/peaks'
        else
            @failed = true
            erb :'sessions/login'
        end
    end

    get '/signup' do
        redirect '/peaks' if logged_in?
        session.clear
        erb :'sessions/signup'
    end

    post '/signup' do
        @user = User.create(
            name: params[:name],
            username: params[:username], 
            password: params[:password], 
            )
        session[:user_id] = @user.id
        redirect '/peaks/new'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end