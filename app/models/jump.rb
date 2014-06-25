class Jump < ActiveRecord::Base

  attr_accessible :cached_until,
                  :current_time,
                  :data_time,
                  :eve_api,
                  :ship_jumps,
                  :system_id
end
