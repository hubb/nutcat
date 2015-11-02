lib = File.expand_path('..', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'nutcat/version'
require 'nutcat/cat'

module Nutcat
  class UnknownKindError < ArgumentError; end

  def self.for(kind)
    cat = Cat.new

    case kind
    when nil, 'browser'
      system('open', cat.img)
    when 'file'
      puts cat.save(File.join(Dir.home, 'Desktop'))
    when 'fact'
      puts cat.fact
    else
      fail UnknownKindError.new("Sorry, don't know what to do with '#{kind}'.")
    end
  end
end