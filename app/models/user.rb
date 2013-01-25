class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email
  field :nickname

  has_many :sessions
end
