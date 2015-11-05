module Nutcat
  module Renderer
    RENDERERS = %w( browser file fact )
    class RendererKindError < ArgumentError; end

    def self.for(kind)
      kind ||= 'browser'

      unless RENDERERS.include? kind
        fail RendererKindError, "Sorry, don't know what to do with '#{kind}'."
      end

      filename = [kind, 'renderer'].join('_')

      begin
        require "nutcat/renderer/#{filename}"
        Nutcat::Renderer.const_get [kind.capitalize, 'Renderer'].join.to_s
      rescue
        fail RendererKindError, "Sorry, unable to load a renderer for '#{kind}'."
      end
    end
  end
end