import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/sections/gameverse/game_verse.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/sections/my_games/my_games.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/sections/settings/settings_body.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/widgets/home_screen_widgets.dart';
import '../appbar/home_screen_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Column(
          children: [
            const HomeScreenAppbar(),                 // custom appbar

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<BottomNavigationBloc>().add(BottomNavigationEventOnChanged(index: index));
                },
                children: const [
                   TabBarView(
                    children: [
                      Center(child: Text('For You Content')),
                      Center(child: Text('Top Charts Content')),
                      Center(child: Text('Events Content')),
                      Center(child: Text('Kids content')),
                      Center(child: Text('Categories Content')),
                    ],
                  ),
                  GameVerse(),
                  MyGames(),
                  SettingsBody(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(pageController: _pageController),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
