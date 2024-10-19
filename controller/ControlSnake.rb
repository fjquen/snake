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
end