class KillService < DataService

    class Kill < ActiveRecord::Base
    end

    def create_records(row_set)
        # iterate across the row-set and find or create a Jump record
        row_set.each { |row|
        system_id = row.attributes[:solarSystemID]
        num_jumps = row.attributes[:shipJumps]

        record = Kill.where(:system_id=>system_id.to_i,
                                :eve_api=>eve_version.to_i,
                                :current_time=>current_time,
                                :data_time=>data_time,
                                :cached_until=>cached_until,
                                :ship=>ship_kills.to_i,
                                :faction=>faction_kills.to_i,
                                :pod=>pod_kills.to_i).first_or_create

        }
    end
end