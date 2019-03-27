require_relative '../config/environment'
require 'json'
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
  @score = 0
  @life = 3
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
    @score += 1
  else
    puts "Wrong!" #play sound, minus life
    @life -= 1
  end
end

def game_over?
  if @life == 0
    puts "You have been defeated!!"
    false
  end

end

def start_game
  # puts "Choose a category"
  category, difficulty = get_category_difficulty
  # question = get_random_question_from_api
  # question = get_question(category, difficulty)
  # binding.pry
  questions = generate_questions(category, difficulty)
  asker(questions)

end

def get_category_difficulty
  Question.display_categories
  puts "Choose a catergory (leave blank for all)"
  category = $stdin.gets.chomp
  Question.display_difficulty
  puts "Choose a difficulty (leave blank for all)"
  difficulty = $stdin.gets.chomp.downcase
  return category, difficulty
end

def generate_questions(category, difficulty)
  # category, difficulty = get_category_difficulty

  questions_array = []
  until questions_array.length == 4
    question = get_question(category, difficulty)
    question["style"] = question.delete("type")
    # binding.pry
    q = Question.find_or_create_by(question)
    if !validate_question(q)
      questions_array << q
    end
  end

  questions_array
end

#validate_question methods returns a true / false value
def validate_question(question)# current_player)
  !!QuestionMaster.find_by(question_id: question.id, player_id: @current_player.id)
end

def asker(q_array)
  # binding.pry
  q_array.each do |q|
    puts q["question"]
    puts q["correct_answer"]
    JSON.parse(q["incorrect_answers"]).each do |answer|
      puts answer
    end
    QuestionMaster.create(question_id: q.id, player_id: @current_player.id)
    answer = $stdin.gets.chomp.downcase
    if answer == "exit"
      exit
    end
    correct?(q, answer)
    break if game_over?
  end
end

def asked?(q)

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
  else
    puts "Please enter a valid number"
  end
end

##BATMAN NEEDS YOUR HELP AGAINST RIDDLER
##TITLE: ORACLE

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
