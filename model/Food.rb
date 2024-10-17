class Food
    def initialize()
        @foodPosition = []
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
          observer.updatePosition(@foodPosition)
        end
    end

    def foodPosition
        return @foodPosition
    end
end