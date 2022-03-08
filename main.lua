--[[
This is Not a Brick Breaker Game

Author: Ali Alparslan
ali.alparslan@outlook.com

Brick Breaker originally programmed as "Breakout" by Atari in 1976.
There is a paddle, a ball, and a lot of bricks.
The paddle is at the bottom of the screen, the bricks are stacked on top, and the ball moves between the bricks and the paddle.
The paddle is under the player's control. The player has 3 lives. The goal is to break all the bricks. 
While doing this, the ball must not pass behind the paddle. If this happens, the player loses one life.

However...

as i said, this is 'Not a Brick Breaker Game'. In this game, you cannot even see a tiny piece of brick. 
The only goal in this game is to get the highest score without missing the ball behind the racket. 
You can track how many times you hit the ball from the top left corner. Remember, the ball is getting faster and faster!
]]

function love.load()
    love.window.setTitle('This is Not a Brick Breaker Game') --the title of the window
    math.randomseed(os.time())  --it is important for absoulute randomness

    sounds = {
        ['paddle'] = love.audio.newSource('sounds/Paddle.wav', 'static'),
        ['wall'] = love.audio.newSource('sounds/Wall.wav', 'static'),
        ['gameover'] = love.audio.newSource('sounds/Gameover.wav', 'static')
    }

    windows = {}
    windows.width = 800
    windows.height = 600
    windows.base = 530

    paddle = {}
    paddle.x = 400
    paddle. y = 530
    paddle.width = 150
    paddle.height = 12
    paddle.speed = 5
    
    ball = {}
    ball.x = 400
    ball.y = 300
    ball.radius = 4
    ball.speedx = (math.random(2) == 1 and -100 or 100)*2                         
    ball.speedy = (math.random(2) == 1 and math.random(-80, -100) or math.random(80, 100))*2
    
    hit_counter = 0
    increment = 1.05

    state = 'pause'
end

function love.update(dt)

    -- Paddle movement
    if love.keyboard.isDown('a') then
        paddle.x = paddle.x - paddle.speed
    end
    if love.keyboard.isDown('d') then
        paddle.x = paddle.x + paddle.speed
    end
        --Paddle Restrictions
    if paddle.x < 0 then
        paddle.x = 5
    elseif paddle.x > windows.width - paddle.width then
        paddle.x = windows.width - paddle.width - 5
    end

    -- Ball movement
    if state == 'play' then
        ball.x = ball.x + ball.speedx*dt
        ball.y = ball.y + ball.speedy*dt
    else
        ball.x = ball.x
        ball.y = ball.y
    end

    --Ball and Paddle Collision
    if coll_ball_paddle() == true then
        ball.speedy = ball.speedy * -1 * increment
        ball.speedx = ball.speedx + 5*(ball.x -(paddle.x + (paddle.width/2)))
        sounds['paddle']:play()
        hit_counter = hit_counter + 1
    end

    -- Ball and Wall Collision
    if coll_ball_wally() == true then
        ball.speedy = ball.speedy * -1 * increment
        sounds['wall']:play()
    end
    
    if coll_ball_wallx() == true then
        ball.speedx = ball.speedx * -1 * increment
        sounds['wall']:play()
    end
    -- Finish State
    if ball.y > windows.base + 10 then
        ball.x = 400
        ball.y = 300
        sounds['gameover']:play()
        state = 'finish'
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if state == 'pause' then
            state = 'play'
        elseif state == 'play' then
            state = 'pause'
        elseif state == 'finish' then
            state = 'pause'
            hit_counter = 0
            ball.speedx = (math.random(2) == 1 and -100 or 100)*2                                   
            ball.speedy = (math.random(2) == 1 and math.random(-80, -100) or math.random(80, 100))*2
        end
    end
end

function coll_ball_paddle()
    if ball.y + ball.radius < paddle.y then
        return false
    elseif ball.x > paddle.x + paddle.width or paddle.x > ball.x + ball.radius then
        return false
    else
        return true
    end
end

function coll_ball_wally()
    if ball.y - ball.radius > 0 then
        return false
    else
        return true
    end
end

function coll_ball_wallx()
    if ball.x - ball.radius > 0 and ball.x + ball.radius < windows.width then
        return false
    else
        return true
    end
end

function love.draw()
    love.graphics.clear(40/255, 200/255, 180/255) --clear the screen with a color

    love.graphics.setColor(0, 0, 0)
    love.graphics.print("You hit " .. hit_counter .. " times")
    

    -- Paddle
    love.graphics.setColor(40/255, 40/255, 40/255)
    love.graphics.rectangle('fill', paddle.x, paddle.y, paddle.width, paddle.height)
    
    -- Ball
    love.graphics.setColor(1, 0, 0, 0.8)
    love.graphics.circle('fill', ball.x, ball.y, ball.radius)

    if state == 'pause' then
        love.graphics.setColor(0, 0, 0)
        love.graphics.printf('This game is created by donchokella for cs50 Term Project', 0, 20, windows.width, 'center')
        love.graphics.printf('Press Enter to Begin', 0, 40, windows.width, 'center')
        

    elseif state == 'play' then
        -- no UI messages
    elseif state == 'finish' then
        love.graphics.printf('Your score is ' .. hit_counter, 0, 100, windows.width, 'center')
    end
end