require 'tmpdir'
require 'catpix'

module Nutcat
module Renderer
  module CatpixRenderer
    def render
      begin
        file = Tempfile.new('cat.jpg')
        Catpix::print_image(file.path,
          limit_x:    1.0,
          limit_y:    1.0,
          center_x:   true,
          center_y:   true,
          bg:         'black',
          bg_fill:    true,
          resolution: 'low'
        )
      rescue IOError
        puts "The cat doesn't want to be drawn.."
      ensure
        file.unlink
      end
    end
  end
end
end