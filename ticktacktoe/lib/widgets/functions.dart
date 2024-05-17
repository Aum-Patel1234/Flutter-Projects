import 'package:flutter/material.dart';
import 'package:ticktacktoe/screens/HomePage.dart';

bool check_winning(List<List<bool?>> grid) {
  // Checking the diagonals
  if ((grid[0][0] != null &&
          grid[0][0] == grid[1][1] &&
          grid[1][1] == grid[2][2]) ||
      (grid[0][2] != null &&
          grid[0][2] == grid[1][1] &&
          grid[1][1] == grid[2][0])) {
    return true;
  }

  // Checking rows and columns
  for (int i = 0; i < 3; i++) {
    if ((grid[i][0] != null &&
            grid[i][0] == grid[i][1] &&
            grid[i][1] == grid[i][2]) ||
        (grid[0][i] != null &&
            grid[0][i] == grid[1][i] &&
            grid[1][i] == grid[2][i])) {
      return true;
    }
  }
  return false;
}

Future<void> showDialogbox(BuildContext context,bool isX) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        elevation: 30,
        // insetAnimationDuration: const Duration(minutes: 1),
        // insetAnimationCurve: Curves.fastOutSlowIn,
        shadowColor: Colors.white,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Center(
            child: Text(
              isX ? '$name_of_player1 won !!' : '$name_of_player2 won !!',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    },
  );
}

void reset(List<List<bool?>> grid) {
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      grid[i][j] = null;
    }
  }
}
