require './board'

class Tile
  POS_DIFF = [[0,-1],[1,-1],[1,0],[1,1],[0,1],[-1,1], [-1,0],[-1,-1]]
  attr_accessor :bombed, :flagged, :revealed, :pos
  
  def initialize(pos, board)
    @pos = pos # array of two  elements
    @bombed = false
    @flagged = false
    @revealed = false
    @board = board
  
  end
  
  # Returns true if reveal occurs, false otherwise 
  def reveal
    @revealed = true 
    if @bombed
      return false
    elsif neighbor_bomb_count == 0
      neighbors.each do |neighbor| 
        unless neighbor.revealed
          neighbor.reveal
        end  
      end    
      return true
    end      
  end
  
  def neighbors
    neighbor_pos = []
    
    POS_DIFF.each do |square_pos|
      x, y = square_pos
      my_x, my_y = @pos
      new_pos = [x + my_x, y + my_y]
      neighbor_pos << new_pos if @board.is_valid?(new_pos)
    end 
    
    neighbor_pos.map { |pos| @board.get_tile(pos) } 
  end 
  
  def neighbor_bomb_count 
    neighbors.select { |neigbor| neigbor.bombed }.count
  end 
      
  def to_s
    if @flagged
      return "F"
    elsif @revealed
      count = neighbor_bomb_count
      return count == 0 ? "_" : "#{count}" 
    else
      return "*"  
    end
  end
        
  end
  
  
    