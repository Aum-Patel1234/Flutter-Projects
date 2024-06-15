
import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/widgets/CustomTextField.dart';

class CustomAlertDialog extends StatelessWidget{
  TextEditingController hourscontroller = TextEditingController();
  TextEditingController minutescontroller = TextEditingController();
  TextEditingController secondscontroller = TextEditingController();
  CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
        title: const Text(
          'Set Time',
          style: TextStyle(color: Colors.white),
        ),
        content: Row(
          children: [
            Expanded(
              child: CustomTextField(controller: hourscontroller,hintText: 'hrs'),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                ':',
                style: TextStyle(color: Colors.white,fontSize: 30),
              ),
            ),
            Expanded(
              child: CustomTextField(controller: minutescontroller,hintText: 'min'),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                ':',
                style: TextStyle(color: Colors.white,fontSize: 30),
              ),
            ),
            Expanded(
              child: CustomTextField(controller: secondscontroller,hintText: 'sec'),
            ),
          ],
        ),
        actions: [
          FilledButton.tonal(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          FilledButton.tonal(
            onPressed: (){
              List<int> time = [int.parse(hourscontroller.text),int.parse(minutescontroller.text),int.parse(secondscontroller.text)];
              Navigator.of(context).pop(time);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black87),
            ),
          )
        ],
     );
  }
}