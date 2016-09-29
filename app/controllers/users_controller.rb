class UsersController < ApplicationController

  get '/login_parents' do
    erb :'users/login_parents'
  end

  post '/users/login_parents' do
    user = User.create(params)
    session[:id] = user.id
    if user.save
      redirect '/parents'
    else
      redirect '/login_parents'
    end
  end
end