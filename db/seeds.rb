require_relative '..lib/api_communicator'

jim = Player.create(name: jim)
catwoman = Player.create(name: catwoman)
duckowl = Player.create(name: duckowl)

15.times { Question.create_or_find_by (get_random_question_from_api)}

2.times {QuestionMaster.create(jim.id, Question.all.sample.id)}
2.times {QuestionMaster.create(catwoman.id, Question.all.sample.id)}
2.times {QuestionMaster.create(duckowl.id, Question.all.sample.id)}
