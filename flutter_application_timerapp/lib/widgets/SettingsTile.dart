import 'package:flutter/material.dart';
import 'package:flutter_application_timerapp/bloc/ModeBloc/mode_bloc.dart';
import 'package:flutter_application_timerapp/bloc/ModeBloc/mode_event.dart';
import 'package:flutter_application_timerapp/bloc/ModeBloc/mode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white12
              : Colors.black12,
        ),
        child: ListTile(
          leading: BlocBuilder<ModeBloc, ModeState>(builder: (context, state) {
            return Text(
              state.isDarkMode ? 'Dark Mode' : 'Light Mode',
              style: const TextStyle(fontSize: 20),
            );
          }),
          trailing: BlocBuilder<ModeBloc, ModeState>(builder: (context, state) {
            return Switch(
              // thumbIcon: MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
              //   if (states.contains(MaterialState.selected)) {
              //     return const Icon(Icons.check);
              //   }
              //   return const Icon(Icons.close);
              // }),
              value: state.isDarkMode,
              onChanged: (value) {
                context.read<ModeBloc>().add(ChangeEvent());
              },
            );
          }),
        ),
      ),
    );
  }
}
