require './tile'

class Board
  
  attr_reader :dimension
  
  def initialize(dimension, bombs)
    
    @dimension = dimension
    @num_bombs = bombs
    @grid = Array.new(@dimension) {Array.new(@dimension)}
    @grid.each_with_index do |row,i|
      row.each_index do |j|
        pos = [i, j]
        @grid[i][j] = Tile.new(pos, self)
      end 
    end 
    
    create_board
    
  end 
  
  def display
    print "    #{(0...@dimension).to_a.join(" ")}\n"
    transposed = @grid.transpose
    transposed.each_with_index do |col,index|
      puts "#{index} | #{col.join(" ")}"
    end
        
  end
  
  def won?
    correct_flags == @num_bombs
  end
  
  
  def create_board
    @grid.flatten.sample(@num_bombs).each{ |tile| tile.bombed = true }
  end
  
  def is_valid?(pos)
    x,y = pos
    (0...@dimension).include?(x) && (0...@dimension).include?(y)
  end
  
  def get_tile(pos)
    x, y = pos
    @grid[x][y]
  end 
  
  def set_bomb(pos)
    x,y = pos
    @grid[x][y].bombed = true
  end
  
  def remove_flag(pos)
    tile = get_tile(pos)
    unless tile.revealed && !tile.flagged
      tile.flagged = false
      true 
    else 
      false 
    end 
  end 

  def add_flag(pos)
    tile = get_tile(pos)
    unless tile.revealed && tile.flagged
      tile.flagged = true
      true
    else 
      false
    end   
  end 
  
  def reveal_tile(pos)
    states = {
      :game_over => false,
      :valid => true
    }
    
    tile = get_tile(pos)
    
    unless tile.flagged || tile.revealed
      if get_tile(pos).bombed
        states[:game_over] = true
      end 
      get_tile(pos).reveal
    else
      states[:valid] = false
      
    end
    states
  end
   
  #flags on bomb counter
  def correct_flags
    flags = 0
    @grid.each do |row|
      row.each do |tile|
        flags+=1 if tile.flagged && tile.bombed
      end
    end
    flags
  end
  
  def end_display
    print "    #{(0...@dimension).to_a.join(" ")}\n"
    transposed = @grid.transpose
    transposed.each_with_index do |row,index|
      new_row = row.map do |tile|
        tile.bombed ? "B" : tile.to_s
      end 
      puts "#{index} | #{new_row.join(" ")}"
    end
    
  end 
end

