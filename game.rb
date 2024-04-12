class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player_index = 0
  end

  def start_game
    loop do
      current_player = @players[@current_player_index]
      math_problem = MathProblem.new  # Create a new MathProblem object for each turn
      puts "#{current_player.name}, here's your question:"
      puts math_problem.generate_problem

      user_answer = gets.chomp

      current_player.answer_question(math_problem, user_answer)

      @players.each { |player| puts "#{player.name}'s Score: #{player.score}, Lives: #{player.lives}" }

      break if game_over?
      
      switch_turn
    end

    announce_winner
  end

  private

  def switch_turn
    @current_player_index = (@current_player_index + 1) % @players.length
  end

  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end

  def announce_winner
    winner = @players.find { |player| player.lives > 0 }
    puts "#{winner.name} wins! Final scores:"
    @players.each { |player| puts "#{player.name}'s Score: #{player.score}, Lives: #{player.lives}" }
  end
end