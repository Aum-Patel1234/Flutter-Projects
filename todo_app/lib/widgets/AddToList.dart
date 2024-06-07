import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/widgets/DropdownMenu.dart';

class AddtoList extends StatefulWidget {
  const AddtoList({super.key});

  @override
  State<AddtoList> createState() => _AddtoListState();
}

class _AddtoListState extends State<AddtoList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.amber,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Add to List',
                style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 22),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 8, 0),
                child: Row(
                  children: [
                    CustonDropdownMenu(width: width*0.8,disableIcon: true,),
                  ],
                ),
              ),
              IconButton(
                onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: const Text(
                        'New List',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      content: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter List Name',
                            hintStyle: TextStyle(color: Colors.black26)
                          ),
                        ),
                      ),
                      actions: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Text('CANCEL'),
                        ),
                        const SizedBox(width: 15,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Text('ADD'),
                        ),
                      ],
                    );
                  });
                },
                icon: const Icon(Icons.list_sharp,color: Colors.white,size: 30,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}