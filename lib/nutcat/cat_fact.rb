require 'json'
require 'nutcat/connection'

module Nutcat
  class CatFact
    include Connection

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
  end
end