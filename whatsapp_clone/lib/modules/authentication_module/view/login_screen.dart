import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light ? Colors.black26 : Colors.white24,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
            
            SizedBox(height: height*0.025,),

            Text('Get Your Free Account',style: Theme.of(context).textTheme.headlineLarge),

            SizedBox(height: height*0.025,),

            
          ],
        ),
      ),
    );
  }
}
