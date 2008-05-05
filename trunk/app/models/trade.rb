class Trade < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
end
