class ApplicationController < Sinatra::Base
    configure do 
        set :views, 'app/views'
        set :public_folder, 'public/bootstrap-4.4.1-dist'
        enable :sessions
        set :session_secret, "password_security"
    end
    get '/' do 
        erb :index
    end 
    get '/failure' do
        erb :failure 
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
end 