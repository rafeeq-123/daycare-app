class ProvidersController < ApplicationController

  get '/providers' do
    @providers = Provider.all
     erb :'providers/index'
  end

    get '/providers/results' do
     erb :'providers/results'
  end

end