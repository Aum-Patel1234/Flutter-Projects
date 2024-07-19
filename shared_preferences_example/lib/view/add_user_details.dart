import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences_example/bloc/radio_button_bloc/radio_button_bloc.dart';
import 'package:shared_preferences_example/bloc/radio_button_bloc/radio_button_event.dart';
import 'package:shared_preferences_example/bloc/radio_button_bloc/radio_button_state.dart';
import 'package:shared_preferences_example/core/share_preference.dart';
import 'package:shared_preferences_example/view/enums.dart';
import 'package:shared_preferences_example/widgets/forms.dart';

class AddUserDetails extends StatefulWidget {
  const AddUserDetails({super.key, this.user, this.index = 0});

  final User? user;
  final int index;

  @override
  State<AddUserDetails> createState() => _AddUserDetailsState();
}

class _AddUserDetailsState extends State<AddUserDetails> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _ageKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    if(widget.user != null){
      _nameController.text = widget.user!.name;
      _phoneController.text = widget.user!.phoneNumber.toString();
      _emailController.text = widget.user!.email;
      _ageController.text = widget.user!.age.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add User'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Forms(label: 'Name', formKey: _nameKey, controller: _nameController),
              Forms(label: 'Phone Number', formKey: _phoneKey, controller: _phoneController),
              Forms(label: 'Email', formKey: _emailKey, controller: _emailController),
              Forms(label: 'Age', formKey: _ageKey, controller: _ageController,),
              const SizedBox(height: 10,),
              const Text('Are You Married/Single ?',style: TextStyle(fontSize: 18),),
              BlocBuilder<RadioButtonBloc, RadioButtonState>(
                builder: (context, state) {
                  return Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      RadioListTile<MarriedStatus>(
                        title: const Text('Single'),
                        value: MarriedStatus.single,
                        groupValue: state.marriedStatus,
                        onChanged: (MarriedStatus? status) {
                          context.read<RadioButtonBloc>().add(RadioButtonEventOnChanged());
                        },
                      ),
                      RadioListTile<MarriedStatus>(
                        title: const Text('Married'),
                        value: MarriedStatus.married,
                        groupValue: state.marriedStatus,
                        onChanged: (MarriedStatus? status) {
                          context.read<RadioButtonBloc>().add(RadioButtonEventOnChanged());
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        FilledButton.tonal(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        FilledButton.tonal(
          onPressed: ()async {
            if(_nameKey.currentState!.validate() && _ageKey.currentState!.validate() && _emailKey.currentState!.validate() && _phoneKey.currentState!.validate() ){
              Navigator.of(context).pop();
              final RadioButtonState radioButtonState = context.read<RadioButtonBloc>().state;
              bool isMarried = radioButtonState.marriedStatus == MarriedStatus.married;
              final String userData = '${_nameController.text} || ${_phoneController.text} || ${_emailController.text} || ${_ageController.text} || ${isMarried.toString()}';
              int length;
              if(widget.user == null){
               length = await increment();
              }else{
                length = widget.index+1;
              }
              addUser(userData, 'user$length');
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}
