require 'rack-flash'
class UsersController < ApplicationController
   use Rack::Flash

  get '/login_parents' do
    erb :'users/login_parents'
  end

  post '/users/login_parents' do
    user = User.create(params)
    session[:id] = user.id
    if user.save
       flash[:success] = "YOU ARE NOW LOGGED IN"
       redirect '/parents'
    else
       flash[:error] = "Something went wrong with login"
       redirect '/login_parents'
    end
  end
end