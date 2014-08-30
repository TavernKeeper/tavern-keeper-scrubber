require "tavern-keeper/scrubber/version"
require "tavern-keeper/scrubber/standard_strip"
require "loofah"

module TavernKeeper
  module Scrubber
  	def self.scrub(value)
  		case value.class.name
  		when 'String'
  			scrub_string(value)
  		when 'Hash'
  			scrub_hash(value)
  		when 'Array'
  			scrub_array(value)
  		else
  			value
  		end
  	end

  	def self.scrub_string(value)
      @standard ||= TavernKeeper::Scrubbers::StandardStrip.new
  		Loofah.fragment(value).scrub!(@standard).to_s
  	end

  	def self.scrub_hash(hash)
    	hash.each do |key, value|
    		hash[key] =  scrub(value)
    	end
    end

    def self.scrub_array(array)
    	clean_array = []
    	array.each do |i|
    		clean_array << scrub(i)
    	end
    end
  end
end
