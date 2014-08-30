require 'loofah'

module TavernKeeper::Scrubber
  class StandardStrip < ::Loofah::Scrubber
    def initialize
      @direction = :top_down
    end

    def scrub(node)
      return CONTINUE if html5lib_sanitize(node) == CONTINUE
      return CONTINUE if node.name.downcase == 'style' && node.type == Nokogiri::XML::Node::ATTRIBUTE_NODE
      node.remove
      return STOP
    end
  end

end
