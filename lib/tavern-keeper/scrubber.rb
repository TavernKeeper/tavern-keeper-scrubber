require "tavern-keeper/scrubber/version"
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
  		Loofah.fragment(value).scrub!(StandardStrip).to_s
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
