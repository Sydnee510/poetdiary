class AuthorsController < ApplicationController
    get '/signup' do 
        erb :signup 
    end 
    post '/signup' do
      @author = Author.new(author_params)
      if @author.save
        redirect '/'
      else
        @errors = ["Enter a valid username and password to signup!"]
        erb :failure
      end
    end
    get '/profile' do
        redirect_if_not_logged_in
        @author = Author.find(session[:author_id])  
        erb :profile
    end
    get '/login' do 
        erb :login 
    end 
    post '/login' do 
        @author = Author.find_by(username: params[:username])

        if @author && @author.authenticate(params[:password])
        session[:author_id] = @author.id
        redirect '/profile'
        else 
        @errors = ["Enter a valid username and password to Login your account!"]  
        erb :failure
        end
    end 
    get '/signout' do 
        redirect_if_not_logged_in
        session.clear 
        redirect '/'
    end
   
    private 
    def author_params
      { username: params[:username], password: params[:password] }
    end
    
end 