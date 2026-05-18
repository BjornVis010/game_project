function love.load()

    player = {} -- creates a Player
    -- place player
    player.x = 50
    player.y = 50
    player.speed = 2 -- decides player speed
    

end

function love.update(dt)

end

function love.draw()
    player = love.graphics.circle("fill", 10, 10, 10)
end