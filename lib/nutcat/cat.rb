require 'nutcat/cat_image'
require 'nutcat/cat_fact'
require 'nutcat/cat_fetcher'
require 'pathname'

module Nutcat
  class Cat
    class InvalidPathError < ArgumentError; end

    def img
      @img ||= cat_image.to_s
    end

    def fact
      @fact ||= CatFact.new.to_s
    end

    def save(p)
      path = Pathname.new(p)
      unless path.exist?
        fail InvalidPathError.new('The path you provided does not exist!')
      end
      
      fetcher = CatFetcher.new(cat_image.url, path.to_s)

      if fetcher.fetch
        "File saved to #{fetcher.path}"
      else
        "An error occurend, unable to write to #{fetcher.path}"
      end
    end

    private
    def cat_image
      @cat_image ||= CatImage.new
    end
  end
end