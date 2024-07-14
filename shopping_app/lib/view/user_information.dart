import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/ProductBloc/product_bloc.dart';
import 'package:stocks_app/bloc/ProductBloc/product_event.dart';
import 'package:stocks_app/view/welcome_screen.dart';
import 'package:stocks_app/widgets/textfield.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final TextEditingController _namecontroller = TextEditingController();
  final GlobalKey<FormState> _nameformKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final GlobalKey<FormState> _emailformKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEventGetProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome User!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Your Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomTextFormField(field: 'Username',controller: _namecontroller,formKey: _nameformKey,),
            const SizedBox(height: 16),
            CustomTextFormField(field: 'Email',controller: _emailcontroller,formKey: _emailformKey,),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: () {
                if (_nameformKey.currentState!.validate() && _emailformKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(username: _namecontroller.text,email: _emailcontroller.text,),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                elevation: 5,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}