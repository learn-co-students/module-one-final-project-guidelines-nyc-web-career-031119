require 'rest-client'
require 'json'
require 'pry'

class Pokemon
  random_pokemon_num = rand(1..150)
  pokemon_string1 = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{random_pokemon_num}/")
  pokemon_hash1 = JSON.parse(pokemon_string1)
  pokemon_string2 = RestClient.get("https://pokeapi.co/api/v2/pokemon-species/#{random_pokemon_num}/")
  pokemon_hash2 = JSON.parse(pokemon_string2)

  pokemon_name = pokemon_hash1["name"]
  binding.pry

end
