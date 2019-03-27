# remove HTML
#string.gsub(/<\/?[^>]*>/, "")
# def save?
	
	

	
# end



def find_by_title(user_input)
	Job.where(:title => "#{user_input}")
end

def find_by_location(user_input)
	
	result = Job.where(:location => "#{user_input}")
	# binding.pry
	job_counter = 0
	result.map do|job| 
		
		puts "Company: #{job.company} "
		puts "Title: #{job.title}"
		puts "Position: #{job.position_hours}"
		puts "Listing posted on #{job.created_at}"
		puts "Job description: #{job.job_info.truncate(500).gsub(/<\/?[^>]*>/, "")}"
		puts "===" * 20
		puts "===" * 20
		puts "===" * 20
# binding.pry
		puts "please enter 'Y' to save Job, 'N' to skip to the next Job."
			case user_input = gets.chomp.downcase
			when "y"
				# binding.pry
				save_job(job)
			when "n"
				puts "Next job incoming.."
			when user_input != "y" || "n"
				"invalid input"
			else
				
			end
		
		job_counter += 1

		if job_counter == result.length
			# binding.pry
			user_dash
		end

	end
end



def method_name

	if title 
		find_by_title
	elsif location
		find_by_location
	else
		"please select a sort method"
	end
end			
