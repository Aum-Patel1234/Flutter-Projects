import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
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
  double _appBarHeight = kToolbarHeight+50;

  void _updateAppBarHeight(int index) {
    setState(() {
      _appBarHeight = index == 0 ?  (50 + kToolbarHeight) : kToolbarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: HomeScreenAppbar(height: _appBarHeight), // Pass the height to the app bar
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            context.read<BottomNavigationBloc>().add(BottomNavigationEventOnChanged(index: index));
            _updateAppBarHeight(index); // Update the app bar height based on index
          },
          children: const [
             TabBarView(
              children: [
                Center(child: Text('For You Content')),
                Center(child: Text('Top Charts Content')),
                Center(child: Text('Events Content')),
                Center(child: Text('Premium Content')),
                Center(child: Text('Category')),
              ],
            ),
            Text('data 1'),
            Text('data 2'),
            SettingsBody(),
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
