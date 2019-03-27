class ChangeColumnBooleanNeuter < ActiveRecord::Migration[5.0]
  def change
    change_column :animals, :spayed_neutered, :boolean 
  end
end
