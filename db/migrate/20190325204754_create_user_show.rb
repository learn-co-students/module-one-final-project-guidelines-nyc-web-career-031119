class CreateUserShow < ActiveRecord::Migration[5.0]
  def change
    create_table(:user_show) do |t|
      t.integer :user_id
      t.integer :show_id
      t.timestamps
    end
  end
end
