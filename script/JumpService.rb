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
    :reconnect => true)


class Jumps < ActiveRecord::Base
end

# DATE_FORMAT = '%Y-%m-%d %H:%M:%S'

# load the XML
xml = File.read('/Users/nowak/Desktop/jumps-2014-06-25-065155.xml')
parser, parser.string = XML::Parser.new, xml

doc = parser.parse
root = doc.root

eve_version = root.attributes[:version]

current_time = root.find_first('currentTime').content
# current_time_obj = DateTime.strptime(current_time, DATE_FORMAT)

cached_until = root.find_first('cachedUntil').content
# cached_until_obj = DateTime.strptime(cached_until, DATE_FORMAT)

data_time = root.find_first('./result/dataTime').content
# data_time_obj = DateTime.strptime(data_time, DATE_FORMAT)

row_set = root.find('./result/rowset/row')

# data_set = Hash.new
row_set.each { |row|
    system_id = row.attributes[:solarSystemID]
    num_jumps = row.attributes[:shipJumps]
    # data_set[system_id] = num_jumps

    record = Jumps.where(:system_id=>system_id.to_i,
                            :ship_jumps=>num_jumps.to_i,
                            :eve_api=>eve_version.to_i,
                            :current_time=>current_time,
                            :data_time=>data_time,
                            :cached_until=>cached_until).first_or_create
}

