class CreateQuestionMasters < ActiveRecord::Migration[5.0]
  def change
    create_table :question_masters do |t|
      t.integer :question_id
      t.integer :player_id
    end
  end
end
