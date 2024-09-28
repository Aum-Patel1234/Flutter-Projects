import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/widgets/home_screen_widgets.dart';

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
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: (){
              // debounce the search
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          context.read<BottomNavigationBloc>().add(BottomNavigationEventOnChanged(index: index));
        },
        children: const[
          Text('data 0'),
          Text('data 1'),
          Text('data 2'),
          Text('data 3'),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(pageController: _pageController,),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
