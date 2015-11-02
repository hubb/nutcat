require 'nutcat/cat_image'
require 'nutcat/cat_fact'

module Nutcat
  class Cat
    def img
      @img ||= CatImage.new.to_s
    end

    def fact
      @fact ||= CatFact.new.to_s
    end

    def save(path)
    end
  end
end