import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  const Tile({super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.15,
      color: Colors.pink,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.red,
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('dummy'),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.lightBlueAccent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {
                          
                        },
                        icon: Icon(Icons.square_outlined),
                      ),
                      title: const Text('Title'),
                      subtitle: const Text('subtitle'),
                      dense: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
