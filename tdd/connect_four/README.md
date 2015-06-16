Here are the parts I think we would need to change for connect four from your implementation of tic-tac-toe:
* init (3 vs 6x7)
* has_3_in_a_row (change to 4)
* cannot_have_3_in_a_row (change to 4)
* legal move #s
* random_open_corner
* setup_winning_move_for <--- the hardest BY FAR.
* diagonals <--- the second hardest
* Change row, column to just select column, and then calculate row based on what's already on the board