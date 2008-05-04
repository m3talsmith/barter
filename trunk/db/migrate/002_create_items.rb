class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string      :name
      t.text        :description
      t.boolean     :is_service, :is_good
      t.integer     :user_id, :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
