def welcome
	puts "===" * 20

	# binding.pry

# 	puts  
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
# HEREDOC
                                                                                                                                    

puts "Welcome to Git-Hired"
puts "===" * 20
end

def set_username
  	puts "please enter a username"
  	input = gets.chomp.capitalize
	
	$current_user = User.find_or_initialize_by(username: "#{input}")
 	$current_user.save
  
  puts "Welcome #{$current_user.username}"
end
 
def help
  puts "I accept the following commands:
  - help : Displays this help message
  - location : Sorts job listings by location
  -	title : Sorts job listings by job title
  -	exit : To exit
  "
end

def search_helper
	puts "please Select a filter option."
	puts "1. location"
	puts "2. title"
	puts "exit: to exit"
end


def save_job(job)
	User_Job.find_or_create_by(user_id: $current_user.id, job_id: job.id)
end


def exit
	exit
end

def find_saved_jobs
	#returns array of all saved job ids
	User_Job.all.map do|job_inst|
     job_inst.user_id == $current_user.id
     job_inst.job_id
    end
	
end


def user_dash
# binding.pry
	puts "1. View Saved Jobs (#{User_Job.where(user_id: $current_user.id).length})"
	puts "2. Search  New Jobs(#{Job.all.length})"
	 user_input = gets.chomp
	case user_input
	

	when "1"
puts "Saved jobs"

array_of_saved_jobs = Job.all.where(id: find_saved_jobs)
array_of_saved_jobs.map do |job|

	puts "===" * 20
	short_job_info(job)
	puts "===" * 20
	saved_jobs_helper

	saved_job_case(job)
		

		
end

	when "2"
		search_jobs
	else
		puts "please select option 1 or 2"
	end

end




def search_jobs
	search_helper

	while user_input = gets.chomp
	   case user_input.downcase
	    when "1"
	    	puts "enter location"
	    	location_input = gets.chomp.split.map(&:capitalize).join(' ')
	    	#binding.pry
	      find_by_location(location_input)
	    when "2"
	    	puts "enter job title"
	    	title_input = gets.chomp.downcase
	      find_by_title(title_input)
	    when "exit"
	      exit_cli
	      break
	    else
	      puts "please Select a filter option."
	  end
	end
end


def start_time_run
	#get_all_jobs
	welcome
	set_username
	user_dash
	
end