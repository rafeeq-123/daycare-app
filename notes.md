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