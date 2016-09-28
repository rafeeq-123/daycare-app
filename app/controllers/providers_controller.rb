class ProvidersController < ApplicationController

  get '/providers' do
    binding.pry
    @providers = Provider.all
    "helllllo"
    # erb :'providers/index'
  end

end