class Kill < ActiveRecord::Base

  attr_accessible :system_id,
                  :ship,
                  :faction,
                  :pod
end