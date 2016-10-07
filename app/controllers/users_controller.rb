require 'rack-flash'
class UsersController < ApplicationController
   enable :sessions
   use Rack::Flash


  get '/signup' do
    erb :"users/signup"
  end

  post '/users/signup' do
     user = User.create(params)
    if user.valid?
       session[:user_id] = user.id
       redirect '/login_parents'
    else
      flash[:error] = "username must be unique"
      redirect "/signup"
    end
  end

  get '/login_parents' do
    erb :'users/login_parents'
  end

  post '/users/login_parents' do
    user = User.find_by(:username => params[:username])
    user && user.authenticate(params[:password])
    flash[:success] = "YOU ARE NOW LOGGED IN"
    redirect '/parents'
  end

  get '/logout' do
    if logged_in?
       session.clear
       redirect to '/login_parents'
    else
      redirect '/'
     end
  end
end