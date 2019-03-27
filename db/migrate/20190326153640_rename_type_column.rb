class RenameTypeColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :jobs, :type, :position_hours

  end
  end

