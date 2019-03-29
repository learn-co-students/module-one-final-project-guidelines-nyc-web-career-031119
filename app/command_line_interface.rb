class CLI
  attr_reader :current_user, :current_show

  def start
    clear_console
    welcome
    sign_in
    clear_console
    user_options
  end

  def clear_console
    system('clear')
  end

  def welcome
puts "           |`-.._____..-'|
           :  > .  ,  <  :
           `./ __`' __ \,'
            | (|_) (|_) |             Welcome!
            ; _  .  __  :
            `.,' - `-. ,'
              `, `_  .'
              /       \
             /         :
            :          |_
           ,|  .    .  | \
          : :   \   |  |  :
          |  \   :`-;  ;  |
          :   :  | /  /   ;
           :-.'  ;'  / _,'`------.
           `'`''-`'''-'-''--.---  )
                        SSt `----'"
  end

  def sign_in
    puts "Please type in a username."
    user_input = gets.chomp.downcase
    @current_user = User.find_or_create_by(user_name: user_input)
  end

  def prompt
    puts "=" * 30
    puts "What would you like to do?\n
          1. search shows\n
          2. see your shows\n
          3. change user \n
          4. exit"

puts "=" * 30
  end

  def user_options
    user_input = ""
    while user_input != 4
      prompt
    user_input = gets.chomp.to_i
      if user_input == 1
        clear_console
        show_name = get_show_from_user
        get_show_from_api(show_name)
        if !get_show_from_api(show_name)
          puts " We couldn't find that show, please try again. (｡T ω T｡) \n "
        else
          clear_console
          nice_print_format(show_name)
        # valid_entry(show_name)
        create_and_save_show(show_name)
      end
      elsif user_input == 2
        clear_console
        self.current_user.reload.shows.each { |show| puts "#{show.title} \n -----------------------"}
      elsif user_input == 4
        exit
      elsif user_input == 3
        clear_console
        sign_in
      else
        puts "Please type a valid command (๑˃͈꒵˂͈๑) \n "
      end
    end
  end

  def get_show_from_user
    puts "please enter a show name."
  gets.chomp.downcase
  end

  def new_show(show_name)
    @current_show = Show.find_or_create_by(title: title(show_name), average_rating: average_rating(show_name), synopsis: synopsis(show_name))
  end

  def save_show
    puts "Would you like to save this show?(y/n)"
    user_input = gets.chomp.downcase
    if user_input == 'y'
      UserShow.find_or_create_by(user_id: @current_user.id, show_id: @current_show.id)
    end
    clear_console
  end

  def create_and_save_show(show_name)
    new_show(show_name)
    save_show
  end

  def exit
    clear_console
    puts "
    ═✿✿✿═════✿✿═════✿✿═════✿✿✿═
════════════ ('\../') ═════════════
 ════════════ (◕.◕) ═════════════
════════════ (,,)(,,) ═════════════
.▀█▀.█▄█.█▀█.█▄.█.█▄▀　█▄█.█▀█.█─█
─.█.─█▀█.█▀█.█.▀█.█▀▄　─█.─█▄█.█▄█"
    puts "\nHave a great day!"
  end

end
