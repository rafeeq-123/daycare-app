class ParentsController < ApplicationController

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

  get "/parents/:id/edit" do
    @parent = Parent.find(params[:id])
    erb :"parents/edit"
  end

  post '/parents' do
    parent = Parent.create(params)
   # binding.pry
    if parent.save
       redirect "/parents/#{parent.id}"
    else
      redirect '/parents/new'
    end

  end

  get '/parents/:id' do
    @parent = Parent.find(params[:id])
      erb :"parents/show"
  end


end

