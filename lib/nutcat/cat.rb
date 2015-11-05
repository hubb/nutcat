require 'nutcat/cat_image'
require 'nutcat/cat_fact'
require 'nutcat/cat_fetcher'
require 'tempfile'

module Nutcat
  class Cat
    attr_writer :fetcher

    def img
      @img ||= image.to_s
    end

    def fact
      @fact ||= CatFact.new.to_s
    end

    def filename
      @filename ||= image.url.split('/')[-1]
    end

    def save(file)
      cat = fetcher.call(file)

      cat.fetch
    end

    private
    def image
      @image ||= CatImage.new
    end

    def fetcher
      @fetcher ||= ->(file) { CatFetcher.new(image.url, file) }
    end
  end
end