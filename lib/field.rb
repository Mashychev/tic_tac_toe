class Field
  attr_reader :field

  def initialize
    @field = [['*', '*', '*'],
              ['*', '*', '*'],
              ['*', '*', '*']]
  end

  def show
    @field.each do |line|
      line.each do |item|
        print item + ' '
      end
      print "\n"
    end
  end

  def transpon
    field = [[], [], []]
    i = 0
    while i < 3
      j = 0
      while j < 3
        field[i][j] = @field[j][i]
        j += 1
      end
      i += 1
    end
    field
  end

  def diagonal1
    diag = []
    i = 0
    while i < 3
      j = 0
      while j < 3
        diag << @field[i][j] if i == j
        j += 1
      end
      i += 1
    end
    diag
  end

  def diagonal2
    diag = []
    i = 0
    while i < 3
      j = 0
      while j < 3
        diag << @field[i][j] if i + j == 2
        j += 1
      end
      i += 1
    end
    diag
  end
end
