#!/usr/bin/ruby

require 'active_record'
require 'xml'

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql2',
  :encoding => 'utf8',
  :database => "#{ENV['EVE_DB_NAME']}",
  :username => "#{ENV['EVE_USER_NAME']}",
  :password => "#{ENV['EVE_PASS_WORD']}",
  :socket => '/tmp/mysql.sock',
  :pool => 5,
  :reconnect => true
)


class Jump < ActiveRecord::Base
end

class Kill < ActiveRecord::Base
end



# # load the JUMPS XML
# xml = File.read("/Users/nowak/Desktop/jumps-2014-06-25-065155.xml")
# parser, parser.string = XML::Parser.new, xml

# # get the root of the XML
# doc = parser.parse
# root = doc.root

# # find the tags and get the content
# eve_version  = root.attributes[:version]
# current_time = root.find_first('currentTime').content
# cached_until = root.find_first('cachedUntil').content
# data_time    = root.find_first('./result/dataTime').content
# row_set      = root.find('./result/rowset/row')

def load_raw_data(file_url)
    xml = File.read(file_url)
    parser, parser.string = XML::Parser.new, xml

    # get the root of the XML
    doc = parser.parse
    root = doc.root

    data = Hash.new

    # find the tags and get the content
    eve_version  = root.attributes[:version]
    current_time = root.find_first('currentTime').content
    cached_until = root.find_first('cachedUntil').content
    data_time    = root.find_first('./result/dataTime').content
    row_set      = root.find('./result/rowset/row')

    data["version"] = eve_version.to_i
    data["current_time"] = current_time
    data["cached_until"] = cached_until
    data["data_time"] = data_time
    data["row_set"] = row_set

    return data
end

def create_jump_data(data)
    # iterate across the row-set and find or create a Jump record
    data["row_set"].each { |row|
      system_id = row.attributes[:solarSystemID]
      num_jumps = row.attributes[:shipJumps]

      record = Jump.where(:system_id=>system_id.to_i,
                              :ship_jumps=>num_jumps.to_i,
                              :eve_api=>data["eve_version"],
                              :current_time=>data["current_time"],
                              :data_time=>data["data_time"],
                              :cached_until=>data["cached_until"]).first_or_create

    }
end

def create_kill_data(data)
    data["row_set"].each { |row|
        system_id     = row.attributes[:solarSystemID]
        ship_kills    = row.attributes[:shipKills]
        faction_kills = row.attributes[:factionKills]
        pod_kills     = row.attributes[:podKills]

        record = Kill.where(:system_id=>system_id.to_i,
                                :eve_api=>data["eve_version"],
                                :current_time=>data["current_time"],
                                :data_time=>data["data_time"],
                                :cached_until=>data["cached_until"],
                                :ship=>ship_kills.to_i,
                                :faction=>faction_kills.to_i,
                                :pod=>pod_kills.to_i).first_or_create

        }
end


file_url = "/Users/nowak/Desktop/jumps-2014-06-25-065155.xml"
data = load_raw_data(file_url)
puts data
create_jump_data(data)

