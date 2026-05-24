function love.load()
    anim8 = require 'libraries/anim8'

    love.graphics.setDefaultFilter("nearest", "nearest") -- makes sprite less blurry

    player = {} -- creates a Player
    -- place player
    player.x = 50
    player.y = 50
    player.speed = 2 -- decides player speed
    player.spritesheet = love.graphics.newImage('sprites/player-sheet.png')
    player.grid = anim8.newGrid(12, 18, player.spritesheet:getWidth(), player.spritesheet:getHeight())
    
    -- player animations
    player.animations = {}

    player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2)
    player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), 0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.2)

    player.anim = player.animations.down

    love.graphics.setBackgroundColor(0.4, 0.4, 0.4, 1)
end

function love.update(dt)
    -- static
    local isMoving = false

    -- movement
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.y = player.y - player.speed
        player.anim = player.animations.up
        isMoving = true
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.x = player.x - player.speed
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.x = player.x + player.speed
        player.anim = player.animations.right
        isMoving = true
    end

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    player.anim:update(dt) -- updates to show the animation of your sprite

end

function love.draw()
    -- background = love.graphics.newCanvas(1400, 1400, love.graphics.getColor('FF9A9A9A'))
    player.anim:draw(player.spritesheet, player.x, player.y, nil, 4, nil, 4, 0.2)
end