class AddJobSavedColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :job_saved, :boolean
  end
end
