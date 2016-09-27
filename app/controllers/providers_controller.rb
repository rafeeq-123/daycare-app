class ProvidersController < ApplicationController

  get '/providers' do
    @providers = Provider.all
    erb :'providers/index'
  end
end