class CreateFosterings < ActiveRecord::Migration[5.0]
  def change
    create_table :fosterings do |t|
      t.integer :user_id
      t.integer :animal_id
      t.string :length_of_time
    end
  end
end
