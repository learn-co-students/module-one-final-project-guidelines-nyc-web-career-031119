require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_array = response_hash["results"]
 

match = character_array.find{|character| character["name"].downcase == character_name}

films = match["films"]

films.map do |film_url|
movie_array = JSON.parse(RestClient.get(film_url))
# movie_array["title"]
end

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
   films.map do |film|
      puts film["title"]
      puts film["director"]
      puts film["release_date"]   
      puts "*" * 20
   end
end
# binding.pry

# end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
