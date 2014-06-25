class CreateJumps < ActiveRecord::Migration
  def change
    create_table :jumps do |t|
      t.string  :current_time,                        :null => false
      t.string  :data_time,                           :null => false
      t.string  :cached_until,                        :null => false
      t.integer :system_id,                           :null => false, :unique=>true
      t.integer :ship_jumps,      :default => 0,      :null => false
      t.integer :eve_api,         :default => 0

      t.timestamps
    end

    add_index :jumps, :system_id
  end
end
