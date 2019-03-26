class CreatePokemon < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :genus
      t.string :primary_type
      t.string :secondary_type
      t.string :flavor_text
      t.integer :level
      t.integer :speed
      t.integer :special_attack
      t.integer :special_defense
      t.integer :attack
      t.integer :defense
      t.integer :hp
      t.integer :capture_rate
      t.timestamps
    end
  end
end
