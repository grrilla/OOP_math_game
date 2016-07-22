require_relative 'math_game.rb'

def main
  # create and introduce game
  game = MathGame.new
  puts "\nWelcome to Math Face-Off!\n"

  keep_playing = true
  while keep_playing
  
    # accept players into game
    while true
      puts ""
      print "Enter a player's name, or nothing if you've added all players: "
      input = gets.chomp
      break if input == ""
      game.add_player(input)
    end
    
    # ensure at least one player was entered
    if game.players.length > 0
      
      puts "\nLet's get started!"

      # begin turn loop
      while true

      	# get this turns problem and player
        problem = MathGame.generate_problem
        active_player = game.players[game.active_player] 
        
        # pose question and retrieve player response
        puts "\n#{active_player.name}'s question: #{problem[:question]} = ?"
        print "> "
        input = gets.chomp
        
        # check answer
        if input.to_i == problem[:answer]
          puts "Correct! 1 point awarded to #{active_player.name}"
          active_player.win_point
        else
          puts "Incorrect! #{active_player.name} loses a life!"
          active_player.lose_life
          # check to see if that ended the game
          winner = game.game_over?
          if winner
          	puts "\nThat's the game! #{winner} wins!"
          	puts ""
          	puts game.to_s
          	break
          else
            puts "\n#{game.to_s}\n"
          end
        end
        #game didn't end so go to next player before next iteration
        game.next_player

      end # turn loop
    
    else
      puts "Uh oh! You didn't enter any players!\n"
    end # if game.players.length > 0
    
    while true
      puts "\nPlay again? [Y/N]"
      input = gets.chomp.downcase
      case input
      when 'y' then break
      when 'n' then
      	keep_playing = false
      	break
      end
    end

  end # keep_playing game loop
end

main