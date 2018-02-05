# Cracker Barrel Peg Game Cracker

Ruby script that tries every possible way to solve the [triangle peg game](https://www.amazon.com/Toysmith-TSM1954-Peg-Game/dp/B004AFVKLE).

The board is a triangle with 15 holes, in rows of one, two, three, four, and five holes. Initially the board is full of pegs except for the hole in the top row.

A move consists of jumping over one peg with another, and removing the peg that was jumped. For example, as the first move you could take the first peg in the third row, jump over the first peg in the second row, putting the peg in the empty hole in the hole in the first row. Then the first peg in the second row, having been jumped, would be removed from the board. The player does this with whichever pegs they choose, until no more moves are possible. The goal of the game is to have as few pegs remaining as possible.

![layout](https://raw.githubusercontent.com/andrewrowell/crackerbarrelcracker/master/board.png)
