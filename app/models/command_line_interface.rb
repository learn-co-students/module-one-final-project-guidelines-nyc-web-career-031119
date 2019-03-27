def welcome
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
	User_Jobs.find_or_create_by(user_id: $current_user.id, job_id: job.id)
end


def exit
	exit
end

def user_dash

	puts "1. View Saved Jobs (#{User_Jobs.where(user_id: $current_user.id).length})"
	puts "2. Search  New Jobs(#{Job.all.length})"
	 user_input = gets.chomp
	case user_input
	when "1"
		puts "saved jobs"
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
	welcome
	set_username
	user_dash
	
end