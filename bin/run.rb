require_relative '../config/environment'
require_relative "../app/api_communicator.rb"
require 'pry'
# welcome
# user_input = sign_in
test = sign_in
# show = new_show()

user_show_input = get_show_from_user
#
get_show_from_api(user_show_input)
# print_average_rating(user_show_input)
# print_status(user_show_input)
nice_print_format(user_show_input)
created_a_new_show = new_show(user_show_input)
 save_show(test.id, created_a_new_show.id)
