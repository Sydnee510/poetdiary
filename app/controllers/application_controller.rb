#require "./config/environment"
#require 'byebug'
class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "password_security"
    end
    get '/' do 
        erb :index
    end 
    get '/failure' do
        erb :failure 
    end 
    get '/signup' do 
        erb :signup 
    end 
    # post '/signup' do
    #     @author = Author.new(username: params[:username], password: params[:password])
    #     @author.save

    #     if params[:username] == "" || params[:password] == ""
    #     redirect '/failure'
    #   else
    #      redirect '/login'
    #   end
    # end 
    post '/signup' do
      @author = Author.new(author_params)
      if @author.save
        redirect '/'
      else
        #@errors = ["Signup failed"]
        erb :failure
      end
    end
    get '/profile' do
        @author = Author.find(session[:author_id])
       # @poem.author = Author.create(username: params[:username], password: params[:password_digest])
        # @poem.save
       # @poem.save
        @poem = Poem.all
      
        erb :profile
    end
    # get '/show' do 
    #   erb :show 
    # end 
    get '/login' do 
        erb :login 
    end 
    post '/login' do 
        @author = Author.find_by(username: params[:username])

        if @author && @author.authenticate(params[:password])
        session[:author_id] = @author.id
        redirect '/profile'
        else 
        redirect '/failure'
      end
    end 
    get '/signout' do 
        session.clear 
        redirect '/'
    end
   

  helpers do
    def logged_in?
      !!session[:author_id]
    end
    def redirect_if_not_logged_in
        unless logged_in?
          redirect '/login'
        end
      end

    def current_author
      Author.find(session[:author_id])
    end
  end
    private 
    def author_params
      { username: params[:username], password: params[:password] }
  end
    
end 