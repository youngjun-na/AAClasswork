class TowersOfHanoi
  def initialize
    @board = [[3,2,1], [], []]
  end

  def turn
    begin
      print "Enter a starting position: "
      start = gets.chomp
      puts
      print "Enter an ending position"
      ending = gets.chomp
      if valid_move?(start, ending)
        ending.push(start.pop)
      else
        puts "Not a valid move. Try again"
      end
    # rescue
    #   retry
    end
  end

  def valid_move?(start, ending)
    ending.empty? || start.last < ending.last
  end

  def won?
    @board[2] == [3,2,1]
  end

  def run
    until won?
      turn
    end
    puts "Congrats! You won!"
  end

end

hanoi = TowersOfHanoi.new
hanoi.run