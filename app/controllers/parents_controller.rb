class ParentsController < ApplicationController

  get '/parents' do
    @parents = Parent.all
    erb :'parents/index'
  end

  get '/parents/new' do
    erb :'parents/new'
  end


  post '/parents' do
    @parent = Parent.create(params)
    if  @parent.save
        redirect '/parents/#{@parent.id}'
    else
        redirect '/parents/new'
    end
    puts parents
  end

  #   get '/parents/:id' do
  #   @parent = Parent.find_by_id(params[:id])
  #   if @parent
  #      erb :'parents/show'
  #   else
  #      erb :'/parents'
  #   end

  # end
end
