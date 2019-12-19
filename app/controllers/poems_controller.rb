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
        @poem = current_author.poems.build(poem_params)
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
       if current_author
      @poem = current_author.poems.find_by(id: params[:id])
      if @poem
        erb :edit
       else 
        redirect '/'
       end
      else 
      redirect '/'
       end
    end
    
      patch '/poems/:id' do
        redirect_if_not_logged_in  
        @poem = current_author.poems.find_by(id: params[:id])
        @poem.title = params[:title]
        @poem.description = params[:description]
        @poem.content = params[:content]
        @poem.save
        erb :show
    end
      delete '/poems/:id' do
        redirect_if_not_logged_in 
       if current_author
         @poem = current_author.poems.find_by(id: params[:id])
        if @poem
          @poem.delete
          redirect '/profile'
       else 
        redirect '/'
       end
      else redirect '/'
       end

      end	
      private

      def poem_params
        { title: params[:title], description: params[:description], content: params[:content]}
      end
end