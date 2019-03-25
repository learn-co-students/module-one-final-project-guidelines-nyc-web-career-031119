class Show < ActiveRecord::Base
  has_many :users
 has many :users, through: :user_show
end
