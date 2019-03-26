
class Job < ActiveRecord::Base
	has_many :user_jobs
	has_many :users, through: :user_jobs
		
		#make the web request
		response_string = RestClient.get('https://jobs.github.com/positions.json?')
		response_hash = JSON.parse(response_string)
		binding.pry

		job_3 = Job.new(job_uniq_id: "sdgsdfhgsdhdsfhdhsehshs", url: "abcd", company: "Google", location: "cali", title: "Senior Dev")


	def find_by_location

	end

	def find_by_title

	end

	def find_by_type

	end

	
end
