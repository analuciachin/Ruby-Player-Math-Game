class QuestionSet

  attr_accessor :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

end

# question1 = QuestionSet.new("What does 1 plus 2 equal?", "3")
# puts question1.question
# puts question1.answer