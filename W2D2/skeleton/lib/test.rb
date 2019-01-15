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
      pebble = moved.shift

      # if true_idx == @p1_idx
      #   @cups[true_idx].push(pebble)
      #   true_idx += 1 unless moved.empty?
      # end

      if true_idx == @p2_idx
        true_idx += 1
      end 

       
      @cups[true_idx].push(pebble)
      true_idx += 1 unless moved.empty?
      

      if moved.count == 0
        # debugger
        render
        return next_turn(true_idx) 
      end 
    end 

    # render
  end