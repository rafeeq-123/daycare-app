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

  post '/parents' do
    @parent = Parent.create!(params[:name])
   if @parent.valid?
      @parent.save
      flash[:success] = "You have successfully created an account"
      redirect "/"
  else
      flash[:error] = "Something went wrong. Please try again!"
      redirect "new"
    end

  end


end