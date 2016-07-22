require_relative 'player.rb'

class MathGame

  STARTING_LIVES = 3
  STARTING_POINTS = 0
  MAX_VALUE = 20
  OPERATORS = [:+, :-, :*]

  attr_reader :active_player
  attr_accessor :players, :turn_count

  def initialize
    @players = []
    @active_player = 0
  end

  def add_player(name)
    @players.push Player.new(name, @players.length, STARTING_POINTS, STARTING_LIVES) 
  end

  def next_player
    @active_player = (@active_player + 1) % @players.length # modulus operation prevents out of bounds
  end

  def to_s
    string = "Game State:\n===========\n"
    @players.each { |plyr| string << plyr.to_s << "\n" }
    string
  end

  # Static method which generates two random values between 1 and MAX_VALUE inclusive,
  # and then assigns a random operator form the array of permitted operators.
  # Returns the question as a string and problem as an int within a hash
  def self.generate_problem
  	value1 = rand(MAX_VALUE) + 1
  	operator = OPERATORS[rand(OPERATORS.length)] 
  	value2 = rand(MAX_VALUE) + 1
    problem = {
    	question: "#{value1} #{operator.to_s} #{value2}",
    	answer: value1.send(operator,value2)
    }
  end

  def game_over?
    @players.each do |p| 
      if p.lost?
      	@players.sort_by! { |p| p.score }
        @players.sort_by! { |p| p.lives }
        @players.reverse!
        return @players.first.name
      end
    end
    return nil
  end

end







