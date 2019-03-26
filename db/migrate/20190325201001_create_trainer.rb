class CreateTrainer < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :favourite_pokemon
    end
  end
end
