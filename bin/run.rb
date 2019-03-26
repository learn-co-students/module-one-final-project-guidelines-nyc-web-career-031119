require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"

welcome
# user_input = sign_in
sign_in
user_show_input = get_show_from_user
get_show_from_api(user_show_input)
print_average_rating(user__show_input)
pring_status(user_show_input)
