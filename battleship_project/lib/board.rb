class Board
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
            print "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end


    end
end
