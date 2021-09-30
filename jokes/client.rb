#!/usr/bin/env ruby

require 'json'

class Cleint
  def self.get_joke(id)
    response = JSON.parse `curl -s https://api.icndb.com/jokes/#{id}`
    response.dig(*%w[value joke])
  rescue JSON::ParserError => e
    puts "Failed to load joke: #{e.inspect}"
  end
end
