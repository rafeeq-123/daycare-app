class UsersController < ApplicationController
  get '/login_parents' do
    erb :'users/login_parents'
  end
end