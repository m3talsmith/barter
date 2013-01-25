class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email
  field :nickname

  attr_accessor :password, :password_confirmation

  has_many :sessions

  class << self
    def digest_password password
    end
  end
end
