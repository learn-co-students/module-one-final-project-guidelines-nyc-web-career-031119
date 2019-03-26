require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"

welcome
user_input = get_show_from_user
get_show_from_api(user_input)
print_average_rating(user_input)
pring_status(user_input)
