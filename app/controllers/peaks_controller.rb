class PeaksController < ApplicationController

    get '/peaks' do
        authenticate
        @user = current_user
        @peaks = Peak.all
        erb :'peaks/index'
    end 

    get '/peaks/new' do
        @failed = false
        erb :'peaks/new'
    end

    post '/peaks' do
        if fields_not_empty?
            @user = current_user
            @peak = Peak.create(
                name: params[:name], 
                location: params[:location], 
                elevation: params[:elevation], 
                content: params[:content]
            )
            redirect to "/peaks/#{@peak.id}"
        else
            @failed = true
            erb :'peaks/new'
        end
    end

    get '/peaks/:id' do
        if logged_in?
            @user = current_user
            @peak = Peak.find(params[:id])
            erb :'peaks/show'
        else
            redirect '/login'
        end
    end

    get '/peaks/:id/edit' do
        if logged_in?
            @peak = Peak.find(params[:id])
            erb :'peaks/edit'
        else
            redirect '/login'
        end
    end

    patch '/peaks/:id' do
        if fields_not_empty?
            @user = current_user
            @peak = Peak.find(params[:id])
            @peak.update(
                name: params[:name], 
                location: params[:location], 
                elevation: params[:elevation], 
                content: params[:content]
            )
            @peak.save
            erb :'peaks/show'
        else
            redirect '/peaks/:id/edit'
        end 
    end

    delete '/peaks/:id/delete' do
        if logged_in?
          @peak = Peak.find(params[:id])
          if @peak.user_id == current_user.id
            @peak.delete
          end
        else
          redirect 'login'
        end
      end

end




