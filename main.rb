require_relative 'math_game.rb'
require_relative 'math_problem.rb'
require_relative 'turn.rb'

def main
  puts "\nWelcome to Math Face-Off!"
  
  keep_playing = true
  while keep_playing
    
    game = MathGame.new  
    
    # accept players into game
    begin
      print "\nEnter a player's name, or nothing if you've added all players: "
      input = gets.chomp.strip
      game.add_player(input) if !input.empty?
    end while !input.empty?

    # ensure at least one player was entered
    if game.players.length > 0

      puts "\nLet's get started!"

      # begin turn loop
      winner = nil
      until winner
      	turn = Turn.new(game)
        puts "\n#{turn.player.name}'s question: #{turn.problem.question} = ?"
        print "> "
        input = gets.chomp.strip
        puts turn.turn_result(input.to_i)
        winner = game.we_have_a_winner
        if winner
          puts "\nThat's the game! #{winner} wins!"
      	  puts "\n#{game.to_s}"
        end
  	    game.next_player
      end # turn loop

    else
      puts "Uh oh! You didn't enter any players!\n"
    end # if game.players.length > 0

    begin
      puts "\nPlay again? [Y/N]"
      input = gets.chomp.strip.downcase
      keep_playing = false if input == 'n'
    end while input != 'y' && input != 'n'

  end # keep_playing game loop
end

main # call main