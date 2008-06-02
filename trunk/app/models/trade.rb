class Trade < ActiveRecord::Base
  belongs_to  :sender,
              :model_name => "User"
  
  belongs_to  :recipient,
              :model_name => "User"
              
  belongs_to  :status
  
  has_many    :trade_items
end
