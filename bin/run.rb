require_relative '../config/environment'
require_relative "../app/api_communicator.rb"

welcome
# user_input = sign_in
sign_in
user_show_input = get_show_from_user
get_show_from_api(user_show_input)
# print_average_rating(user_show_input)
# print_status(user_show_input)
nice_print_format(user_show_input)
