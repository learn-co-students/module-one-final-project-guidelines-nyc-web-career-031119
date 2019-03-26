
  def welcome
    puts "Welcome!"
  end

  def sign_in
    puts "Please type in a username."
    user_input = gets.chomp.downcase
    User.find_or_create_by(user_name: user_input)
  end

  def get_show_from_user
    puts "please enter a show name"
  gets.chomp.downcase
  end

  def new_show(show_name)
    Show.find_or_create_by(title: show_name, average_rating: average_rating(show_name), synopsis: synopsis(show_name))
  end

  

  def save_show(user_id, show_id)

    puts "Would you like to save this show?(y/n)"
    user_input = gets.chomp.downcase
    if user_input == 'y'

      UserShow.find_or_create_by(user_id: user_id, show_id: show_id)
    end
  end

  # ns = new_show(show_name)
