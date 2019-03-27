class RenameUserShow < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_show, :user_shows
  end
end
