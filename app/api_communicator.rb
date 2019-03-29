require 'rest-client'
require 'json'
require 'pry'

def get_show_from_api(show_name)
  response_string = RestClient.get('https://kitsu.io/api/edge/anime?page%5Blimit%5D=20&sort=-averageRating')
  response_hash = JSON.parse(response_string)

  show_name_hash = nil
  response_hash['data'].each do |list|
    break if show_name_hash != nil
    list['attributes']['titles'].each do |lang, title|
     if title.downcase.include?(show_name)
       show_name_hash = list
       # binding.pry
     end
   end

 end
    # list['attributes']['titles']['en'].downcase.include?(show_name)

  # binding.pry
#  end
  if show_name_hash
      show_name_hash['attributes']
  else
    puts "Show does not exist"
  end

end

def average_rating(show_name)
   attributes_hash = get_show_from_api(show_name)
    attributes_hash['averageRating']
end

def title(show_name)
  attributes_hash = get_show_from_api(show_name)
  if attributes_hash['titles']['en']
      attributes_hash['titles']['en']
    else
      attributes_hash['titles']['en_jp']
    end
end

def synopsis(show_name)
  attributes_hash = get_show_from_api(show_name)
   attributes_hash['synopsis']
end

def nice_print_format(show_name)
  puts "Title: #{title(show_name)}: Average Rating: #{average_rating(show_name)}"
  puts "☻ ღ " * 20
  puts "Synnopsis: #{synopsis(show_name)}"
end

# def valid_entry(show_name)
#   if get_show_from_api(show_name)
#     nice_print_format(show_name)
#   else
#     puts "g"
#   end
# end
