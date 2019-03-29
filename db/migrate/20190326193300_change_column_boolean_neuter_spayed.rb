class ChangeColumnBooleanNeuterSpayed < ActiveRecord::Migration[5.0]
  def up
    remove_column :animals, :spayed_neutered
    add_column :animals, :spayed_neutered, :boolean
  end

  def down
    remove_column :animals, :spayed_neutered
  end
end
