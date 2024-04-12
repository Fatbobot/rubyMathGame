class MathProblem
  attr_reader :num1, :num2

  def initialize
    generate_numbers
  end

  def generate_problem
    "#{@num1} + #{@num2} = ?"
  end

  def correct_answer?(user_answer)
    user_answer.to_i == (@num1 + @num2)
  end

  private

  def generate_numbers
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end
end