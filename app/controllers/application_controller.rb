require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

#recieving post request when user hits login. Finding user based on their username
#session is users ID, redirects them to the account route (redirect to) use ERB to display the user's data on the page 
#grabs users info from the params hash. Is user that is loggin in in the database? matching passwords to see.
  post '/login' do
    @user = User.find_by(:username => params[:username])
       if @user != nil && @user.password == params[:password]
         session[:user_id] = @user.id
         redirect to '/account'
       end
       erb :error
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
       if @current_user
         erb :account
       else
         erb :error
       end
  end

  get '/logout' do
    session.clear
       redirect '/'
     end
end
