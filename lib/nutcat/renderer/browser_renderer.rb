module Nutcat
  module Renderer
    module BrowserRenderer
      def render
        Kernel.system('open', img)
      end
    end
  end
end