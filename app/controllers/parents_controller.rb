require 'rack-flash'
class ParentsController < ApplicationController
   use Rack::Flash

  get '/parents' do
      @parents = Parent.all
      erb :'parents/index'
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
    if @parent.user_id != current_user.id
      error_message
      redirect '/login_parents'
    else
       erb :"parents/show"
    end
  end

  post '/parents' do
    user = User.find(current_user.id)
    parent = Parent.create(params)
    parent.user_id = user.id
    if parent.save
      flash[:success] = "Your request has been processed and is pending..."
      redirect "/parents/#{parent.id}"
    else
      error_message
      redirect '/parents/new'
    end

  end

  get '/parents/:id/edit' do
    parent_find_by_params
    erb :'parents/edit'
  end

  patch '/parents/:id' do
    parent_find_by_params
    parent = Parent.update(child_name: params[:child_name], schedule: params[:schedule])
    update_message
  end

  delete '/parents/:id/delete' do
    parent_find_by_params
    parent.destroy
    update_message
    redirect '/parents'
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


end




