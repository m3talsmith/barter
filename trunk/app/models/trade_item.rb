class TradeItem < ActiveRecord::Base
  belongs_to  :trade, :item, :user
end
