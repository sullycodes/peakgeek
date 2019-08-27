class PeaksController < ApplicationController

    get '/peaks' do
        authenticate
        @user = current_user
        @peaks = @user.peaks
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
                content: params[:content],
                user: @user
            )
            redirect to "/peaks/#{@peak.id}"
        else
            @failed = true
            erb :'peaks/new'
        end
    end

    get '/peaks/:id' do
        authenticate
        @user = current_user
        @peak = Peak.find(params[:id])
        if @user.id == @peak.user_id
            erb :'peaks/show'
        else
            erb :'sessions/unauthorized'
        end
    end

    get '/peaks/:id/edit' do
        authenticate
        @user = current_user
        @peak = Peak.find(params[:id])
        if @user.id == @peak.user_id
            erb :'peaks/edit'
        else
            erb :'sessions/unauthorized'
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
            erb :'peaks/show'
        else
            @peak = Peak.find(params[:id])
            @failed = true
            # redirect "peaks/#{params[:id]}/edit"
            erb :'peaks/edit'
        end 
    end

    delete '/peaks/:id/delete' do
        authenticate
        @peak = Peak.find(params[:id])
        if @peak.user_id == current_user.id
            @peak.delete
            redirect '/peaks'
        else
            erb :'sessions/unauthorized'
        end
      end

end




