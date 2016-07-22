class Turn

  attr_reader :player, :problem

  def initialize(game)
  	@game = game
    @player = game.players[game.active_player]
    @problem = MathProblem.new
  end

  def turn_result(user_response)
  	if @problem.correct_answer?(user_response)
  	  @player.win_point
  	  "Correct! 1 point awarded to #{@player.name}"
  	else
  	  @player.lose_life
  	  "Incorrect! #{@player.name} loses a life!\n\n#{@game.to_s}"
  	end
  end

end