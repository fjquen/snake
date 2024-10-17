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
        
        
    end

    def button_down(id)
        case id
            when Gosu::KB_RIGHT
                @controlSnake.executeRight()
                @direction = :executeRight
            when Gosu::KB_LEFT
                @controlSnake.executeLeft()
                @direction = :executeLeft
            when Gosu::KB_UP
                @controlSnake.executeUp()
                @direction = :executeUp
            when Gosu::KB_DOWN
                @controlSnake.executeDown()
                @direction = :executeDown
        end
    end

    def draw 
        Gosu.draw_rect(@getPositionSnake.positionSnake["x"], @getPositionSnake.positionSnake["y"], @getPositionSnake.positionSnake["w"], @getPositionSnake.positionSnake["h"],Gosu::Color::RED)
    end
end