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
 
    def updatePosition(positionSnake)
        @getPositionSnake.positionSnake = positionSnake
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
                @direction = :executeRight
            when Gosu::KB_LEFT
                @direction = :executeLeft
            when Gosu::KB_UP
                @direction = :executeUp
            when Gosu::KB_DOWN
                @direction = :executeDown
        end
    end

    def draw 
        Gosu.draw_rect(@getPositionSnake.positionSnake["x"], @getPositionSnake.positionSnake["y"], @getPositionSnake.positionSnake["w"], @getPositionSnake.positionSnake["h"],Gosu::Color::RED)
    end
end