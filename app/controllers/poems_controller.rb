class PoemsController < ApplicationController
    get '/poems' do 
        redirect_if_not_logged_in
    @poems = current_author.poems

        erb :index
    end 
    
    get '/poems/new' do
    erb :new
    end
    post '/poems' do
        redirect_if_not_logged_in
    poem = Poem.new(poem_params)
    if poem.save
      redirect '/profile'
    else
      @errors = [params.to_s]
      erb :failure
    end
  end
#    get '/poems/profile' do
#         @author = Author.find(session[:author_id])
#         erb :profile
#     end
    get '/poems/:id/edit' do
        redirect_if_not_logged_in
        set_poem
        erb :edit
      end
    
      patch '/poems/:id' do
        redirect_if_not_logged_in
        set_poem
        if @poem.update(poem_params)
          redirect '/poems'
        else
          @errors = ['could not update']
          erb :failures
        end
      end
      private

      def poem_params
        { title: params[:title], description: params[:description], content: params[:content]}
      end
end