--[[
This is a Brick Breaker game remake

Author: Ali Alparslan
ali.alparslan@outlook.com

Originally programmed as "Breakout" by Atari in 1976.

There are one paddle, one ball and lots of bricks.
Paddle is placed on the bottom of the screen, bricks are stacks at the top, and the ball is moving between ball and the bricks.
The goal it to break all the bricks

There is a paddle, a ball and a lot of bricks.
The paddle is at the bottom of the screen, the bricks are stacked on top, and the ball moves between the bricks and the paddle.
The paddle is under the player's control. The player has 3 lives. The goal is to break all the bricks. While doing this, the ball must not pass behind the paddle. If this happens, the player loses one life.
]]

function love.load()
    love.window.setTitle('A Brick Breaker Game by donchokella') --the title of the window
    math.randomseed(os.time())  --it is important for absoulute randomness

    windows = {}
    windows.width = 800
    windows.height = 600

    paddle = {}
    paddle.x = 400
    paddle. y = 530
    paddle.width = 50
    paddle.height = 12
    paddle.speed = 5

    ball = {}
    ball.x = 400
    ball.y = 300
    ball.radius = 5
    ball.speed = 5
    ball.speedx = math.random(2) == 1 and -100 or 100                                    --here will change
    ball.speedy = math.random(2) == 1 and math.random(-80, -100) or math.random(80, 100) --here will change
    ball.width = ball.radius * 2
    ball.height = ball. radius * 2
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
    ball.x = ball.x + ball.speedx*dt
    ball.y = ball.y + ball.speedy*dt

    if ball.x > windows.width or ball.x < 0 then
        ball.speed = ball.speed * -1
    end

    --Ball and Paddle Collision
    if coll_ball_paddle() == true then
        ball.speedy = ball.speedy * -1
    end

    --Ball and Wall Collision
    if coll_ball_wally() == true then
        ball.speedy = ball.speedy * -1
    end
    
    if coll_ball_wallx() == true then
        ball.speedx = ball.speedx * -1
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    
end

function coll_ball_paddle()
    if ball.y + ball.height < paddle.y then
        return false
    elseif ball.x > paddle.x + paddle.width or paddle.x > ball.x + ball.width then
        return false
    else
        return true
    end
end

function coll_ball_wally()
    if ball.y > 0 then
        return false
    else
        return true
    end
end

function coll_ball_wallx()
    if ball.x > 0 and ball.x < windows.width then
        return false
    else
        return true
    end
end

function love.draw()
    love.graphics.clear(40/255, 200/255, 180/255) --clear the screen with a color
    
    -- Paddle
    love.graphics.setColor(40/255, 40/255, 40/255)
    love.graphics.rectangle('fill', paddle.x, paddle.y, paddle.width, paddle.height)
    
    -- Ball
    love.graphics.setColor(1, 0, 0, 0.8)
    love.graphics.circle('fill', ball.x, ball.y, ball.radius)
end