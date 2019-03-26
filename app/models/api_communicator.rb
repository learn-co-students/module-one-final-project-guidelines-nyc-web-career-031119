require 'JSON'
require 'rest-client'
require 'pry'

# class ApiCommunicator
  @categories = {
    "General Knowledge" => 9,
    "Entertainment: Books"=>10,
    "Entertainment: Film"=>11,
    "Entertainment: Music"=>12,
    "Entertainment: Musicals & Theatres"=>13,
    "Entertainment: Television"=>14,
    "Entertainment: Video Games"=>15,
    "Entertainment: Board Games"=>16,
    "Science & Nature"=>17,
    "Science: Computers"=>18,
    "Science: Mathematics"=>19,
    "Mythology"=>20,
    "Sports"=>21,
    "Geography"=>22,
    "History"=>23,
    "Politics"=>24,
    "Art"=>25,
    "Celebrities"=>26,
    "Animals"=>27,
    "Vehicles"=>28,
    "Entertainment: Comics"=>29,
    "Science: Gadgets"=>30,
    "Entertainment: Japanese Anime & Manga"=>31,
    "Entertainment: Cartoon & Animations"=>32
  }

  def get_question(amount,category)
    category_number = category_number(category_name)
    JSON.parse(RestClient.get("https://opentdb.com/api.php?amount=#{amount}&category=#{category_number}"))['results']
  end

  def get_random_question_from_api
    JSON.parse(RestClient.get('https://opentdb.com/api.php?amount=1'))['results']
  end

  def category_number(category_name)
    @categories[category_name]
  end

  def get_question_by_category(category_name)
    category_number = category_number(category_name)
    JSON.parse(RestClient.get("https://opentdb.com/api.php?amount=1&category=#{category_number}"))['results']
  end

  def get_question
    # category and difficulty are optional - get_question can take 0-2 args if defined
    # I think we should keep amount set to = 1 so it pulls random each time? - not sure about get_question(amount,category)
    # after question is pulled we can find_or_create_by in the question table
    # after quetion is pulled we can find_or_create_by in player table to determine whether or not they previously answered, if so, pull new quesiton with same args
    # call category_number method to add '&category=X' to API URL?
    # define and call question_difficulty method and dd to API URL?
  end

# end
