lib = File.expand_path('..', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'nutcat/version'
require 'nutcat/cat'
require 'nutcat/renderer'

module Nutcat
  def self.render(kind)
    cat  = Cat.new
    renderer = Renderer.for(kind)
    cat.extend renderer
    cat.render
  end
end