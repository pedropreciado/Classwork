class Game

  ALPHABET = ("a".."z").to_a

  attr_reader :player_1, :player_2, :fragment, :dictionary, :current_player

  def initialize(player_1, player_2, dictionary, fragment = "")
    @player_1 = player_1
    @player_2 = player_2
    @fragment = fragment
    @dictionary = dictionary
    @current_player = player_1
  end

  def current_player
    @current_player
  end

  def previous_player
    if current_player == @player_1
      return @player_2
    end
    @player_1
  end

  def next_player!
    @current_player = previous_player
  end

  def take_turn(player)
    play = ""
    while !ALPHABET.include?(play.downcase)
      play = player.get_play(@fragment)
    end
    play
  end

  def valid_play?(play)
    new_word = @fragment + play
    dictionary.each do |word|
      if word[0...new_word.length] == new_word
        return true
      end
    end
    false
  end

  def play
    
    won = false

    until won
      puts "Current player: #{@current_player.name}"
      letter = take_turn(@current_player)
      if !valid?(letter)
        won = true
      else
        @fragment << letter
        next_player!
      end
    end
    puts "#{@previous_player} won!"
  end
end

# if __FILE__ == $PROGRAM_NAME
