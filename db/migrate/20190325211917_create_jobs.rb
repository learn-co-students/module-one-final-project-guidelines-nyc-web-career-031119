class CreateJobs < ActiveRecord::Migration[5.0]
  def change
  	create_table :jobs do |t|
t.string :type
t.string :url
t.string :created_at
t.string :company
t.string :company_url
t.string :location
t.string :title
t.string :description
t.string :how_to_apply

t.timestamps :added_at
t.timestamps :updated_at

  	end
  end
end
