class Player
  attr_accessor :name, :losses

  def initialize(name)
    @name = name
    @losses = 0
  end

  def get_play(fragment)
    puts "Current fragment: #{fragment} \n#{@name}'s' guess:"
    letter = gets.chomp
    letter
  end

  def losses
    
  end

#   def challenge?(fragment)
#     valid_answer = false
#     will_challenge = false
#
#     while !valid_answer
#       puts "#{@name}, Do you want to challenge the fragment: #{fragment}?(y/n)"
#       answer = gets.chomp.downcase
#       if answer == 'y'
#         valid_answer = true
#         will_challenge = true
#       elsif answer == 'n'
#         valid_answer = true
#         will_challenge = false
#       else
#         valid_answer = false
#       end
#     end
#     will_challenge
#   end
end
