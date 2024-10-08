library home_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/groups/view/create_group_screen.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/home_screen_widgets/bottom_navigation_bar_bloc/bloc/bottom_navigation_bar_bloc.dart';
import '../../settings_screen/settings_screen.dart';
import '../body/src/main_body.dart';
import '../home_screen_widgets/src/home_screen_widgets.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Settings'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          return PageView(
            onPageChanged: (value) {
              context.read<BottomNavigationBarBloc>().add(BottomNavigationBarEventOnTap(index: value));
            },
            controller: _pageController,
            children: const [
              AllChatsBody(),
              UpdatesBody(),
              CommunitiesBody(),
              CallsBody(),
            ],
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        pagecontroller: _pageController,
      ),
      floatingActionButton: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          return CustomFloatingActionButton(index: state.index,onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateGroupScreen()));
          },);
        },
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}


