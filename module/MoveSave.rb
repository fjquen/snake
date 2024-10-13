module MoveSave
    def self.positionSnake=(positionHeadSnake)
        @positionHeadSnake = positionHeadSnake
    end

    def self.positionSnake
        @positionHeadSnake
    end

    def self.positionTailSnake=(positionTailSnake)
        @positionTailSnake = positionTailSnake
    end

    def self.positionTailSnake
        @positionTailSnake
    end
end