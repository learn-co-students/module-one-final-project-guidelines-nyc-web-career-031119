require_relative '..lib/api_communicator'

jim = Player.create(name: jim)
catwoman = Player.create(name: catwoman)
duckowl = Player.create(name: duckowl)

5.times { Question.create (get_random_question_from_api)}

QuestionMaster.create(jim.id, Question.all.sample.id)
QuestionMaster.create(catwoman.id, Question.all.sample.id)
QuestionMaster.create(duckowl.id, Question.all.sample.id)
