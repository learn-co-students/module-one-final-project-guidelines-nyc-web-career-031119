class CLI

  attr_accessor :user

  def initialize
    @user = nil
  end

  def greet
    puts '                   Welcome Friend, Thank you for helping our pets get adhopted!'
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


  def select_species_menu
    #user selects animal species to foster
    puts "Please, select an animal you will like to foster?"
      puts "1. Dog"
      puts "2. Cat"
      puts "3. Rabbit"
      puts "4. Parrot"
      puts "5. Guinea Pig"

      puts

    #picks number that associates with species user will like to foster
    species_input = gets.chomp


    #displays list of animals available to foster for each specie
    if species_input == "1"
      array_of_dogs = Animal.where(species: "Dog")
      puts "Please choose from the available candidates!"
      array_of_dogs.each_with_index do |dog, index|
        puts "#{index+1}. #{dog.name}"
      end
    elsif species_input == "2"
      array_of_cats = Animal.where(species: "Cat")
        puts "Please choose from the available candidates!"
      array_of_cats.each_with_index do |cat, index|
        puts "#{index+1}. #{cat.name}"
      end
    elsif species_input == "3"
      array_of_rabbits = Animal.where(species: "Rabbit")
        puts "Please choose from the available candidates!"
      array_of_rabbits.each_with_index do |rabbit, index|
        puts "#{index+1}. #{rabbit.name}"
      end
    elsif species_input == "4"
      array_of_parrots = Animal.where(species: "Parrot")
        puts "Please choose from the available candidates!"
      array_of_parrots.each_with_index do |parrot, index|
        puts "#{index+1}. #{parrot.name}"
      end
    elsif species_input == "5"
      array_of_guinea_pigs = Animal.where(species: "Guinea pig")
        puts "Please choose from the available candidates!"
      array_of_guinea_pigs.each_with_index do |guinea_pig, index|
        puts "#{index+1}. #{guinea_pig.name}"
        end
      end
      #user picks animal name
      puts "Please TYPE name of animal you will like to foster!"
      animal_selection_name = gets.chomp
      method_to_put_selection_attributes(animal_selection_name)
    end

    def method_to_put_selection_attributes(name)
      #need iterator to print out each attribute from array
      animal = Animal.find_by(name: name)
      puts "Name: #{animal.name}"
      puts "Birth Year: #{animal.birth_year}"
      puts "Size: #{animal.size}"
      puts "Gender: #{animal.gender}"
      puts "Spayed or Neutered: #{animal.spayed_neutered}"
    end


    def foster_option
      puts "Would you like to foster the animal you selected?"
      ans_input = gets.chomp.capitalize

      if ans_input == "Yes"
        puts "Yassss, The world needs more people like you"
        foster_length
        binding.pry
      elsif ans_input == "No"
      end


    end


  def foster_length
    puts
    puts "Please, choose for how long you can foster this bundle of joy!"
    puts "1. One week"
    puts "2. Two weeks"
    puts "3. Three weeks"
    puts "4. Four weeks"
    puts "5. Five weeks"
    puts "6. Return to Main Menu"

    foster_length_input = gets.chomp

    if foster_length_input == "1"
      puts "You're amazing human. Thank you for sharing your home for 1 week!"
    elsif foster_length_input == "2"
      puts "You're amazing human. Thank you for sharing your home for 2 weeks!"
    elsif foster_length_input =="3"
      puts "You're amazing human. Thank you for sharing your home for 3 weeks!"
    elsif foster_length_input == "4"
      puts "You're amazing human. Thank you for sharing your home for 4 weeks!"
    elsif foster_length_input == "5"
      puts "You're amazing human. Thank you for sharing your home for 5 weeks!"
    elsif foster_length_input == "6"
       select_species_menu
    end
  end




def add_another_foster
  Puts

end

end
