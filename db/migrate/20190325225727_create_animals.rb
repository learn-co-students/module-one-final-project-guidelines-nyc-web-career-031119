class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.string :species
      t.string :name
      t.string :birth_year
      t.string :size
      t.string :gender
      t.string :spayed_neutered
    end
  end
end
