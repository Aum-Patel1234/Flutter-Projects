import 'package:flutter/material.dart';
import 'package:flutter_application_art/widgets/BottomColorBar.dart';

int rows = 48;
int columns = 24;
List<List<Color>> boxes =
    List.generate(rows, (_) => List.filled(columns, Colors.black));
Color selected = Colors.red;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        title: const Text(
          'ArtMaker',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.info,
            color: Colors.white,
          ),
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationName: 'ArtMaker',
              applicationIcon: const Icon(
                Icons.color_lens,
                size: 30,
              ),
              applicationVersion: '1.0.0',
              applicationLegalese: 'Rights are Reserved to Aum',
              // barrierColor: Colors.teal,
              // barrierLabel: 'sdfsds'
            );
          },
        ),
      ),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0.8,
              crossAxisSpacing: 0.8,
              crossAxisCount: columns,
            ),
            itemCount: rows * columns,
            itemBuilder: (context, index) {
              int row = index ~/ columns; //     50 ~/ 24 = 2
              int col = index % columns; //      50 % 24 = 2

              return Container(
                color: boxes[row][col],
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      boxes[row][col] =
                          boxes[row][col] == selected ? Colors.black : selected;
                    });
                  },
                  child: Container(),
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: BottomColorBar(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
        onPressed: () {
          setState(() {
            for (var row in boxes) {
              row.fillRange(0, row.length,Colors.black);
            }
          });
        },
        elevation: 10,
        child: const Icon(
            Icons.refresh,
            color: Colors.white,
            size: 30,
          ),
      ),
    );
  }
}
