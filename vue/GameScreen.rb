require 'gosu'


class GameScreen < Gosu::Window
    def initialize
        super 640,480,false
        @controlSnake = ControlSnake.new()
        @controlFood = ControlFood.new()
        @getMove = MoveSave
        @tabMoveSnake = ControlSnake.instance_methods(false).select { |function|  function != :updatePosition  }
        @ranDirection = @tabMoveSnake[rand(0..@tabMoveSnake.length-1)]
        @direction
    end
 
    def updatePosition(positionSnake, positionSegment)
        @getMove.positionSnake = positionSnake
        @getMove.positionSegment = positionSegment
    end

    def updatePositionFood(positionFood)
        @getMove.positionFood = positionFood
    end

    def update
        if @direction.nil?
            @controlSnake.send(@ranDirection)
        else
            @controlSnake.send(@direction)
        end

        if @getMove.positionFood.size<25
          @getMove.positionFood.push({"x" => rand(0..640), "y" => rand(0..480),"w" => 30,"h" => 30})
        end


        
        
          @controlSnake.eat(@getMove.positionFood,@getMove.positionSnake)

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
        Gosu.draw_rect(@getMove.positionSnake["x"], @getMove.positionSnake["y"], @getMove.positionSnake["w"], @getMove.positionSnake["h"],Gosu::Color::RED)
        @getMove.positionFood.each { |n| Gosu.draw_rect(n["x"], n["y"], n["w"], n["h"],Gosu::Color::BLUE) }
        if !@getMove.positionSegment.empty?
            @getMove.positionSegment.each { |n| 
                 Gosu.draw_rect(n["x"], n["y"], n["w"], n["h"],Gosu::Color::GREEN)
            }
        end
    end
end