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

def print_average_rating(show_name)
   attributes_hash = get_show_from_api(show_name)
   puts attributes_hash['averageRating']
end

def pring_status(show_name)
  attributes_hash = get_show_from_api(show_name)
  puts attributes_hash['status']
end
