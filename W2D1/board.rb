require_relative 'piece'
require_relative 'null_piece'

class Board
  def initialize
    @board = blank_grid

  end

  def blank_grid
    Array.new(8) { Array.new(8) {NullPiece.new}}
  end

  def set_pieces
    royals = [Piece.new] * 8
    pawns = [Piece.new] * 8
    @board[-1] = royals
    @board[0] = royals.reverse
    @board[1] = pawns
    @board[-2] = pawns
  end

  def move_piece(start_pos, end_pos)
    begin
      x1, y1 = start_pos
      x2, y2 = end_pos

      @board[x1][y1], @board[x2][y2] = @board[x2][y2], @board[x1][y1]

    rescue ArgumentError
      puts "No piece found." if @board[start_pos].is_a?(NullPiece)
      puts "Please enter valid start position. (x, y)"
      start_pos = gets.chomp.split(",").each {|num| num.to_i }
    retry
    end
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end

  def in_bounds(start_pos, new_pos)
    Cursor.cursor_pos = 
  end
end
