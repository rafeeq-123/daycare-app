class ProvidersController < ApplicationController

  get '/providers' do
    @parents = Parent.all
     erb :'providers/index'
  end

    get '/providers/results' do
      @parents = Parent.all
     erb :'providers/results'
  end

end