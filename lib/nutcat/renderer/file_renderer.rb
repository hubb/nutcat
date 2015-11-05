module Nutcat
module Renderer
  module FileRenderer
    def render
      begin
        file = File.open(File.join(Dir.home, 'Desktop', filename))
        
        if save(file)
          puts "Cat saved to #{file.path}"
        else
          puts "The cat doesn't want to be saved.."
        end
      rescue IOError
        puts "The cat doesn't want to be saved.."
      ensure
        file.close
      end
    end
  end
end
end