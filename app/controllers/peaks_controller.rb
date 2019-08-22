class PeaksController < ApplicationController

    get '/peaks' do
        # authenticate
        @user = User.find_by(params[:user_id])
        @peaks = Peak.all
        erb :'peaks/index'
    end

    get '/peaks/new' do
        erb :'peaks/new'
    end

    post '/peaks' do
        @user = User.find_by(params[:user_id])
        @peak = Peak.create(
            name: params[:name], 
            location: params[:location], 
            elevation: params[:elevation], 
            # difficulty: params[:difficulty],
            content: params[:content]
            )
        # @user.peaks << peak
        redirect to "/peaks/#{@peak.id}"
    end

    get '/peaks/:id' do
        @user = User.find_by(params[:user_id])
        erb :'peaks/show'
    end

    # get 'peaks/:id/edit' do
    #     erb :'peaks/edit'
    # end

    # patch 'peaks/:id' do
    # end

    # delete 'peaks/:id' do
    # end


    # PATCH	'/peaks/:id'	update action	modifies an existing article based on ID in the url
    # PUT	'/peaks/:id'	update action	replaces an existing article based on ID in the url

end




