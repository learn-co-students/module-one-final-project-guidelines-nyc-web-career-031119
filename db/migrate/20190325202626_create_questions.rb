class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :category
      t.string :difficulty
      t.string :correct_answer
    end
  end
end
