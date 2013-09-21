class Tic_Tac_Toe
  def initialize
    @board = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
  end

  def finish?
    possibilities = [
      row_0 = @board[0],
      row_1 = @board[1],
      row_2 = @board[2],
      col_0 = [@board[0][0], @board[1][0], @board[2][0]],
      col_1 = [@board[0][1], @board[1][1], @board[2][1]],
      col_2 = [@board[0][2], @board[1][2], @board[2][2]],
      diagonal_0 = [@board[0][0],@board[1][1],@board[2][2]],
      diagonal_1 = [@board[0][2],@board[1][1],@board[2][0]]
    ]
    possibilities.each do |winning_line|
      if winning_line.all? { |elements| elements == "x"} || winning_line.all? { |elements| elements == "x"}
        return true
      end
    end
    if !@board.flatten.include?(nil)
      return true
    end
    false
  end

  def run
    until finish?
      print "Player 1, choose your move"
      player_move = gets.chomp.scan(/\d/).map { |char| char.to_i }


      if legal_move?(player_move)
        @board[player_move[0]][player_move[1]] = "x"
      else
        next
      end

      computer_move = [rand(3), rand(3)]
      until legal_move?(computer_move)
        computer_move = [rand(3), rand(3)]
      end

      @board[computer_move[0]][computer_move[1]] = "o"
      display
    end

    display
  end

  def display
    print "#{@board[0]}\n#{@board[1]}\n#{@board[2]}\n"
  end

  def legal_move?(move)
    if move.any? { |element| element > 2 }
      return false
    elsif @board[move[0]][move[1]]
      return false
    end
    true
  end

end