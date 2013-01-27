require 'digest/sha3'

class Session
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :token

  belongs_to :user

  after_create :generate_token

  class << self
    def authenticate email, password
      user = User.where(email: email).first
      user = User.where(email: email, password_digest: User.digest_password("#{password}#{user.created_at}")).first if user
      Session.create(user_id: user.id) if user
    end 
  end

  def generate_token
    self.token = Digest::SHA3.hexdigest("#{self.created_at}#{user.id}")
    save
  end
end
