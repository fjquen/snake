class ControlSnake
    def initialize
        @getPositionSnake = MoveSave
    end

    def updatePosition(positionSnake, positionTail)
        @getPositionSnake.positionSnake = positionSnake
        @getPositionSnake.positionTailSnake = positionTail
    end


    def executeRight
        @getPositionSnake.positionSnake["x"]+=4
    end


    def executeLeft
        @getPositionSnake.positionSnake["x"]-=4
    end

    def executeUp
        @getPositionSnake.positionSnake["y"]-=4
    end

    def executeDown
        @getPositionSnake.positionSnake["y"]+=4
    end
end