require 'active_record'
require 'xml'

class RecordService < ActiveRecord::Base
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

    def parse_row_set(file_url)
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

      return row_set
    end

    def create_records(row_set)
    end

end

