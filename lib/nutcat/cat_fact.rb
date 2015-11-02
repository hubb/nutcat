require 'net/http'
require 'json'

module Nutcat
  class CatFact
    attr_writer :http

    def initialize(endpoint = 'http://catfacts-api.appspot.com/api/facts')
      @endpoint = URI.parse(endpoint)
    end

    def fact
      json = http.call(@endpoint)
      data = JSON.parse(json)
      data.fetch("facts", []).first || ""
    rescue JSON::ParserError
      ""
    end
    alias :to_s :fact

    private
    def http
      @http ||= Net::HTTP.public_method(:get)
    end
  end
end