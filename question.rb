# --------------------------------
# Question (behaviour)
  # generate new question for each turn pick numbers b/t (1..20)

  # METHODS (protected maybe?)
  # new_question => gets
  # answer => reads
  # need to know what the 'new_question' is
# --------------------------------
class Question
  attr_reader :new_question
  attr_accessor :answer

  def initialize
    @new_question = generate_question
  end

  # HAVE TO USE SELF FOR IT TO ASSIGN TO ANSWER NOT @ - attr has to be an accessor as well for self to work
  def generate_question
    operators = ['+', '-', '/', '*']
    random_number_1 = rand(20)
    random_number_2 = rand(20)
    selected_operator = operators[rand(4)].to_sym
    self.answer = random_number_1.public_send(selected_operator, random_number_2)
    "What is #{random_number_1} #{selected_operator} #{random_number_2} ?"
  end
end