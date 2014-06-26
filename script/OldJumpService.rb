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

# load the JUMPS XML
xml = File.read(file_url)
parser, parser.string = XML::Parser.new, xml

# get the root of the XML
doc = parser.parse
root = doc.root

# find the tags and get the content
eve_version  = root.attributes[:version]
current_time = root.find_first('currentTime').content
cached_until = root.find_first('cachedUntil').content
data_time    = root.find_first('./result/dataTime').content
row_set      = root.find('./result/rowset/row')

# iterate across the row-set and find or create a Jump record
row_set.each { |row|
  system_id = row.attributes[:solarSystemID]
  num_jumps = row.attributes[:shipJumps]

  record = Jump.where(:system_id=>system_id.to_i,
                          :ship_jumps=>num_jumps.to_i,
                          :eve_api=>eve_version.to_i,
                          :current_time=>current_time,
                          :data_time=>data_time,
                          :cached_until=>cached_until).first_or_create

}