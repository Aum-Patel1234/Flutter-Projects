import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_event.dart';
import 'package:whatsapp_clone/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_state.dart';
import 'package:whatsapp_clone/ui/view/all_chats_body.dart';
import 'package:whatsapp_clone/ui/view/calls_body.dart';
import 'package:whatsapp_clone/ui/view/communities_body.dart';
import 'package:whatsapp_clone/ui/view/updates_body.dart';
import 'package:whatsapp_clone/ui/widgets/custom_navigation_bar.dart';

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
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
