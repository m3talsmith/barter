class CreateTradeItems < ActiveRecord::Migration
  def self.up
    create_table :trade_items do |t|
      t.integer     :trade_id, :item_id, :user_id, :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :trade_items
  end
end
