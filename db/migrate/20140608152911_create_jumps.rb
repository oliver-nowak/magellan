class CreateJumps < ActiveRecord::Migration
  def change
    create_table :jumps do |t|
      t.timestamps :current_time
      t.timestamps :data_time
      t.timestamps :cached_until,                     :unique => true
      t.integer :system_id,                           :null => false
      t.integer :ship_jumps,      :default => 0,      :null => false
      t.integer :eve_api,         :default => 0

      t.timestamps
    end

    add_index :jumps, :cached_until
  end
end
