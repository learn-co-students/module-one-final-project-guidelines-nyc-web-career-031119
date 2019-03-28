class User_Job < ActiveRecord::Base
	 belongs_to :user
	 belongs_to :job
end

