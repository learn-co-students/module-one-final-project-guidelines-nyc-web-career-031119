class AddTypeColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :style, :string
  end
end
