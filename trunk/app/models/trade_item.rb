class TradeItem < ActiveRecord::Base
  belongs_to  :trade
  belongs_to  :item
  belongs_to  :user
end
