    rbfiles = File.join("**", "*.rb")
    tab = Dir.glob(rbfiles)
    tabPath = tab.select { |path|  path != "index.rb"  }
    tabFile = []
    tabPathRelative = []
    tabPath.each { |nameFile| 
      tabFile.push(nameFile.split("/")[1].sub(".rb",""))
      tabPathRelative.push(nameFile.rjust(nameFile.length+2, "./"))
    }
    tabPathRelative.each { |namePathRelative| 
      require namePathRelative
    }
    
    snake = Snake.new()
    snake.subscribe(ControlSnake.new())
    snake.subscribe(GameScreen.new())
    snake.notify
    GameScreen.new().show