# cs50_Project

To run this game, LÖVE2D must be installed on your computer. To download LÖVE2D, visit https://love2d.org/

This game consists of 3 states: 'pause', 'play' and 'finish'.
It starts with 'pause'. When you press 'enter', the state changes to 'play', and the ball moves. This is the main state. The game is actually here.
While in the 'play' state, if you press 'enter', the state changes to 'pause'. So it is up to the player to change the 'pause' and 'play' states by using 'enter'.
The 'finish' state appears when you miss the ball. In this state, the player's score is shown up.
If you press enter, the state changes from 'finish' to 'pause'.

Also, it is not a bug that we can still move the paddle when we pause the game. 
As the ball increases its speed by 5% each time it hits a wall, the game gets harder in about 6-7 moves. 
It is an option given to the player to pause the game and adjust the position of the paddle.

At the center of the paddle, the ball rotates at the same angle it came from. But this angle is designed to differ towards the edges.

Author: Ali Alparslan
ali.alparslan@outlook.com
