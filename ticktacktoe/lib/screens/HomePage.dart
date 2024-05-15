import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticktacktoe/widgets/CustomGridTile.dart';
import 'package:ticktacktoe/widgets/texts.dart';

int score_of_player1 = 0;
int score_of_player2 = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool?> grid = List.generate(9, (index) => null);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color textColor =
        Theme.of(context).colorScheme.background == ThemeMode.light
            ? Colors.black
            : Colors.white;

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
              height: height * 0.32,
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.1, 0, 0),
              child: Container(
                width: width * 0.8,
                height: height * 0.1,
                // color: Colors.blue,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        player_info(context, 'Player 1', 20,
                            Theme.of(context).colorScheme.tertiary),
                        player_info(
                            context,
                            '$score_of_player1 \t | \t $score_of_player2',
                            25,
                            Colors.amber),
                        player_info(context, 'Player 2', 20,
                            Theme.of(context).colorScheme.tertiary),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Text(
                      'Player 1 is winning',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
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
                      for (int i = 0; i < grid.length; i++) {
                        if (grid[i] != null) {
                          grid[i] = null;
                        }
                        // print(grid[i]);
                      }
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
