require 'pry'
class User < ActiveRecord::Base
	has_many :user_jobs
	has_many :jobs, through: :user_jobs

#user_1 = User.new(username: "Tommy Hilfigure")

end
