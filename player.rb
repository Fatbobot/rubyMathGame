class Player
  attr_accessor :name, :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def answer_question(problem, user_answer)
    if problem.correct_answer?(user_answer)
      @score += 1
      puts "Correct! #{@name}'s score: #{@score}"
    else
      @lives -= 1
      puts "Incorrect! #{@name} loses a life. Lives remaining: #{@lives}"
    end
  end
end