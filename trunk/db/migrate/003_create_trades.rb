class CreateTrades < ActiveRecord::Migration
  def self.up
    create_table :trades do |t|
      t.integer     :user_id, :status_id
      t.timestamps
    end
  end

  def self.down
    drop_table :trades
  end
end
