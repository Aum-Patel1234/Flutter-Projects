import 'package:flutter/material.dart';
import 'package:ticktacktoe/screens/HomePage.dart';
import 'package:ticktacktoe/widgets/texts.dart';

class PlayerInfoBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PlayerInfoBar();
  }
  
}
class _PlayerInfoBar extends State<PlayerInfoBar>{

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, height * 0.1, 0, 0),
      child: SizedBox(
        width: width * 0.8,
        height: height * 0.1,
        // color: Colors.blue, change it to container
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                player_info(context, name_of_player1, 20,Theme.of(context).colorScheme.tertiary),
                player_info(
                    context,
                    '$score_of_player1 \t | \t $score_of_player2',
                    25,
                    Colors.amber),
                player_info(context, name_of_player2, 20,
                    Theme.of(context).colorScheme.tertiary),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              (score_of_player1 == score_of_player2) ? 'Intense Fight'
              : score_of_player1 > score_of_player2 ? '$name_of_player1 is winning' : '$name_of_player2 is winning',
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

}