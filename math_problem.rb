require_relative 'math_game.rb'
require_relative 'math_problem.rb'

class MathProblem

  MAX_VALUE = 20
  OPERATORS = [:+, :-, :*]

  attr_reader :question

  def initialize
    value1 = rand(MAX_VALUE) + 1
  	operator = OPERATORS[rand(OPERATORS.length)] 
  	value2 = rand(MAX_VALUE) + 1
    @question = "#{value1} #{operator.to_s} #{value2}"
    @answer = value1.send(operator,value2)
  end

  def correct_answer?(response)
  	response == @answer
  end

end