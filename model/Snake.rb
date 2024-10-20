class Snake
    def initialize()
        @snakePosition = {"x" => 50, "y" => 50,"w" => 50,"h" => 50}
        @snakeSegment = []
        @listObservers = []
    end


    def subscribe(model)
        @listObservers.push(model)
    end

    def descscribe(model)
        @listObservers.delete(model)
    end

    def notify
        @listObservers.each do |observer|
          observer.updatePosition(@snakePosition,@snakeSegment)
        end
    end
end