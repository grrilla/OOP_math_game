class Player

  attr_reader :name, :player_num, :score, :lives 

  def initialize(name, player_num, score, lives)
    @name = name
    @player_num = player_num
    @score = score
    @lives = lives
  end

  def win_point
    @score += 1
  end

  def lose_life
    @lives -= 1
  end

  def lost?
    @lives == 0
  end

  def to_s
    "#{@name.ljust(15)}Points:#{@score.to_s.ljust(5)}Lives:#{@lives}"
  end

end