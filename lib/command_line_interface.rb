class CLI

  attr_accessor :user, :animal, :last_selected_species

  def initialize
    @user = nil
    @animal = nil
    @last_selected_species = nil
  end

  def greet
    puts '                   Welcome Friend, Thank you for helping our pets having a home!'
    puts
    puts
    puts "                                       Let's Begin!"
  end

  def get_user_name
    puts "Please enter username!"
    username_input = gets.chomp

    #finds repeater customer or create a new user
    @user = User.find_by(name: username_input)
    if @user
      puts "Welcome, back #{@user.name}!"
    else
      @user = User.create(name: username_input)
      puts "Hi #{@user.name}! Looks like it's your first time."
    end
  end

  def main_menu
    puts "Please select one of the following options"
      puts "1. See your Fosterings"
      puts "2. Foster A New Animal"
      puts "3. Exit"

      u_input = gets.chomp

      if u_input == "1"
        curr_user = User.find_by(name: @user.name)

        curr_user.animals.each_with_index do |animal, index|
          puts "#{index+1}. #{animal.name}"
        end



        # puts "Thank you for being an awesome Foster Parent"
        # puts "1. Edit A Fostering"
        # puts "2. Delete A Fostering"
        # puts "3. Return to Main Menu"
      elsif u_input == "2"
        select_species_menu
      elsif u_input == "3"
        exit
      end
  end


  def select_species_menu
    #user selects animal species to foster
    puts "Please, enter NUMBER to select an animal you will like to foster?"
      puts "1. Dog"
      puts "2. Cat"
      puts "3. Rabbit"
      puts "4. Parrot"
      puts "5. Guinea Pig"

    #picks number that associates with species user will like to foster
    species_input = gets.chomp

    #displays list of animals available to foster for each specie
    if species_input == "1"
      picks_list("Dog")
      @last_selected_species = "Dog"
      # array_of_dogs = Animal.where(species: "Dog")
      # puts ""
      # puts "Please choose from the available candidates!"
      # array_of_dogs.each_with_index do |dog, index|
      #   puts "#{index+1}. #{dog.name}"
      # end
    elsif species_input == "2"
      picks_list("Cat")
      @last_selected_species = "Cat"
    elsif species_input == "3"
      picks_list("Rabbit")
      @last_selected_species = "Rabbit"
    elsif species_input == "4"
      picks_list("Parrot")
      @last_selected_species = "Parrot"
    elsif species_input == "5"
      picks_list("Guinea Pig")
      @last_selected_species = "Guinea Pig"
    end
      #user picks animal name
      puts "Please TYPE name of animal you will like to foster!"
      animal_selection_name = gets.chomp.capitalize
      #method for misspelled name
      misspelled_name(animal_selection_name)
      #method_to_put_selection_attributes(animal_selection_name)
  end


     #refactored if loop ieration
     def picks_list(name)
       array_of_animals = Animal.where(species: name)
         puts "Please choose from the available candidates!"
          array_of_animals.each_with_index do |animal, index|
            puts "#{index+1}. #{animal.name}"
      end
    end

    def find_fosterings(id)
      a


    def method_to_put_selection_attributes(name)
      #need iterator to print out each attribute from array
      @animal = Animal.find_by(name: name)
      puts "Name: #{@animal.name}"
      puts "Birth Year: #{@animal.birth_year}"
      puts "Size: #{@animal.size}"
      puts "Gender: #{@animal.gender}"
      puts "Spayed or Neutered: #{@animal.spayed_neutered}"
      foster_option
    end

    def misspelled_name(name)
      if @animal = Animal.find_by(name: name)
        method_to_put_selection_attributes(name)
      else
        puts "Please enter a Valid name!"
        gets_input = gets.chomp.capitalize
        misspelled_name(gets_input)
      end
    end



    def foster_option
      puts "Would you like to foster the animal you selected? y/n"
      ans_input = gets.chomp.downcase

      if ans_input == "y"
        puts "Yassss!!!!!, The world needs more people like you!!!!!"
        time = foster_length
        fostering = Fostering.create(user_id: @user.id, animal_id: @animal.id, length_of_time: time)
         # binding.pry
        #  @user.fosterings
      elsif ans_input == "n"
        puts "Would you like to see another animal? y/n"
      end
        sec_input = gets.chomp.downcase
      if sec_input == "y"
        puts "Please TYPE name of animal you will like to foster!"
          # method_to_put_selection_attributes_two(animal_selection_name_two)
          # animal_selection_name_two = gets.chomp.capitalize
      else sec_input == "n"
        puts "Please, come back as we're always getting new animals to Foster."
      end

    end

    # def foster_mod
    #   input = gets.chomp
    # p  Fostering.find_by :name input
    # end


  def foster_length
    puts
    puts " Enter NUMBER to indicate how long you can foster this bundle of joy!"
    puts "1. One week"
    puts "2. Two weeks"
    puts "3. Three weeks"
    puts "4. Four weeks"
    puts "5. Five weeks"

    foster_length_input = gets.chomp

    if foster_length_input == "1"
      puts "You're amazing human. Thank you for sharing your home for 1 week!"
      return "1 week"
      exit
    elsif foster_length_input == "2"
      puts "You're amazing human. Thank you for sharing your home for 2 weeks!"
      return "2 weeks"
    elsif foster_length_input =="3"
      puts "You're amazing human. Thank you for sharing your home for 3 weeks!"
      return "3 weeks"
    elsif foster_length_input == "4"
      puts "You're amazing human. Thank you for sharing your home for 4 weeks!"
      return "4 weeks"
    elsif foster_length_input == "5"
      puts "You're amazing human. Thank you for sharing your home for 5 weeks!"
      return "5 weeks"
    end

  end


end
end
