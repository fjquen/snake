require 'gosu'


class GameScreen < Gosu::Window
    def initialize
        super 640,480,false
        @controlSnake = ControlSnake.new()
        @getPositionSnake = MoveSave
        @tabMoveSnake = ControlSnake.instance_methods(false).select { |function|  function != :updatePosition  }
        @ranDirection = @tabMoveSnake[rand(0..@tabMoveSnake.length-1)]
        @direction
    end
 
    def updatePosition(positionSnake,positionTail)
        @getPositionSnake.positionSnake = positionSnake
        @getPositionSnake.positionTailSnake = positionTail
    end

    def update
        if @direction.nil?
            @controlSnake.send(@ranDirection)
        else
            @controlSnake.send(@direction)
        end

        if @getPositionSnake.positionTailSnake[0]["x"] < @getPositionSnake.positionSnake["x"] and @ranDirection == :executeRight
            @getPositionSnake.positionTailSnake[0]["x"]+=4
        elsif @getPositionSnake.positionTailSnake[0]["x"] > @getPositionSnake.positionSnake["x"] and @ranDirection == :executeLeft
            @getPositionSnake.positionTailSnake[0]["x"]-=4
        elsif @getPositionSnake.positionTailSnake[0]["y"] > @getPositionSnake.positionSnake["y"] and @ranDirection == :executeUp
            @getPositionSnake.positionTailSnake[0]["y"]-=4
        elsif @getPositionSnake.positionTailSnake[0]["y"] < @getPositionSnake.positionSnake["y"] and @ranDirection == :executeDown
            @getPositionSnake.positionTailSnake[0]["y"]+=4
        end

        if @getPositionSnake.positionTailSnake[0]["x"] < @getPositionSnake.positionSnake["x"] and @direction == :executeRight
            @getPositionSnake.positionTailSnake[0]["x"]+=4
        elsif @getPositionSnake.positionTailSnake[0]["x"] > @getPositionSnake.positionSnake["x"] and @direction == :executeLeft
            @getPositionSnake.positionTailSnake[0]["x"]-=4
        elsif @getPositionSnake.positionTailSnake[0]["y"] > @getPositionSnake.positionSnake["y"] and @direction == :executeUp
            @getPositionSnake.positionTailSnake[0]["y"]-=4
        elsif @getPositionSnake.positionTailSnake[0]["y"] < @getPositionSnake.positionSnake["y"] and @direction == :executeDown
            @getPositionSnake.positionTailSnake[0]["y"]+=4
        end
    end

    def button_down(id)
        case id
            when Gosu::KB_RIGHT
                @controlSnake.executeRight()
                @direction = :executeRight
                @getPositionSnake.positionSnake["x"] = @getPositionSnake.positionTailSnake[0]["x"] +50
            when Gosu::KB_LEFT
                @controlSnake.executeLeft()
                @direction = :executeLeft
                @getPositionSnake.positionSnake["x"] = @getPositionSnake.positionTailSnake[0]["x"] -50
            when Gosu::KB_UP
                @controlSnake.executeUp()
                @direction = :executeUp
                @getPositionSnake.positionSnake["y"] = @getPositionSnake.positionTailSnake[0]["y"] -50
            when Gosu::KB_DOWN
                @controlSnake.executeDown()
                @direction = :executeDown
                @getPositionSnake.positionSnake["y"] = @getPositionSnake.positionTailSnake[0]["y"] +50
        end
    end

    def draw 
        Gosu.draw_rect(@getPositionSnake.positionSnake["x"], @getPositionSnake.positionSnake["y"], @getPositionSnake.positionSnake["w"], @getPositionSnake.positionSnake["h"],Gosu::Color::RED)
        Gosu.draw_rect(@getPositionSnake.positionTailSnake[0]["x"], @getPositionSnake.positionTailSnake[0]["y"], @getPositionSnake.positionTailSnake[0]["w"], @getPositionSnake.positionTailSnake[0]["h"],Gosu::Color::BLUE)
    end
end