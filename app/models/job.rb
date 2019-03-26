class Job < ActiveRecord::Base
	has_many :user_jobs
	has_many :users, through: :user_jobs
end

	
end

def import_helper(response_hash)
	response_hash.each do |job|
		
		position_type = job["type"]
		description = job["description"]
		job_uniq_id = job["id"]
		url = job["url"] 
		company = job["company"] 
		location = job["location"] 
		title = job["title"]  
		company_url = job["company_url"]
		how_to_apply = job["how_to_apply"]

	Job.find_or_create_by(job_uniq_id: "#{job_uniq_id}", url: "#{url}", company: "#{company}", 
			location: "#{location}", title: "#{title}", job_info: "#{description}", 
			position_hours: "#{position_type}",company_url: "#{company_url}",how_to_apply:"#{how_to_apply}").save
	end
end
		

def get_all_jobs

	page_count = 1

	while page_count < 10
		r_string = RestClient.get("https://jobs.github.com/positions.json?page=#{page_count}")
		r_hash = JSON.parse(r_string)
		import_helper(r_hash)
		page_count += 1	
	end
end




get_all_jobs
			
# r_hash.each do |job_hash|
# 			if !Job.all_job_ids_in_db.include?(job_hash["id"])
# 				r_hash.delete(job_hash)
# 			end
# end





