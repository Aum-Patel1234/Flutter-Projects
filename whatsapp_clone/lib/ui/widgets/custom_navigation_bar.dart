import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_event.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_state.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.pagecontroller,
  });

  final PageController pagecontroller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state.index,
          onDestinationSelected: (index) {
            context.read<BottomNavigationBarBloc>().add(BottomNavigationBarEventOnTap(index: index));
            pagecontroller.jumpToPage(index);
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.chat_outlined,),selectedIcon: Icon(Icons.chat), label: 'Chats'),
            NavigationDestination(icon: Icon(Icons.star_outline_sharp),selectedIcon: Icon(Icons.star), label: 'Updates'),
            NavigationDestination(icon: Icon(Icons.people_outline),selectedIcon: Icon(Icons.people), label: 'Communities'),
            NavigationDestination(icon: Icon(Icons.call_outlined),selectedIcon: Icon(Icons.call), label: 'Calls'),
          ],
        );
      },
    );
  }
}