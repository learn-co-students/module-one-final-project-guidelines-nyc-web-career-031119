require 'rest-client'
require 'json'
require 'pry'

def get_show_from_api(show_name)

  response_string = RestClient.get('https://kitsu.io/api/edge/anime?page%5Blimit%5D=20&sort=-averageRating')
  response_hash = JSON.parse(response_string)

  name_of_show = response_hash['data'].find do|list|
    list['attributes']['slug'] == show_name

  # binding.pry
end
end
