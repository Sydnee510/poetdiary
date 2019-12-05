require "./config/environment"
class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ""
    end
    get '/' do 
        erb :index
    end 
    get '/failure' do
        erb :failure 
    end 
    get '/login' do 
        erb :login 
    end 
    get '/signup' do 
        erb :signup 
    end 
    post "/signup" do
        @user = User.new(:username => params[:username], :password => params[:password])
        @user.save
   
        if params[:username] == "" || params[:password] == ""
        redirect '/failure'
      else
         redirect '/login'
      end
    end
    
end 