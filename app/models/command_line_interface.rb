def welcome
	seperator

	# binding.pry

# 	puts  "
# 	    /\ \               /\ \         /\ \               / /\    / /\         /\ \           /\ \            /\ \          /\ \       
#        /  \ \              \ \ \        \_\ \             / / /   / / /         \ \ \         /  \ \          /  \ \        /  \ \____  
#       / /\ \_\             /\ \_\       /\__ \           / /_/   / / /          /\ \_\       / /\ \ \        / /\ \ \      / /\ \_____\ 
#      / / /\/_/            / /\/_/      / /_ \ \         / /\ \__/ / /          / /\/_/      / / /\ \_\      / / /\ \_\    / / /\/___  / 
#     / / / ______         / / /        / / /\ \ \       / /\ \___\/ /          / / /        / / /_/ / /     / /_/_ \/_/   / / /   / / /  
#    / / / /\_____\       / / /        / / /  \/_/      / / /\/___/ /          / / /        / / /__\/ /     / /____/\     / / /   / / /   
#   / / /  \/____ /      / / /        / / /            / / /   / / /          / / /        / / /_____/     / /\____\/    / / /   / / /    
#  / / /_____/ / /   ___/ / /__      / / /            / / /   / / /       ___/ / /__      / / /\ \ \      / / /______    \ \ \__/ / /     
# / / /______\/ /   /\__\/_/___\    /_/ /            / / /   / / /       /\__\/_/___\    / / /  \ \ \    / / /_______\    \ \___\/ /      
# \/___________/    \/_________/    \_\/             \/_/    \/_/        \/_________/    \/_/    \_\/    \/__________/     \/_____/      
# "
                                                                                                                                    

puts ("Welcome to" + " Git-Hired".green)
seperator
end

def set_username
  	puts ("Login".green + " or" + " create username.".yellow)
  	input = gets.chomp.downcase

  	case input 
  	
  	when "exit"
  		puts "Quit Git Hired? [y/n]"
  		input = gets.chomp.downcase

		if input == "y"
			exit!
		else
  		set_username
  		end

  	else
		$current_user = User.find_or_initialize_by(username: "#{input}")
 		$current_user.save
	  puts "Welcome #{$current_user.username.capitalize}"

	end

end




def save_job(job)
	User_Job.find_or_create_by(user_id: $current_user.id, job_id: job.id)
	puts "Job saved!".green
end

def find_saved_jobs
	#returns array of all saved job ids
	User_Job.all.select do|job_inst|
     job_inst.user_id == $current_user.id
    end
end

def num_of_saved_jobs
find_saved_jobs.length
end

	
def user_dash
	dash_helper
	user_input = gets.chomp
	case user_input
	when "1" #Go into "Saved Jobs"
		array_of_saved_jobs = Job.all.where(id: find_saved_jobs)
		
		saved_job_counter =0

			array_of_saved_jobs.map do |job|
				saved_job_counter += 1
				seperator
				short_job_info(job)
				seperator
				saved_jobs_helper
				saved_job_case(job)

				if saved_job_counter == num_of_saved_jobs
					seperator
					puts "You went through all your saved jobs!".yellow
			  		seperator
					user_dash
				end
			end
	when "2"
		search_jobs
	when "exit"
		exit!
	when "3"
		exit!
	end

end

def search_jobs
	search_helper
	search_case
end


def start_time_run
	welcome
	set_username
	user_dash
	
end

		
	
	
	

		




						
				
				
		
		

