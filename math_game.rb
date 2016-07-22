require_relative 'player.rb'

class MathGame

  STARTING_LIVES = 3
  STARTING_POINTS = 0

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

  def we_have_a_winner
    @players.each do |p| 
      if p.lost?
      	@players.sort_by! { |p| [-p.lives, -p.score] }
        return @players.first.name
      end
    end
    return nil
  end

end 