require 'rest-client'
require 'json'
require 'pry'

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
			location: "#{location}", title: "#{title.downcase}", job_info: "#{description.gsub(/<\/?[^>]*>/, "")}", 
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




#get_all_jobs

#jobs_array = response_hash["results"]

