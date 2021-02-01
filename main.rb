require './player'
require './questionSet'

# player1 = Player.new("player1")
# puts player1.name

class Game

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end


  def generateQuestion
    num1 = rand(0..20)
    num2 = rand(0..20)
    question = QuestionSet.new("What does #{num1} plus #{num2} equal?", "#{num1+num2}")
    question
  end


  def isAnswerCorrect playerAnswer
    if playerAnswer == question.answer
      true
    else false
    end
  end

  
  def play
    scorePlayerOne = 0
    scorePlayerTwo = 0
    isPlayerOneTurn = true

    while scorePlayerOne < 3 && scorePlayerTwo < 3
      if isPlayerOneTurn == true
        question = generateQuestion()
        puts question.question
        playerAnswer = $stdin.gets.chomp

        if playerAnswer == question.answer
          puts "Yes! You are correct."
          scorePlayerOne = scorePlayerOne + 1
          isPlayerOneTurn = false
        else 
          puts "Seriously? No!"
          isPlayerOneTurn = false
        end

      end

      if isPlayerOneTurn == false
        question = generateQuestion()
        puts question.question
        playerAnswer = $stdin.gets.chomp

        if playerAnswer == question.answer
          puts "Yes! You are correct."
          scorePlayerTwo = scorePlayerTwo + 1 
          isPlayerOneTurn = true
        else 
          puts "Seriously? No!"
          isPlayerOneTurn = true
        end

      end

    end

    exit(0)

  end

end

# num1 = rand(0..20)
# num2 = rand(0..20)
# newQuestion = QuestionSet.new("What does #{num1} plus #{num2} equal?", "#{num1+num2}")
# puts newQuestion.question
# puts newQuestion.answer


game = Game.new
# puts game.generateQuestion.answer
# puts game.generateQuestion.question
puts game.play


