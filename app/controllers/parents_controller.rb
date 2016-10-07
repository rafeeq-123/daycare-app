require 'rack-flash'
class ParentsController < ApplicationController
  enable :sessions
   use Rack::Flash
#go to the route
  get '/parents' do
    if logged_in?
      @parents = Parent.all
      erb :'parents/index'
    end
  end

  get '/parents/new' do
    if logged_in?
       erb :'parents/new'
    end
  end

  get '/parents/about' do
    erb :'parents/about'
  end

   get '/parents/contact' do
    erb :'parents/contact'
  end

  get '/parents/location' do
    erb :'parents/location'
  end

  get '/parents/:id' do
    parent_find_by_params
    if @parent.user_id != current_user_and_id
       error_message
       redirect '/login_parents'
    else
       erb :"parents/show"
    end
  end

  post '/parents' do
    user = User.find(current_user_and_id)
    parent = Parent.create(params)
    parent.user_id = user.id
    if parent.save
      update_message
      redirect "/parents/#{parent.id}"
    else
      error_message
      redirect '/parents/new'
    end
  end

  get '/parents/:id/edit' do
    if logged_in?
      parent_find_by_params
      erb :'parents/edit'
    end
  end

  patch '/parents/:id' do
    parent_find_by_params
    parent = Parent.update(child_name: params[:child_name], schedule: params[:schedule])
    erb :"parents/show"
  end

  delete '/parents/:id/delete' do
    if logged_in?
      parent_find_by_params
      @parent.destroy
      update_message
      redirect '/parents'
    end
  end

private

  def error_message
    flash[:error] = "Please try again! Your submission was not successfull"
  end

  def update_message
    flash[:success] = "Your request has been updated"
  end

  def parent_find_by_params
    @parent = Parent.find(params[:id])
  end

  def current_user_and_id
    current_user.id
  end

end