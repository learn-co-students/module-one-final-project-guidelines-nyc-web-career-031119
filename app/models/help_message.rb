def saved_jobs_helper
	seperator
puts "- 1. See all job details."
puts "- 2. Next job."
puts "- 3. Delete from saved jobs."
puts "- 4. Return to dashboard"
puts " -5. Apply"
seperator
end

def short_job_info(job)
		puts "Title:".green + " #{job.title}"
		white_space_seperator
		puts "Company:".green + " #{job.company}"
		white_space_seperator
		puts "Position:".green + " #{job.position_hours}"
		white_space_seperator
		puts "Listing posted on:".green + " #{job.created_at}"
		white_space_seperator
		puts "Job description:".green + " #{job.job_info.truncate(500)}"
		white_space_seperator
end

def most_saved_job_info(job)
		puts "Title:".green + " #{job.title}"
		white_space_seperator
		puts "Company:".green + " #{job.company}"
		white_space_seperator
		puts "Position:".green + " #{job.position_hours}"
		white_space_seperator
		puts "Listing posted on:".green + " #{job.created_at}"
end

def all_job_info(job)

		puts "Title:".green + " #{job.title}"
		white_space_seperator
		puts "Company:".green + " #{job.company}"
		white_space_seperator
		puts "Position:".green + " #{job.position_hours}"
		white_space_seperator
		puts "Location:".green + " #{job.location}"
		seperator
		puts "Job description:".green + " #{job.job_info}"
		seperator
		puts "How to apply:".blue + " #{job.how_to_apply}"
		white_space_seperator
		puts "Listing posted on:".green + " #{job.created_at}"
end

def dash_helper
	# seperator
	puts "- 1. View Saved Jobs (#{User_Job.where(user_id: $current_user.id).length})"
	puts "- 2. Search  New Jobs(#{Job.all.length})"
	puts "- 3. Quit Git Hired"
	seperator
end

def seperator
	puts "===" * 20
end

def white_space_seperator
puts "" * 5
end


def search_helper
	seperator
	puts "Select filter option.".yellow
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