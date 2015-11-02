require 'uri'
require 'nutcat/connection'

module Nutcat
  class CatFetcher
    include Connection

    def self.fetch(*args)
      new(*args).fetch
    end

    attr_reader :path

    def initialize(url, path)
      @uri     = URI.parse(url)
      filename = url.split('/')[-1]
      @path    = File.join(path, filename)
    end

    def fetch
      File.open(@path, 'wb') do |f|
        f.write http.call(@uri)
      end
      true
    end
  end
end