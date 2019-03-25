class User_Jobs < ActiveRecord::Base
	 belongs_to :users
	 belongs_to :jobs
end
