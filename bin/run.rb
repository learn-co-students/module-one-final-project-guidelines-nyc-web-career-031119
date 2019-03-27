require_relative '../config/environment'
require_relative "../lib/command_line_interface.rb"


cli = CLI.new
cli.greet
cli.get_user_name
cli.select_species_menu
cli.foster_option


# cli.foster_length
#cli.cancel_foster
