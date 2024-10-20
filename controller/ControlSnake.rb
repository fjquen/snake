class ControlSnake
    def initialize
        @getMove = MoveSave
        
    end

    def updatePosition(positionSnake, positionSegment)
        @getMove.positionSnake = positionSnake
        @getMove.positionSegment = positionSegment
    end


    def executeRight
        @getMove.positionSnake["x"]+=4
    end


    def executeLeft
        @getMove.positionSnake["x"]-=4
    end

    def executeUp
        @getMove.positionSnake["y"]-=4
    end

    def executeDown
        @getMove.positionSnake["y"]+=4
    end

    def eat(array,player)
        array.reject! do |food|
            if Gosu.distance(player["x"], player["y"], food["x"], food["y"]) < 35
             @getMove.positionSegment.push(player)
              true
            else
              false
            end
        end
    end
end