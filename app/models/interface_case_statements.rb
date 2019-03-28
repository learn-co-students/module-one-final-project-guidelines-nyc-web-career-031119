def saved_job_case(job)
	counter = 0
	u_input = gets.chop.downcase
	case u_input
	when "1"
		all_job_info(job)
	when "2"
		
	when "3"
		puts "Are you sure you'd like to delete this job? [Y/N]"
		input = gets.chomp.downcase

		if input == "y"
			binding.pry
			found_job = User_Job.find_by(job_id: job.id, user_id: $current_user.id)
			found_job.delete
		end
	when "4"
		user_dash
	when "5"
		# puts "Title: #{job.title}"
		# puts "Company: #{job.company} "
		# puts "Position: #{job.position_hours}"
		puts "#{job.how_to_apply.gsub(/<\/?[^>]*>/, "")}"
		saved_jobs_helper
	end

end

# def delete_job(job)
# 	found_job = User_Job.all.find_by(job_id: job.id, user_id: $current_user.id)
# 			found_job.delete
# end

def search_case
	 user_input = gets.chomp
	   case user_input
	    when "1"
	    	puts "Enter location to filter job search."
	    	location_input = gets.chomp.split.map(&:capitalize).join(' ')
	    case location_input
	    	when "4"
	    		user_dash
	    	else
	    		
	      		find_by_location(location_input)
	  	end
	    	when "2"
	    		puts "enter job title"
	    		title_input = gets.chomp.downcase
	    case title_input
	    	when "exit" || "4"
	    		user_dash
	    	else
	      		find_by_title(title_input)
	  	end
	     
	     	when "3"
	     		seperator
	     		return_most_saved_job
	     	when "4" || "exit"
	      		user_dash
	    	else
	      		puts "Please elect a filter option."
	      		search_case
	  		end
end
		



			
		
			
