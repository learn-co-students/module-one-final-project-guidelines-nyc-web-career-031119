require 'rest-client'
require 'json'
require 'pry'

class Pokemon
  random_pokemon_num = rand(1..151)
  pokemon_string1 = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{random_pokemon_num}/")
  pokemon_hash1 = JSON.parse(pokemon_string1)
  pokemon_string2 = RestClient.get("https://pokeapi.co/api/v2/pokemon-species/#{random_pokemon_num}/")
  pokemon_hash2 = JSON.parse(pokemon_string2)

  name = pokemon_hash1["name"]
  primary_type = pokemon_hash1["types"].find  {|each| each["slot"] == 1}["type"]["name"]
  secondary_type = if pokemon_hash1["types"].length > 1
    pokemon_hash1["types"].find  {|each| each["slot"] == 2}["type"]["name"]
  end
  stat_hp = pokemon_hash1["stats"].find {|each| each["stat"]["name"] == "hp"}["base_stat"]
  stat_speed = pokemon_hash1["stats"].find {|each| each["stat"]["name"] == "speed"}["base_stat"]
  stat_attack = pokemon_hash1["stats"].find {|each| each["stat"]["name"] == "attack"}["base_stat"]
  stat_special_attack = pokemon_hash1["stats"].find {|each| each["stat"]["name"] == "special-attack"}["base_stat"]
  stat_defense = pokemon_hash1["stats"].find {|each| each["stat"]["name"] == "defense"}["base_stat"]
  stat_special_defense = pokemon_hash1["stats"].find {|each| each["stat"]["name"] == "special-defense"}["base_stat"]

  capture_rate = pokemon_hash2["capture_rate"]

  genus = pokemon_hash2["genera"].find {|each| each["language"]['name'] == "en"}["genus"]
  flavor_text = pokemon_hash2["flavor_text_entries"].select {|each| each["language"]['name'] == "en"}.sample["flavor_text"]
  binding.pry
end
