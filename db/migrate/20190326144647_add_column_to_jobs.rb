class AddColumnToJobs < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :job_uniq_id, :string
  end
end
