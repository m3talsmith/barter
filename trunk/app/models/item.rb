class Item < ActiveRecord::Base
  belongs_to  :user
  
  has_many    :trade_items
end
