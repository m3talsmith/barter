require 'digest/sha3'

class Session
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :token

  belongs_to :user

  after_create :generate_token

  def generate_token
    self.token = Digest::SHA3.hexdigest("#{self.created_at}#{user.id}")
    save
  end
end
