require './player'
require './questionSet'


class Game

  def generateQuestion
    num1 = rand(0..20)
    num2 = rand(0..20)
    question = QuestionSet.new("What does #{num1} plus #{num2} equal?", "#{num1+num2}")
    question
  end

  
  def play

    player1 = Player.new("Player 1")
    player2 = Player.new("Player 2")
    scorePlayerOne = 0
    scorePlayerTwo = 0
    isPlayerOneTurn = true

    while scorePlayerOne < 3 && scorePlayerTwo < 3
      puts "--- NEW TURN ---"
      if isPlayerOneTurn == true
        question = generateQuestion()
        puts "#{player1.name}: #{question.question}"
        #print question.question
        playerAnswer = $stdin.gets.chomp

        if playerAnswer == question.answer
          puts "#{player1.name}: Yes! You are correct."
          scorePlayerOne = scorePlayerOne + 1
          isPlayerOneTurn = false
          puts "P1: #{scorePlayerOne}/3 vs P2: #{scorePlayerTwo}/3"
        else 
          puts "#{player1.name}: Seriously? No!"
          isPlayerOneTurn = false
          puts "P1: #{scorePlayerOne}/3 vs P2: #{scorePlayerTwo}/3"
        end

      end

      puts "--- NEW TURN ---"
      if isPlayerOneTurn == false
        question = generateQuestion()
        puts "#{player2.name}: #{question.question}"
        playerAnswer = $stdin.gets.chomp

        if playerAnswer == question.answer
          puts "#{player2.name}: Yes! You are correct."
          scorePlayerTwo = scorePlayerTwo + 1 
          isPlayerOneTurn = true
          puts "P1: #{scorePlayerOne}/3 vs P2: #{scorePlayerTwo}/3"
        else 
          puts "#{player2.name}: Seriously? No!"
          isPlayerOneTurn = true
          puts "P1: #{scorePlayerOne}/3 vs P2: #{scorePlayerTwo}/3"
        end

      end

    end

    puts "--- GAME OVER ---"
    puts "Good bye!"
    exit(0)

  end

end


game = Game.new
puts game.play


