import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ticktacktoe/widgets/CustomGridTile.dart';
import 'package:ticktacktoe/widgets/PlayerInfoBar.dart';
import 'package:ticktacktoe/widgets/alertBoxes.dart';
import 'package:ticktacktoe/widgets/functions.dart';

int score_of_player1 = 0;
int score_of_player2 = 0;
String name_of_player1 = 'Player 1';
String name_of_player2 = 'Player 2';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<bool?>> grid = List.generate(
      3, (index) => List.generate(3, (index) => null)); // creating a null index

  @override
  void initState(){
    super.initState();
  
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      name_of_player1 = await askName(context,1) as String;
      name_of_player2 = await askName(context,2) as String;
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'TickTackToe',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                // change mode of the current theme
              },
              icon: const Icon(
                Icons.dark_mode_outlined,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              // color: Colors.amber,
              width: width * 0.7,
              height: height * 0.33,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: width * 0.03,
                  mainAxisSpacing: height * 0.01,
                ),
                itemBuilder: ((context, index) {
                  return CustomGridTile(
                    index: index,
                    grid: grid,
                  );
                }),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: PlayerInfoBar(),
          ),
          Positioned(
            right: 10,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    showAboutDialog(
                      context: context,
                      applicationIcon: const Icon(Icons.gamepad),
                      applicationLegalese: 'Made for fun and learning',
                      applicationName: 'Tick Tack Toe',
                      applicationVersion: '1.0.0',
                    );
                  },
                  icon: const Icon(Icons.info),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, height * 0.1),
              child: SizedBox(
                width: width * 0.5,
                height: height * 0.06,
                child: OutlinedButton(
                  child: Text('Reset',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.secondary)),
                  onPressed: () {
                    setState(() {
                      reset(grid);
                      isX = false;
                    });
                  },
                ),
              ),
            ),
          ),
          

        ],
      ),
    );
  }
}
