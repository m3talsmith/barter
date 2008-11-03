class Trade < ActiveRecord::Base
  belongs_to  :sender,
              :class_name => "User"
  
  belongs_to  :recipient,
              :class_name => "User"
              
  belongs_to  :status
  
  has_many    :trade_items
end
