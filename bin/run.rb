require_relative '../config/environment'

# puts "HELLO WORLD"


def login(username)
  player = Player.validate(username)
  if player
    puts "Welcome Back #{player.username}!"
  else
    player = Player.new_user(username)
    puts "Welcome #{player.username}!"
  end
  @current_player = player
end

def main_menu
  puts "What would you like to do?"
  puts "1. Start Game"
  puts "2. Stats"
  puts "3. Reset Questions"
  puts "4. Exit"
  print "Please enter a number: "
end

def correct?(question, answer)
  if question["correct_answer"].downcase == answer
    puts "Correct!"
    #increase score!!
  else
    puts "Wrong!" #play sound, minus life
  end
end

def start_game
  # puts "Choose a category"
  question = get_random_question_from_api
  # binding.pry
  puts question["question"]
  puts question["correct_answer"]
  question["incorrect_answers"].each do |answer|
    puts answer
  end
  answer = $stdin.gets.chomp.downcase
  if answer == "exit"
    exit
  end
  correct?(question, answer)

end

welcome
# new_user?
username = get_username
login(username)
playing = true
while playing
  main_menu
  input = $stdin.gets.chomp.to_i

  case input
  when 1
    start_game
  when 2
    @current_player.stats
  when 3
    @current_player.reset_questions
    puts 'your questions have been reset'
  when 4
    puts "Bye!"
    playing = false
    # exit
  end
end



# welcome, please enter your username
  # if exists
    # welcome back X
  # else
    # welcome X

# what would you like to do?
  # stats
  # start game
  # reset questions
  # exit

  # stats
    # high_score
    # questions_answered
    # percent_correct

  # start game
    # choose category? (define category or leave blank for all)
    # choose difficulty? (define difficulty or leave blank for all)

# in game
  # get question
  # show current score
  # show current lives
    # if question exists
    # if player has been asked
      # if correct
        # correct message
        # score + 1 (or + difficulty level? / weighted scores)
      # if incorrect
        # incorrect message
        # life - 1, 'you have X lives remaining'
        # if life = 0, exit and you lose message
      # skip?
      # exit
    # if question doesnt exist: save to questions table
    # if player has not answered: save to questionmaster table

##########################################

# extra functionality
  # sudden death? (1 life)
  # challenge mode (hard difficulty only?)
  # casual mode (no lives, no high score, play until user exits)
  # every X amount of questions correct + 1 life?
  # timer? can do delay countdown that automatically - 1 life if they run out of time
