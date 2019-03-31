class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table(:shows) do |t|
      t.string :title
      t.string :average_rating
      t.string :status
      t.timestamps
    end
  end
end
