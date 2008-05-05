class User < ActiveRecord::Base
  has_many :trades
  has_many :items
  has_many :live_searches
end
