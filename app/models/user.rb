require 'digest/sha3'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email
  field :nickname
  field :password_digest

  attr_accessor :password, :password_confirmation

  validates :password, presence: true, confirmation: true
  validates :email, presence: true

  has_many :sessions

  after_create :digest_password

  class << self
    def digest_password password
      Digest::SHA3.hexdigest password
    end
  end

  def digest_password
    self.password_digest = User.digest_password("#{password}#{created_at}")
    save
  end
end
