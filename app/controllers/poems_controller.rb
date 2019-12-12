class PoemsController < ApplicationController
    get '/poems' do 
       # redirect_if_not_logged_in
        @poems = Poem.all
        erb :index
    end 
    
    get '/poems/new' do
        erb :new
    end
    post '/poems' do
        redirect_if_not_logged_in
        @poem = Poem.create(poem_params)
        @poem.author = Author.find(session[:author_id])
        @poem.save
        erb :show
        #  else 
        #   poem_params.nil? || poem_params.empty?
        #   erb :failure
        #  end
          # if poem_params.empty?
          #   redirect '/failure'
          # end
    end
    get '/poems/:id' do
      @poem = Poem.find(params[:id])
      erb :show
    end
    get '/poems/:id/edit' do
      redirect_if_not_logged_in
      @poem = Poem.find(params[:id])
      erb :edit
      end
    
      patch '/poems/:id' do
        redirect_if_not_logged_in
        @poem = Poem.find(params[:id])
        @poem.title = params[:title]
        @poem.description = params[:description]
        @poem.content = params[:content]
        @poem.save
        erb :show
      end
      delete '/poems/:id' do
        redirect_if_not_logged_in
        @poem = Poem.destroy(params[:id])
        redirect '/profile'
      end	
      private

      def poem_params
        { title: params[:title], description: params[:description], content: params[:content]}
      end
end