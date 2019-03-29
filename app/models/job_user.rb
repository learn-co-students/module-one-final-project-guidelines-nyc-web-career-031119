class JobUser < ActiveRecord::Base
	 belongs_to :user
	 belongs_to :job

	 def self.most_saved_job
	 	
	 	
	 end
end




