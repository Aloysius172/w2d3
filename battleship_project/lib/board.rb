class Board
    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = (n * n)
    end
    
    def size
        @size
    end

    def [](indices)  
       @grid[indices[0]][indices[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    #PART 2

    def attack(position)
        
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        ships = @size / 4
        while  self.num_ships < ships
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            position = [row, col]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                      :N
                else
                      ele
                end
            end
        end
    end

  

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
