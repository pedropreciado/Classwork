require_relative 'colorize'
require_relative 'cursor'

class Display
  attr_accessor :board

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
  end
end
