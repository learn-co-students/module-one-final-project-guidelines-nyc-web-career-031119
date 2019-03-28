def saved_jobs_helper
puts "1. See all job details."
puts "2. Next job."
puts "3. Delete from saved jobs."
puts "4. Return to dashboard"
end

def short_job_info(job)
		puts "Title: #{job.title}"
		puts "Company: #{job.company} "
		puts "Position: #{job.position_hours}"
		puts "Listing posted on #{job.created_at}"
		puts "Job description: #{job.job_info.truncate(500)}"
end

def all_job_info(job)

		puts "Title: #{job.title}"
		puts "Company: #{job.company} "
		puts "Position: #{job.position_hours}"
		puts "Location #{job.location}"
		puts "Job description: #{job.job_info}"
		puts "How to apply: #{job.how_to_apply}"
		puts "Listing posted on: #{job.created_at}"
end

def saved_job_case(job)
	u_input = gets.chop.downcase
	case u_input
	when "1"
		all_job_info(job)
	when "2"
		# break
	when "3"
		puts "Are you sure you'd like to delete this job? [Y/N]"
		input = gets.chomp.downcase

		if input == "y"
			# binding.pry
			found_job = User_Job.find_by(job_id: job.id, user_id: $current_user.id)
			found_job.delete
			
		else
			saved_jobs_helper
		end
	when "4"
		user_dash
	end
	user_dash
end