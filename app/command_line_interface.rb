def welcome
  puts "Welcome!"
end

def sign_in
  puts "Please, type in a username."
  user_input = gets.chomp.downcase
  User.find_or_create_by(user_name: user_input)
end

def get_show_from_user
  puts "please enter a show name"
gets.chomp.downcase
end
