class ChangeStatusToSynopis < ActiveRecord::Migration[5.0]
  def change
    rename_column :shows, :status, :synopsis
  end
end
