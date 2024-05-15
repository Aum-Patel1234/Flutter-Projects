import 'package:flutter/material.dart';
import 'package:ticktacktoe/screens/HomePage.dart';

bool isX = false; // this needs to remain as global as isX is made multiple times while in object creation

class CustomGridTile extends StatefulWidget {
  final int index;
  List<bool?> grid;
  CustomGridTile({super.key, required this.index,required this.grid});

  @override
  State<StatefulWidget> createState() {
    return _CustomGridTile(index: index,grid: grid);
  }
}

class _CustomGridTile extends State<CustomGridTile> {
  final int index;
  List<bool?> grid;
  AssetImage imageX = const AssetImage('assets/images/x.png');
  AssetImage image0 = const AssetImage('assets/images/0.png');
  bool winning_condition = true;

  _CustomGridTile({required this.index,required this.grid});

  @override
  Widget build(BuildContext context) {
    print('$index - ${grid[index]}');
    
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
              if(grid[index] == null ){
                isX = !isX;             // first changing _isX to true so prints X
                grid[index] = isX;       // replacing null with true,false, ...
              }
              if(winning_condition){
                if(isX == true){
                  score_of_player1 += 1;
                }else{
                  score_of_player2 += 1;
                }
              }    
            });
          },
          child: grid[index] == null
              ? const SizedBox()
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: isX ? imageX : image0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


        ),
      ),
    );
  }
}
