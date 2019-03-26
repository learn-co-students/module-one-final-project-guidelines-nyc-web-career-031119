class QuestionMaster < ActiveRecord::Base
  belongs_to :players
  belongs_to :questions
end
