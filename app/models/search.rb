# remove HTML
#string.gsub(/<\/?[^>]*>/, "")
# def save?
	
	# capitalize each word
# .split.map(&:capitalize).join(' ')

	




def find_by_title(user_input)
	result = Job.all.select{|job| job.title.include?("#{user_input}")}
	result.map do|job| 
		
		puts "Title: #{job.title}"
		puts "Company: #{job.company} "
		puts "Position: #{job.position_hours}"
		puts "Listing posted on #{job.created_at}"
		puts "Job description: #{job.job_info.truncate(500)}"
		puts "===" * 20
		puts "===" * 20
		puts "===" * 20
	end
end

def find_by_location(user_input)
	# result = Job.where(:location => "#{user_input}")
	result = Job.all.select{|job| job.location.include?("#{user_input}")}
	puts "Total jobs located in #{user_input.split.map(&:capitalize).join(' ')}: (#{result.length})"
	
	job_counter = 0
	# Job.all.select{|job| job.title.include?("senior")}
	result.map do|job| 
		
		puts "Company: #{job.company} "
		puts "Title: #{job.title}"
		puts "Position: #{job.position_hours}"
		puts "Listing posted on #{job.created_at}"
		puts "Job description: #{job.job_info.truncate(500)}"
		puts "===" * 20
		puts "===" * 20
		puts "===" * 20

		puts "please enter 'Y' to save Job, 'N' to skip to the next Job."
			case user_input = gets.chomp.downcase
			when "y"
				# binding.pry
				save_job(job)
			when "n"
				puts "Next job incoming.."
			when "exit"
				user_dash
				break
			when
			 	 until user_input == "y" || user_input == "n"
					puts "Enter valid input."
					user_input = gets.chomp.downcase
					if user_input == "y"
						save_job(job)
					end
			 	 end
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
