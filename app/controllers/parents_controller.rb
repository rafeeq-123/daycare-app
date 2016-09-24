class ParentsController < ApplicationController

  get '/' do
    @parents = Parent.all
    erb :'parents/index'
  end

  post '/parents/:id' do
    @parent = Parent.find(params[:id])
      erb :'parents/show'
      puts params.to_s
  end

  get '/parents/new' do
    erb :'parents/new'
  end

  post '/parents' do
    @parent = Parent.create(params[:name][:special_requests])

   if @parent.valid?
      @parent.save
      flash[:success] = "You have successfully created an account"
      redirect 'parents/show'
  else
      flash[:error] = "Something went wrong. Please try again!"
      redirect '/parents/new'
    end
  end


end