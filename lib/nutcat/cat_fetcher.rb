require 'uri'
require 'nutcat/connection'

module Nutcat
  class CatFetcher
    include Connection

    def self.fetch(*args)
      new(*args).fetch
    end

    def initialize(url, io)
      @uri = URI.parse(url)
      @io  = io
    end

    def fetch
      @io.reopen('wb') if @io.closed?
      @io.rewind   unless @io.pos == 0

      @io.write(http.call(@uri))
      @io.close
      
      true
    end
  end
end