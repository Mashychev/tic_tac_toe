class Game
  def initialize
    @players = []
    @players.push Player.new 'PlayerX', 'X'
    @players.push Player.new 'Player0', '0'
    @over = false
    @field = Field.new
    @winner = nil
  end

  def over?
    @field.field.each do |line|
      return @over = true if line == ['0', '0', '0'] || line == ['X', 'X', 'X']
    end
    @field.transpon.each do |line|
      return @over = true if line == ['0', '0', '0'] || line == ['X', 'X', 'X']
    end
    return @over = true if @field.diagonal1 == ['0', '0', '0'] || @field.diagonal1 == ['X', 'X', 'X']
    return @over = true if @field.diagonal2 == ['0', '0', '0'] || @field.diagonal2 == ['X', 'X', 'X']
    drawn_game
  end

  def drawn_game
    i = 0
    cell = 0
    while i < 3
      j = 0
      while j < 3
        cell += 1 if @field.field[i][j] != '*'
        j += 1
      end
      i += 1
    end
    return @over = true if cell == 9
  end

  def winner
    @field.field.each do |line|
      return @winner = @players[0] if line == ['X', 'X', 'X']
      return @winner = @players[1] if line == ['0', '0', '0']
    end
    @field.transpon.each do |line|
      return @winner = @players[0] if line == ['X', 'X', 'X']
      return @winner = @players[1] if line == ['0', '0', '0']
    end
    return @winner = @players[0] if @field.diagonal1 == ['X', 'X', 'X'] || @field.diagonal2 == ['X', 'X', 'X']
    return @winner = @players[1] if @field.diagonal1 == ['0', '0', '0'] || @field.diagonal2 == ['0', '0', '0']
  end

  def turn(i, j, player_sym)
    @field.field[i - 1][j - 1] = "#{player_sym}"
  end

  def play
    @field.show
    while @over == false
      @players.each do |player|
        puts "Your choise #{player.name}"
        print "Choise line: "
        i = gets.chomp.to_i
        print "Choise column: "
        j = gets.chomp.to_i
        turn(i, j, player.sym)
        system("clear")
        @field.show
        over?
        break if @over == true
      end
    end
    if winner != nil
      print "Winner is #{@winner.name}" if @winner
    else
      print "No winner" unless @winner
    end
  end
end
