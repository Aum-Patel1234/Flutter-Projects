import 'package:flutter/material.dart';
import 'package:ticktacktoe/screens/HomePage.dart';
import 'package:ticktacktoe/widgets/functions.dart';

bool isX = false; // this needs to remain as global as isX is made multiple times while in object creation

class CustomGridTile extends StatefulWidget {
  final int index;
  final List<List<bool?>> grid;
  const CustomGridTile({super.key, required this.index, required this.grid});

  @override
  State<StatefulWidget> createState() {
    return _CustomGridTile(index: index, grid: grid);
  }
}

class _CustomGridTile extends State<CustomGridTile> {
  final int index;
  List<List<bool?>> grid;
  AssetImage imageX = const AssetImage('assets/images/x.png');
  AssetImage image0 = const AssetImage('assets/images/0.png');
  _CustomGridTile({required this.index, required this.grid});

  @override
  Widget build(BuildContext context) {
    int row = index ~/ grid.length;
    int col = index % grid.length;

    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              if (grid[row][col] == null) {
                isX = !isX; // first changing _isX to true so prints X
                grid[row][col] = isX; // replacing null with true,false, ...

                if (check_winning(grid)) {
                  reset(grid);
                  // print(isX);
                  if (isX) {
                    score_of_player1 += 1;
                  } else {
                    score_of_player2 += 1;
                  }
                  showDialogbox(context,isX);
                  isX = false;
                }
              }
            });
          },
          child: grid[row][col] == null
              ? const SizedBox()
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: grid[row][col]! ? imageX : image0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}