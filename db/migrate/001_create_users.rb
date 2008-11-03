class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string        :login, :name
      t.text          :password, :description
      t.boolean       :is_active
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
