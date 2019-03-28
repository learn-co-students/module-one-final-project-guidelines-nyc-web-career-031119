def saved_jobs_helper
puts "- 1. See all job details."
puts "- 2. Next job."
puts "- 3. Delete from saved jobs."
puts "- 4. Return to dashboard"
puts " -5. Apply"
end

def short_job_info(job)
		puts "Title: #{job.title}"
		puts "Company: #{job.company} "
		puts "Position: #{job.position_hours}"
		puts "Listing posted on #{job.created_at}"
		puts "Job description: #{job.job_info.truncate(500)}"
end

def most_saved_job_info(job)
		puts "Title: #{job.title}"
		puts "Company: #{job.company} "
		puts "Position: #{job.position_hours}"
		puts "Listing posted on #{job.created_at}"
end

def all_job_info(job)

		puts "Title: #{job.title}"
		puts "Company: #{job.company} "
		puts "Position: #{job.position_hours}"
		puts "Location #{job.location}"
		seperator
		puts "Job description: #{job.job_info}"
		seperator
		puts "How to apply: #{job.how_to_apply}"
		puts "Listing posted on: #{job.created_at}"
end

def dash_helper
	puts "- 1. View Saved Jobs (#{User_Job.where(user_id: $current_user.id).length})"
	puts "- 2. Search  New Jobs(#{Job.all.length})"
	puts "- 3. Quit Git Hired"
	seperator
end

def seperator
	puts "===" * 20
end

def search_helper
	puts "please Select a filter option."
	puts "- 1. Location"
	puts "- 2. Title"
	puts "- 3. View most saved job"
	puts "- 4. Dashboard"
	seperator
end

def help
  puts "I accept the following commands:
  - help : Displays this help message
  - location : Sorts job listings by location
  -	title : Sorts job listings by job title
  
  "
end