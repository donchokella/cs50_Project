# cs50_Project

Title       : This is Not a Brick Breaker Game

Video Demo  : <URL>

Description :
Brick Breaker originally programmed as "Breakout" by Atari in 1976.
There is a paddle, a ball, and a lot of bricks.
The paddle is at the bottom of the screen, the bricks are stacked on top, and the ball moves between the bricks and the paddle.
The paddle is under the player's control. The player has 3 lives. The goal is to break all the bricks. 
While doing this, the ball must not pass behind the paddle. If this happens, the player loses one life.

However...

as i said, this is 'Not a Brick Breaker Game'. In this game, you cannot even see a tiny piece of brick. 
The only goal in this game is to get the highest score without missing the ball behind the racket. 
You can track how many times you hit the ball from the top left corner. Remember, the ball is getting faster and faster!


How to run  :
To run this game, LÖVE2D must be installed on your computer. To download LÖVE2D, visit https://love2d.org/

Game States :
This game consists of 3 states: 'pause', 'play' and 'finish'.
It starts with 'pause'. When you press 'enter', the state changes to 'play', and the ball moves. This is the main state. The game is actually here.
While in the 'play' state, if you press 'enter', the state changes to 'pause'. So it is up to the player to change the 'pause' and 'play' states by using 'enter'.
The 'finish' state appears when you miss the ball. In this state, the player's score is shown up.
If you press enter, the state changes from 'finish' to 'pause'.

Notes        :
Also, it is not a bug that we can still move the paddle when we pause the game. 
As the ball increases its speed by 5% each time it hits a wall, the game gets harder in about 6-7 moves. 
It is an option given to the player to pause the game and adjust the position of the paddle.

At the center of the paddle, the ball rotates at the same angle it came from. But this angle is designed to differ towards the edges.

Author      : Ali Alparslan
Email       : ali.alparslan@outlook.com
