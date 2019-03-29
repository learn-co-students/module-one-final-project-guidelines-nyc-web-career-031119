class CreateJobUsers < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :jobs, :users do |t|
  	t.integer :user_id
  	t.integer :job_id

  	t.timestamps
  	end
  end
end
