require_relative '../config/environment'
require_relative "../lib/command_line_interface.rb"

ActiveRecord::Base.logger = false


cli = CLI.new
cli.art_
cli.art_two
cli.greet
cli.get_user_name
cli.main_menu


# cli.foster_length
#cli.cancel_foster
