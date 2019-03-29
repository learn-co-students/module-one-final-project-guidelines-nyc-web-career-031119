# remove HTML
#string.gsub(/<\/?[^>]*>/, "")
# def save?
	
	# capitalize each word
# .split.map(&:capitalize).join(' ')

	




def find_by_title(user_input)
	result = Job.all.select{|job| job.title.include?("#{user_input}")}
	puts "Total jobs including keyword: #{user_input.split.map(&:capitalize).join(' ')}: (#{result.length})".yellow
	job_counter = 0

	result.map do|job| 
		seperator
		seperator
		short_job_info(job)
		puts "Next job incoming..".yellow
		seperator
		seperator
		

		puts "please enter 'Y' to save Job, 'N' to skip to the next Job. \nOr 'exit' to go back to dashboard".yellow

			case user_input = gets.chomp.downcase
			when "y"
				save_job(job)
				puts "JOB SAVED!"
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

def find_by_location(user_input)
	# result = Job.where(:location => "#{user_input}")
	result = Job.all.select{|job| job.location.include?("#{user_input}")}
	puts "Total jobs located in #{user_input.split.map(&:capitalize).join(' ')}: (#{result.length})"
	
	job_counter = 0
	# Job.all.select{|job| job.title.include?("senior")}
	result.map do|job| 
		seperator
		seperator
		short_job_info(job)
		puts "Next job incoming..".yellow
		seperator
		seperator
		puts "Save job? [y/n] or 'exit' to return to dashboard".yellow
			case user_input = gets.chomp.downcase
			when "y"
				# binding.pry
				save_job(job)
			when "n"
				puts "Next job incoming.."
			when "exit"
				user_dash
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
		


def return_most_saved_job
	seperator
        most_saved_job_id = User_Job.all.max_by { |job| job }.job_id
	 	most_saved_job_count = User_Job.where(job_id: most_saved_job_id).count
	 	job = Job.find(most_saved_job_id)
		puts most_saved_job_info(job)
		seperator

		puts "- 1. View more?"
		puts "- 2. Save job?"
		puts "- 3. Dashboard"

		user_input = gets.chomp
		case user_input
		when "1"
			all_job_info(job)
			seperator
		puts "Save job? [y/n]"
			user_input = gets.chomp
		when "y" || "yes"
			save_job(job)
			seperator
			user_dash
		when "2"
			save_job(job)
			seperator
			user_dash
		when "3" || "exit"
		user_dash	
	end
end
		

		
