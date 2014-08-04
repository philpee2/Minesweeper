Minesweeper
===========

## Overview

This is a game of Minesweeper built in Ruby. It is played in the terminal. To play, run the command "ruby minesweeper.rb". The rules of Minesweeper can be found [here](http://en.wikipedia.org/wiki/Minesweeper_(video_game)#Overview)

## How to play

To start a new game, enter "Y" when prompted. Then enter a board size, and then the letter "e", "m", or "h", corresponding to easy, medium, or hard difficulty. On easy difficulty, one tenth of the board will be covered in mines. On medium difficulty, one seventh. On hard difficulty, one fifth.

Alternatively, you can load a saved game rather than starting a new one. When asked whether you want to start a new game, entering "N" will load the saved game in the "Minesweeper.save" YAML file. 

Choose a move by entering the letter "r" or "f" for reveal or flag, followed by a two-integer coordinate on the board. For example, a valid move would be "r02" to reveal the tile at coordinate (0, 2).

To save the current game state, enter the "save" command. This will save the game to the "Minesweeper.save" file, overriding whatever game is currently stored there. It will not end the current game. 

On the game board, "*" indicates an unrevealed tile. An integer indicates the number of adjacent tiles that contain a mine. "_" indicates that there are no adjacent tiles with a mine. "F" indicates a flagged tile. In the end-game board display, "M" indicates a tile with a mine on it. 

## Future Todos

### Known bugs

* Invalid Command message on save - When a user enters the "save" command to save the current game, they'll receive the "Invalid command" message, which should not appear
* Leaderboard - Displaying and saving to the leaderboard does not currently work

### Additional features
 * Multiple save files - Currently, users can store to exactly one save file. I'd like to allow them to enter a save name, which creates a file of that name, and then load that save using its name. 
