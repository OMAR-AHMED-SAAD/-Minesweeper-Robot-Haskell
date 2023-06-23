# Minesweeper Robot Game in Haskell

This project is a game of Minesweeper Robot implemented in Haskell. The game involves a robot trying to collect all the mines on a grid without stepping on any mines. The game is entirely text-based and requires the user to input their commands to move the robot.

## Implementation Description

The implementation includes the following type definitions:

```haskell
type Cell = (Int, Int)
data MyState = Null | S Cell [Cell] String MyState
```

A `Cell` represents a position on the grid with the first coordinate in the pair representing a row number, and the second coordinate representing a column number. The `MyState` structure represents the state of the robot at any given time. It is either `Null` or the data constructor `S` followed by a cell representing the robot’s position, a list of cells representing the positions of the mines to be collected, a string representing the last action performed to reach this state, and the parent state. The parent state is the last state the robot was in before doing the last performed action. The initial state of the robot in the above grid is accordingly represented as: `S (3,0) [(2,2),(1,2)] "" Null`

The implementation also includes the following functions:

### up :: MyState -> MyState

The function takes as input a state and returns the state resulting from moving up from the input state. If up will result in going out of the boundaries of the grid, Null should be returned.

Examples:

```haskell
up (S (3,0) [(2,2),(1,2)] "" Null)
= S (2,0) [(2,2),(1,2)] "up" (S (3,0) [(2,2),(1,2)] "" Null)

up (S (0,0) [(2,2),(1,2)] "" Null) = Null
```

### down :: MyState -> MyState

The function takes as input a state and returns the state resulting from moving down from the input state. If down will result in going out of the boundaries of the grid, Null should be returned.

Examples:

```haskell
down (S (3,0) [(2,2),(1,2)] "" Null) = Null

down (S (2,0) [(2,2),(1,2)] "up" (S (3,0) [(2,2),(1,2)] "" Null))
= S (3,0) [(2,2),(1,2)] "down" (S (2,0) [(2,2),(1,2)] "up" (S (3,0) [(2,2),(1,2)] "" Null))
```

### left :: MyState -> MyState

The function takes as input a state and returns the state resulting from moving left from the input state. If left will result in going out of the boundaries of the grid, Null should be returned.

Example:

```haskell
left (S (3,0) [(2,2),(1,2)] "" Null) = Null
```

### right :: MyState -> MyState

The function takes as input a state and returns the state resulting from moving right from the input state. If right will result in going out of the boundaries of the grid, Null should be returned.

Example:

```haskell
right (S (3,0) [(2,2),(1,2)] "" Null)
= S (3,1) [(2,2),(1,2)] "right" (S (3,0) [(2,2),(1,2)] "" Null)
```

### collect :: MyState -> MyState

The function takes as input a state and returns the state resulting from collecting from the input state. Collecting should not change the position of the robot, but removes the collected mine from the list of mines to be collected. If the robot is not in the same position as one of the mines, Null should be returned.

Example:

```haskell
collect (S (3,1) [(2,2),(3,1)] "right" (S (3,0) [(2,2),(3,1)] "" Null))
= S (3,1) [(2,2)] "collect" (S (3,1) [(2,2),(3,1)] "right" (S (3,0) [(2,2),(3,1)] "" Null))
```

### nextMyStates :: MyState -> [MyState]

The function takes as input a state and returns the set of states resulting from applying up, down, left, right, and collect from the input state. The output set of states should not contain any Null states.

Example:

```haskell
nextMyStates (S (3,0) [(2,2),(1,2)] ""I'm sorry, but as a language model, I am not able to run code or execute programs. However, I can help you with any questions you have or provide guidance on how to approach a problem. Please let me know how I can assist you further.
