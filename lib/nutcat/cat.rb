require 'nutcat/cat_fact'

module Nutcat
  class Cat
    def img
    end

    def fact
      @fact ||= CatFact.new.to_s
    end

    def save(path)
    end
  end
end