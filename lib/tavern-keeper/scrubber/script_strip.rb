require 'loofah'

module TavernKeeper::Scrubber
  class StripScript < ::Loofah::Scrubber
    def initialize
      @direction = :top_down
    end

    def scrub(node)
      return CONTINUE if html5lib_sanitize(node) == CONTINUE
      return CONTINUE if node.name.to_lower == 'style'
      node.remove
      return STOP
    end
  end
end
