
danny = Trainer.find_or_create_by(name: "Danny", favourite_pokemon: "Blastoise")
john = Trainer.find_or_create_by(name: "John", favourite_pokemon: "Jigglypuff")

dannyblastoise = CapturedPokemon.find_or_create_by(trainer_id: 3, pokemon_id: 1)
dannypikachu = CapturedPokemon.find_or_create_by(trainer_id: 3, pokemon_id: 2)
johnpikachu = CapturedPokemon.find_or_create_by(trainer_id: 4, pokemon_id: 2)



blastoise = Pokemon.find_or_create_by(
  name: "blastoise",
  genus: "Shellfish Pokemon",
  primary_type: "water",
  secondary_type: "",
  flavor_text: "The pressurized water jets on this brutal Pokémon’s\nshell are used for high-speed tackles.",
  level: 50,
  speed: 78,
  special_attack: 85,
  special_defense: 105,
  attack: 83,
  defense: 100,
  hp: 79,
  capture_rate: 45)

pikachu = Pokemon.find_or_create_by(
  name: "pikachu",
  genus: "Mouse Pokemon",
  primary_type: "electric",
  secondary_type: "",
  flavor_text: "Its nature is to store up electricity. Forests\nwhere nests of Pikachu live are dangerous,\nsince the trees are so often struck by lightning.",
  level: 50,
  speed: 90,
  special_attack: 50,
  special_defense: 50,
  attack: 55,
  defense: 40,
  hp: 35,
  capture_rate: 190)
