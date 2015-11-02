require 'net/http'

module Nutcat
  module Connection
    attr_writer :http
        
    private
    def http
      @http ||= Net::HTTP.public_method(:get)
    end
  end
end