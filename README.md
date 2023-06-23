Readme file for Minesweeper Robot Game implemented using Haskell:

Overview:
The Minesweeper Robot game is implemented in Haskell programming language. The game consists of a grid with mines hidden in it, and the player needs to collect all the mines without stepping on them. The player in the game is represented by a robot that moves around the grid and collects the mines. The implementation includes various functions to manipulate the state of the game and return the resulting state.

Type Definitions:
The implementation includes the following type definitions:

- Cell: Represents a position on the grid with the first coordinate in the pair representing a row number, and the second coordinate representing a column number.
- MyState: Represents the state of the robot at any given time. It is either Null or the data constructor S followed by a cell representing the robot’s position, a list of cells representing the positions of the mines to be collected, a string representing the last action performed to reach this state, and the parent state. The parent state is the last state the robot was in before doing the last performed action.

Functions:
The implementation includes the following functions:

- up: Takes as input a state and returns the state resulting from moving up from the input state. If up will result in going out of the boundaries of the grid, Null should be returned.
- down: Takes as input a state and returns the state resulting from moving down from the input state. If down will result in going out of the boundaries of the grid, Null should be returned.
- left: Takes as input a state and returns the state resulting from moving left from the input state. If left will result in going out of the boundaries of the grid, Null should be returned.
- right: Takes as input a state and returns the state resulting from moving right from the input state. If right will result in going out of the boundaries of the grid, Null should be returned.
- collect: Takes as input a state and returns the state resulting from collecting from the input state. Collecting should not change the position of the robot, but removes the collected mine from the list of mines to be collected. If the robot is not in the same position as one of the mines, Null should be returned.
- nextMyStates: Takes as input a state and returns the set of states resulting from applying up, down, left, right, and collect from the input state. The output set of states should not contain any Null states.
- isGoal: Takes as input a state, returns true if the input state has no more mines to collect (the list of mines is empty), and false otherwise.
- search: Takes as input a list of states. It checks if the head of the input list is a goal state, if it is a goal, it returns the head. Otherwise, it gets the next states from the state at head of the input list, and calls itself recursively with the result of concatenating the tail of the input list with the resulting next states.
- constructSolution: Takes as input a state and returns a set of strings representing actions that the robot can follow to reach the input state from the initial state.
- solve: Takes as input a cell representing the starting position of the robot, a set of cells representing the positions of the mines, and returns a set of strings representing actions that the robot can follow to reach a goal state from the initial state.

Bonus:
For bonus marks, we optimized the implementation to solve grids bigger than 4×4 with more mines. We added the following types and changed some function definitions:

- Board: A type that represents the game board as a list of lists.
- GameState: A type that represents the state of the game as a tuple containing the board, the position of the robot, the set of positions of the mines, and the list of actions taken to reach this state.
- legalMoves: A function that returns the set of legal moves that the robot can make from a given state.
- applyMove: A function that applies a given move to a given state and returns the resulting state.
- bfs: A function that performs a breadth-first search on the game state space to find the goal state.
- optimizedSolve: A function that takes as input the size of the board, the number of mines, and the starting position of the robot, and returns a set of strings representing actions that the robot can follow to reach a goal state from the initial state.

Report:
The submitted code includes a readme file, the Haskell code, and a short report. The report includes a brief description of the implemented functions and screenshots of two different grid configurations with the returned solutions. We also included a run on a bigger grid to demonstrate the bonus optimized implementation.
