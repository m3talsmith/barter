class Status < ActiveRecord::Base
  has_many :trades
end
