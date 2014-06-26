class AddKillsModel < ActiveRecord::Migration
  def change
    create_table :kills do |t|
      t.string  :current_time,  :null => false
      t.string  :data_time,     :null => false
      t.string  :cached_until,  :null => false
      t.integer :system_id,     :null => false
      t.integer :ship
      t.integer :faction
      t.integer :pod
      t.integer :eve_api,       :default => 0

      t.timestamps
    end
  end
end
