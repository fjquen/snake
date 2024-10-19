class ControlSnake
    def initialize
        @getMove = MoveSave
        
    end

    def updatePosition(positionSnake)
        @getMove.positionSnake = positionSnake
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
              score = 0
              score+=10
              puts score
              true
            else
              false
            end
        end
    end
end