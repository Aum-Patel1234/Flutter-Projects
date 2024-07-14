import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final String title;
  final String hintText;
  final IconData icon;
  bool enableDateinput = false;

  TaskInput(
      {super.key,
      required this.title,
      required this.hintText,
      required this.icon,
      this.enableDateinput = false});

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  TextEditingController controller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white10,
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.enableDateinput ? datecontroller : controller,
                    keyboardType: widget.enableDateinput ? TextInputType.datetime : TextInputType.text,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(fontSize: 20, color: Colors.white54),
                    ),
                  ),
                ),
                // SizedBox(width: 15,),
                IconButton(
                  onPressed: widget.enableDateinput ? ()async {
                    DateTime? time = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2050));
                    setState(() {
                      datecontroller.text = "${time!.toLocal()}".split(" ")[0];
                    });
                  } : (){},
                  icon: Icon(
                    widget.icon,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
