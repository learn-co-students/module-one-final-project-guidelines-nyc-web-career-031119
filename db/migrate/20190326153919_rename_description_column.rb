class RenameDescriptionColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :jobs, :description, :job_info

  end
  end
