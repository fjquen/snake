class Food
    def initialize()
        @foodPosition = Array.new
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
          observer.updatePositionFood(@foodPosition)
        end
    end
end