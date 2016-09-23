class ParentsController < ApplicationController

  get '/' do
    @parents = Parent.all
    erb :'parents/index'
  end

  get '/parents/new' do
    erb :'parents/new'
  end

  get '/parents/:id' do
    @parent = Parent.find(params[:id])
    erb :'parent/show'
  end

end