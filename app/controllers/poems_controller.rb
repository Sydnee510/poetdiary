class PoemsController < ApplicationController
    get '/poems' do 
        redirect_if_not_logged_in
        @poems = Poem.all
        erb :index
    end 
    
    get '/poems/new' do
        redirect_if_not_logged_in
        erb :new
    end
    post '/poems' do
        redirect_if_not_logged_in
        @poem = Poem.create(poem_params)
        @poem.author = Author.find(session[:author_id])
        if @poem.save
        erb :show
        else 
          poem_params.nil? || poem_params.empty?
          @errors = ["Each field must be filled in to create a poem. Must have a Title, Description, and Content!"]
          erb :failure
         end
    end
    get '/poems/:id' do
      @poem = Poem.find(params[:id])
      erb :show
    end
    get '/poems/:id/edit' do
      redirect_if_not_logged_in
     # if logged_in?
       # @author = Author.find(session[:author_id])  
      @poem = Poem.find(params[:id])
      #@edit = Poem.where(author_id: current_author)
      erb :edit
      # else 
      #   redirect '/login'
      # end
    end
    
      patch '/poems/:id' do
        redirect_if_not_logged_in
        # if logged_in?
        # @author = Author.find(session[:author_id])
        # @edit = Poem.where(author_id: current_author)  
        @poem = Poem.find(params[:id])
        @poem.title = params[:title]
        @poem.description = params[:description]
        @poem.content = params[:content]
        @poem.save
        erb :show
      #   else 
      #     redirect '/login'
      # end
    end
      delete '/poems/:id' do
        redirect_if_not_logged_in
       # @author = Author.find(session[:author_id])  
        @poem = Poem.destroy(params[:id])
        redirect '/profile'
      end	
      private

      def poem_params
        { title: params[:title], description: params[:description], content: params[:content]}
      end
end