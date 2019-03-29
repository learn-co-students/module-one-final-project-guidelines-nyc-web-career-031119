class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :animals, :birth_year, :integer
  end
end
