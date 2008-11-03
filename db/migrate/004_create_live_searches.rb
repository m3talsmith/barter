class CreateLiveSearches < ActiveRecord::Migration
  def self.up
    create_table :live_searches do |t|
      t.integer     :user_id
      t.text        :query
      t.timestamps
    end
  end

  def self.down
    drop_table :live_searches
  end
end
