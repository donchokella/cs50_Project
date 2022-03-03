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
    paddle = {}
    paddle.x = 400
    paddle. y = 530
    paddle.width = 50
    paddle.height = 12
    paddle.speed = 5


end

function love.update()

    -- Paddle movement
    if love.keyboard.isDown('left') then
        paddle.x = paddle.x - paddle.speed
    end
    if love.keyboard.isDown('right') then
        paddle.x = paddle.x + paddle.speed
    end
    
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    
end


function love.draw()
    love.graphics.clear(40/255, 200/255, 180/255) --clear the screen with a color

    love.graphics.rectangle('fill', paddle.x, paddle.y, paddle.width, paddle.height)
    love.graphics.setColor(40/255, 40/255, 40/255)
    

end