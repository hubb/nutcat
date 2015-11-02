require 'forwardable'
require 'nutcat/connection'
require 'rexml/document'

module Nutcat
  class CatImage
    class Image < Struct.new(:url, :source_url); end

    extend  Forwardable
    include Connection

    attr_writer :parser
    def_delegators :image, :url, :source_url
    alias :to_s :source_url

    def initialize(endpoint = 'http://thecatapi.com/api/images/get?format=xml')
      @endpoint = URI.parse(endpoint)
    end

    def image
      data = http.call(@endpoint)
      doc  = REXML::Document.new(data)
      parser.call(doc)
    end

    private
    def parser
      @parser ||= ->(doc) {
        el = doc.root.elements.to_a("data/images/image").first
        Image.new(el.text('url'), el.text('source_url'))
      }
    end
  end
end