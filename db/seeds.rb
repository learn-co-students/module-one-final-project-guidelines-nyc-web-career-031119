
#User Instances
u1 = User.create(name: "maria")
u2 = User.create(name: "johhny")
u3 = User.create(name: "bill")
u4 = User.create(name: "haley")
u5 = User.create(name: "luke")


#Dog insances
a1 = Animal.create(species: "Dog", name: "Spike", birth_year: 2, size: "Large", gender: "Male", spayed_neutered: false)
a2 = Animal.create(species: "Dog", name: "Fluffy", birth_year: 1, size: "Small", gender: "Female", spayed_neutered: false)
a3 = Animal.create(species: "Dog", name: "Lassie", birth_year: 3, size: "Small", gender: "Female", spayed_neutered: true)
a4 = Animal.create(species: "Dog", name: "Spiegel", birth_year: 5, size: "Medium", gender: "Male", spayed_neutered: true)
a5 = Animal.create(species: "Dog", name: "Princess", birth_year: 8, size: "Medium", gender: "Female", spayed_neutered: true)


#Cat Instances
a6 = Animal.create(species: "Cat", name: "Batman", birth_year: 7, size: "Large", gender: "Male", spayed_neutered: true)
a7 = Animal.create(species: "Cat", name: "Robin", birth_year: 2, size: "Small", gender: "Male", spayed_neutered: false)
a8 = Animal.create(species: "Cat", name: "Alfred", birth_year: 3, size: "Medium", gender: "Male", spayed_neutered: true)
a8 = Animal.create(species: "Cat", name: "Sally", birth_year: 4, size: "Medium", gender: "Female", spayed_neutered: false)
a10 = Animal.create(species: "Cat",name: "Maggie", birth_year: 5, size: "Large", gender: "Female", spayed_neutered: false)

#Rabbit Instances
a11 = Animal.create(species: "Rabbit", name: "Kitty", birth_year: 1, size: "Small", gender: "Female",spayed_neutered: true)
a12 = Animal.create(species: "Rabbit", name: "Mickey", birth_year: 6, size: "Medium", gender: "Male",spayed_neutered: true)
a13 = Animal.create(species: "Rabbit", name: "Minnie", birth_year: 3, size: "Medium", gender: "female",spayed_neutered: true)
a14 = Animal.create(species: "Rabbit", name: "Donnie", birth_year: 2, size: "Small", gender: "Male",spayed_neutered: true)
a15 = Animal.create(species: "Rabbit", name: "Marky", birth_year: 4, size: "Large", gender: "Male",spayed_neutered: true)

#Parrot Instances
a16 = Animal.create(species: "Parrot", name: "Chucky", birth_year: 1, size: "Small", gender: "Male", spayed_neutered: false)
a17 = Animal.create(species: "Parrot", name: "Bruce", birth_year: 10, size: "Small", gender: "Male", spayed_neutered: true)
a18 = Animal.create(species: "Parrot", name: "Kurt", birth_year: 3, size: "Small", gender: "Male", spayed_neutered: false)
a19 = Animal.create(species: "Parrot", name: "Jackie" , birth_year: 8, size: "Small", gender: "Female", spayed_neutered: true)
a20 = Animal.create(species: "Parrot", name: "Debbs", birth_year: 4, size: "Small", gender: "Female", spayed_neutered: true)

#Guinea pig
a21 = Animal.create(species: "Guinea pig", name: "zack", birth_year: 3, size: "Medium", gender: "Male", spayed_neutered: false)
a22 = Animal.create(species: "Guinea pig", name: "kimberly", birth_year: 4, size: "Medium", gender: "Female", spayed_neutered: false)
a23 = Animal.create(species: "Guinea pig", name: "billy", birth_year: 3, size: "Medium", gender: "Male", spayed_neutered: false)
a24 = Animal.create(species: "Guinea pig", name: "trini", birth_year: 4, size: "Medium", gender: "Female", spayed_neutered: false)
a25 = Animal.create(species: "Guinea pig", name: "jason", birth_year: 3, size: "Medium", gender: "Male", spayed_neutered: false)


#fosterings Instances
f1 = Fostering.create(user_id: u1.id, animal_id: a1.id, length_of_time: "one weeek")
f2 = Fostering.create(user_id: u2.id, animal_id: a6.id, length_of_time: "two weeeks")
f3 = Fostering.create(user_id: u3.id, animal_id: a11.id, length_of_time: "one month")
f4 = Fostering.create(user_id: u4.id, animal_id: a15.id, length_of_time: "four weeks")
f5 = Fostering.create(user_id: u5.id, animal_id: a22.id, length_of_time: "eight weeks")
f6 = Fostering.create(user_id: u5.id, animal_id: a2.id, length_of_time: "eight weeks")
