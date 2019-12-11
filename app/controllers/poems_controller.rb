class PoemsController < ApplicationController
    get '/poems' do 
       # redirect_if_not_logged_in
        @poems = Poem.all
       # @poems = current_author.poems
        erb :index
    end 
    
    get '/poems/new' do
        erb :new
    end
    post '/poems' do
        redirect_if_not_logged_in
        @poem = Poem.create(poem_params)
        # @poem.author = Author.create(username: params[:username], password: params[:password_digest])
        # @poem.save
        #redirect '/profile'
        #redirect '/poems/#{@poem.id}'
        erb :show
    #     poem = Poem.new(poem_params)
    #     if poem.save
    #         redirect '/profile'
    #         #'/poems/#{@poem.id}'
    #     else
    #   @errors = [params.to_s]
    #   erb :failure
    # end
  end
#    get '/poems/profile' do
#         @author = Author.find(session[:author_id])
#         erb :profile
#     end
    get '/poems/:id' do
      @poem = Poem.find(params[:id])
      erb :show
    end
    get '/poems/:id/edit' do
      redirect_if_not_logged_in
      @poem = Poem.find(params[:id])
        #set_poem
      erb :edit
      end
    
      patch '/poems/:id' do
        redirect_if_not_logged_in
        @poem = Poem.find(params[:id])
        @poem.title = params[:title]
        @poem.description = params[:description]
        @poem.content = params[:content]
        @poem.save
        redirect 'poems/#{@poem.id}'
        # set_poem
        # if @poem.update(poem_params)
        #   redirect '/poems'
        # else
        #   @errors = ['could not update']
        #   erb :failure
        # end
      end
      delete '/poems/:id' do
        @poem = Poem.destroy(params[:id])
      end	
      private

      def poem_params
        { title: params[:title], description: params[:description], content: params[:content]}
      end
end