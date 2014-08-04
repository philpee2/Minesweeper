Minesweeper
===========

## Overview

This is a game of Minesweeper built in Ruby. It is played in the terminal. To play, run the command "ruby minesweeper.rb". This version of Minesweeper features a leaderboard of scores, and game saving. 

## How to play

### Rules

The rules of Minesweeper can be found [here](http://en.wikipedia.org/wiki/Minesweeper_(video_game)#Overview).

### Setup

To start a new game, enter `Y` when prompted. Then enter a board size, and then the letter `e`, `m`, or `h`, corresponding to easy, medium, or hard difficulty. On easy difficulty, one tenth of the board will be covered in mines. On medium difficulty, one seventh. On hard difficulty, one fifth. More points are awarded for completing the game on higher difficulties and with larger boards. 

### Input

Choose a move by entering the letter `r` or `f` for reveal or flag, followed by a two-integer coordinate on the board. For example, a valid move would be `r02` to reveal the tile at coordinate (0, 2), where the horizontal coordinate is first. 

### Output

On the game board, `*` indicates an unrevealed tile. An integer indicates the number of adjacent tiles that contain a mine. `_` indicates a safe tile with no adjacent mines `F` indicates a flagged tile. In the end-game board display, `M` indicates a tile with a mine on it. 

### Saving progress

When the game asks whether you want to start a new game, you can enter `N` to instead load an existing game. Enter a filename, and the game will be loaded. 

To save the current game state, enter the `save` command, and then choose a file name to store the saved game to. If you choose a file that already exists, it will override the existing save. Saving progress will not end the current game, so you can continue playing. 

## Future Todos

### Known bugs

* Invalid Command message on save - When a user enters the "save" command to save the current game, they'll receive the "Invalid command" message, which should not appear
* Currently, loading a file will reset the timer, rather than adding to the original time. This can easily be exploited to get very high scores, since the score is partially based on how long it took to complete the game. 

### Additional features
 * Safe file names - Currently, a user can save to or load from any file. There's nothing stopping one player from loading or overriding another player's game. A possible solution to this would be to ask players a security question, or give them a password. Saving to a new file would create a new password. Saving over or loading an existing file would require entering the password. 
