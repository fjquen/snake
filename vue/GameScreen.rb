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
        
        # if @getPositionSnake.positionTailSnake[0]["x"] < @getPositionSnake.positionSnake["x"] and @ranDirection == :executeRight
        #     @getPositionSnake.positionTailSnake[0]["x"]+=4
        # elsif @getPositionSnake.positionTailSnake[0]["x"] > @getPositionSnake.positionSnake["x"] and @ranDirection == :executeLeft
        #     @getPositionSnake.positionTailSnake[0]["x"]-=4
        # elsif @getPositionSnake.positionTailSnake[0]["y"] > @getPositionSnake.positionSnake["y"] and @ranDirection == :executeUp
        #     @getPositionSnake.positionTailSnake[0]["y"]-=4
        # elsif @getPositionSnake.positionTailSnake[0]["y"] < @getPositionSnake.positionSnake["y"] and @ranDirection == :executeDown
        #     @getPositionSnake.positionTailSnake[0]["y"]+=4
        # end

        # if @getPositionSnake.positionTailSnake[0]["x"] < @getPositionSnake.positionSnake["x"] and @direction == :executeRight
        #     @getPositionSnake.positionTailSnake[0]["x"]+=4
        # elsif @getPositionSnake.positionTailSnake[0]["x"] > @getPositionSnake.positionSnake["x"] and @direction == :executeLeft
        #     @getPositionSnake.positionTailSnake[0]["x"]-=4
        # elsif @getPositionSnake.positionTailSnake[0]["y"] > @getPositionSnake.positionSnake["y"] and @direction == :executeUp
        #     @getPositionSnake.positionTailSnake[0]["y"]-=4
        # elsif @getPositionSnake.positionTailSnake[0]["y"] < @getPositionSnake.positionSnake["y"] and @direction == :executeDown
        #     @getPositionSnake.positionTailSnake[0]["y"]+=4
        # end
    end

    def button_down(id)
        case id
            when Gosu::KB_RIGHT
                @controlSnake.executeRight()
                @direction = :executeRight
                @getPositionSnake.positionTailSnake.push(@getPositionSnake.positionSnake)
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
        if !@getPositionSnake.positionTailSnake.empty?()
            @getPositionSnake.positionTailSnake.each do |tail|
                Gosu.draw_rect(tail["x"], tail["y"], tail["w"], tail["h"],Gosu::Color::BLUE)
            end
        end
    end
end