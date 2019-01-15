class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @p1_idx = 6
    @player2 = name2
    @p2_idx = 13
    @cups = Array.new(6){Array.new(4){:stone}} + [[]] + Array.new(6){Array.new(4){:stone}} + [[]]
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos < 0 
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end 
  end

  require "byebug"
  def make_move(start_pos, current_player_name)
    moved = @cups[start_pos]
    @cups[start_pos] = []
    # debugger
    true_idx = start_pos + 1

    if current_player_name == @player1
      @p1_idx, @p2_idx = 6, 13
    elsif current_player_name == @player2
      @p1_idx, @p2_idx = 13, 6
    end 

    until moved.empty?
      true_idx %= 14

      # if true_idx == @p1_idx
      #   @cups[true_idx].push(pebble)
      #   true_idx += 1 unless moved.empty?
      # end
      if true_idx == @p2_idx
        true_idx += 1
      else 
        pebble = moved.shift
        @cups[true_idx].push(pebble)
        true_idx += 1 unless moved.empty?
      end

      if moved.count == 0
        # debugger
        render
        return next_turn(true_idx) 
      end 
    end 

    # render
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == @p1_idx
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end 
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    # render
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|e| e.empty?} || @cups[7..12].all? {|e| e.empty?}
  end

  def winner
    if @cups[6].count > @cups[13].count
      @player1
    elsif @cups[6] == @cups[13]
      :draw
    else 
      @player2
    end
  end
end
