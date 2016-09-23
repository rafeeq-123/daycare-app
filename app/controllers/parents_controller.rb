class ParentsController < ApplicationController

  get '/' do
    @parents = Parent.all
    erb :'parents/index'
  end

  get '/parents/new' do
    @parent = Parent.new
    if @parent.valid?
      redirect :'parent/show'
    else
      redirect :"parent/index"
    end
  end

  get '/parents/:id' do
    @parent = Parent.find(params[:id])
    erb :'parent/show'
  end

end