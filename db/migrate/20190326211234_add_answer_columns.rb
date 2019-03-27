class AddAnswerColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :incorrect_answers, :string
  end
end
