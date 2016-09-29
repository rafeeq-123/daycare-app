require 'rack-flash'
class ParentsController < ApplicationController
   use Rack::Flash

  get '/parents' do
    @parents = Parent.all
    erb :'parents/index'
  end

  get '/parents/new' do
    erb :'parents/new'
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
    @parent = Parent.find(params[:id])
    erb :"parents/show"
  end

  post '/parents' do
    parent = Parent.create(params)
    if parent.save
      flash[:success] = "Your request has been processed and is pending..."
      redirect "/parents/#{parent.id}"
    else
      flash[:error] = "Your request was not processed please be sure to fill out all of the form"
      redirect '/parents/new'
    end

  end

  get '/parents/:id/edit' do
    @parent = Parent.find(params[:id])
    erb :'parents/edit'
  end

  patch '/parents/:id' do
   # binding.pry
    parent = Parent.find(params[:id])
    parent = Parent.update(child_name: params[:child_name], schedule: params[:schedule])
    flash[:success] = "Your request has been updated, PUTO!!"
    # redirect "/parents/:id/edit"
    # else
    #   redirect "/parents/#{@parent.id}"
    #   end
    end

  delete '/parents/:id/delete' do
    parent = Parent.find(params[:id])
    parent = Parent.update(child_name: params[:child_name], schedule: params[:schedule])
    parent.destroy
    redirect "/parents"
  end


end


