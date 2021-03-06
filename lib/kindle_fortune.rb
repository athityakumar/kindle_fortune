require 'kindle_fortune/version'

require 'json'
require 'kindleclippings'

class KindleFortune
  USERNAME                 = `whoami`.strip
  DEFAULT_UPDATED_DATAFILE = '/Volumes/Kindle/documents/My Clippings.txt'.freeze
  DEFAULT_CURRENT_DATAFILE = "/Users/#{USERNAME}/.config/kindle_fortune.json".freeze

  def initialize(updated_datafile:, current_datafile:)
    @current_datafile = current_datafile || DEFAULT_CURRENT_DATAFILE
    @updated_datafile = updated_datafile || DEFAULT_UPDATED_DATAFILE
  end

  def fetch_cookie
    if File.exist?(@updated_datafile) then prepare_extracts
    else import_extracts
    end

    raise 'No Kindle highlights detected' unless File.exist?(@current_datafile)
    fortune_cookie = @extracts[rand(@extracts.count)]
    pretty_print(fortune_cookie)
  end

  private

  def import_extracts
    @extracts = JSON.parse(File.read(@current_datafile))
  end

  def prepare_extracts
    @extracts =
      KindleClippings::Parser
      .new
      .parse_file(@updated_datafile)
      .select { |clipping| clipping.type== :Highlight }
      .map do |clipping|
        {
          'book'     => clipping.book_title,
          'author'   => clipping.author,
          'location' => clipping.location,
          'content'  => clipping.content
        }
      end
    store_extracts
  end

  def pretty_print(cookie)
    "#{cookie['book']} (#{cookie['author']}) [L#{cookie['location']}] "\
    "\n\n #{cookie['content']}"
  end

  def store_extracts
    File.delete(@current_datafile) if File.exist?(@current_datafile)
    File.open(@current_datafile, 'a') { |file| file.write(JSON.pretty_generate(@extracts)) }
  end
end
