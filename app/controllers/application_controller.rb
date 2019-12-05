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
    
end 