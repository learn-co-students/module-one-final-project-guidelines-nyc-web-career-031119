require 'rest-client'
require 'json'
require 'pry'

def get_show_from_api(show_name)

  response_string = RestClient.get('https://kitsu.io/api/edge/anime?page%5Blimit%5D=20&sort=-averageRating')
  response_hash = JSON.parse(response_string)

 show_name_hash = response_hash['data'].find do|list|
    list['attributes']['slug'].downcase == show_name
  # binding.pry
  end
 show_name_hash['attributes']
end

def average_rating(show_name)
   attributes_hash = get_show_from_api(show_name)
    attributes_hash['averageRating']
end

def synopsis(show_name)
  attributes_hash = get_show_from_api(show_name)
   attributes_hash['synopsis']
end

def nice_print_format(show_name)
  puts "#{show_name}: Average Rating: #{average_rating(show_name)}"
  puts "☻ ღ " * 20
  puts "Synnopsis: #{synopsis(show_name)}"
end
