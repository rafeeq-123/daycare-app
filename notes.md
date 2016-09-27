kid
  name
  age
  parent_id(belongs_to :parent)



parent
  name
  special_requests

  has_many :kids
  provider_id


provider
  company
  amount_of_kids_allowed
  has_many :parents
  has_many kids:, through: :parents



user
  username
  name
  password



  class ParentsController < ApplicationController


    get '/parents' do
        @parents = Parent.all
        erb :index
    end

    get '/parents/new' do
        erb :'/parents/new'
    end

    post '/parents' do
        # params  = {name: 'Johnny Walker', special_request: 'Needs fresh milk every hour', childs_name: 'Obama', childs_age: 3, schedule: 'Mon-Fri: 8am - 3pm'}
        parent = current_user.parents.build(params)
        if parent.save
            redirect to '/parents/#{parent.id}'
        else
            redirect to '/parents/new'
        end
    end

    get '/parents/:id' do
        @parent = Parent.find_by_id(params[:id])
        if @parent
            erb :'/parents/show'
        else
            erb :'/parents'
        end
    end

end
