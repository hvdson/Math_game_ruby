# This is the main entrypoint into the program
# It requires the other files/gems that it needs

# ----- MODULES ----- 
require './player'
require './question'

# ------------------------------------------------
# main.rb
# Math game for ruby
# ------------------------------------------------

# ------------------------------------------------
# calls upon all the classes and uses modules to dictate the game
# class: GameState 
  # initialized with player1, player2, is_finished?,
  # should keep track of who's turn it is and will call 'Turn' on that specific player
  # Held in a gameloop until one of the players has 0 lives
# ------------------------------------------------

# TODO: code reviewed - needs further refactoring - separate GameState from main.rb for further modularity
class GameState

  def initialize
    @player1 = nil
    @player2 = nil
    @finished = false
    @current_player = 1;
  end

  def is_correct?(player_answer, correct_answer)
    player_answer == correct_answer
  end

  def game_loop
    # --------- MAKE NEW PLAYERS ----------
    # could probably refactor this later
    print 'PLAYER 1: please enter your name: '
    player_1_name = gets.chomp
    @player1 = Player.new(player_1_name)

    print 'PLAYER 2: please enter your name: '
    player_2_name = gets.chomp
    @player2 = Player.new(player_2_name)
    
    while !(@finished)

      # --------- GET NEW QUESTION ----------
      question = Question.new()
      print "#{@current_player == 1 ? player_1_name : player_2_name}: #{question.new_question}: \n> "
      player_answer = gets.chomp
      puts "Player answer was: #{player_answer}. Actual answer was: #{question.answer}"

      # if player was wrong # minus 1 life from the corresponding player
      if !is_correct?(player_answer.to_i, question.answer)
        @current_player == 1 ? @player1.lives -= 1 : @player2.lives -= 1
        puts "U suck :("
      else
        puts "U smart :)"
      end

      # --------------- ANNOUNCE SCOREBOARD ----------------
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"

      # --------------- CHECK IF GAME OVER ----------------
      if @player1.lives == 0 || @player2.lives == 0
        @finished = true;
      else
        # switch players
        @current_player == 1 ? @current_player = 0 : @current_player = 1
        puts '----- NEW TURN -----'
      end
    end
    winner = @player1.lives > @player2.lives ? @player1 : @player2
    puts "Player: #{winner.name} wins with a score of #{winner.lives}/3"
    puts '----- GAME OVER -----'
  end
end

game = GameState.new
game.game_loop