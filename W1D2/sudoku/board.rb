require_relative "tile"

class Board

  def initialize
    @grid = Array.new(9) { Array.new }
    populate_grid("sudoku1.txt")
  end

  def populate_grid(filename)
    file_input = File.readlines(filename)
    file_input.each_with_index do |line, l_idx|
      line = line.chomp
      line.each_char do |chr|
        is_fixed = !chr.to_i.zero?
        @grid[l_idx] << Tile.new(chr.to_i, is_fixed)
      end
    end
  end

  def render
    @grid.each do |row|
      row.each do |tile|
        print "| #{tile} "
      end
      print "|\n"
    end
  end

  def play_move(pos, new_value)
    @grid[pos[0]][pos[1]].value = new_value
  end

  def won?

  end

  def fixed?(pos)
    @grid[pos[0]][pos[1]].bool_fixed
  end

  def full?
    @grid.flatten.none? { |tile| tile.value.zero? }
  end

  def row(pos)
    @grid[pos[0]]
  end

  def column(pos)
    column = []
    @grid.each { |row| column << row[pos[1]] }
  end

  def sector(pos)
    sector = []
    case pos[0]
    when (0..2).cover?
      sector = @grid[0..2]
    when (3..5).cover?
      sector = @grid[3..5]
    when (6..8).cover?
      sector = @grid[6..8]
    end
    case pos[1]
    when (0..2).cover?
      sector.map! { |row| row.slice(0, 3) }
    when (3..5).cover?
      sector.map! { |row| row.slice(3, 3) }
    when (6..8).cover?
      sector.map! { |row| row.slice(6, 3) }
    end
    sector.flatten
  end



end
