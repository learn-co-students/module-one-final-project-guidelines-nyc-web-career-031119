class Trainer < ActiveRecord::Base
  has_many :captured_pokemons
  has_many :pokemons, through: :captured_pokemons
end
