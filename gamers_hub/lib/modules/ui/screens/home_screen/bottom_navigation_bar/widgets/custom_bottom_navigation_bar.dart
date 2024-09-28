part of '../../widgets/home_screen_widgets.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key, required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc,BottomNavigationState>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state.index,
          onDestinationSelected: (int index){
            context.read<BottomNavigationBloc>().add(BottomNavigationEventOnChanged(index: index));
            pageController.jumpToPage(index);
          },
          destinations: const[
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.gamepad),
              label: 'Games',
            ),
            NavigationDestination(
              icon: Icon(Icons.gamepad_outlined),
              selectedIcon: Icon(Icons.gamepad),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              selectedIcon: Icon(Icons.category,),
              label: 'Category',
            ),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.user),
              selectedIcon: Icon(FontAwesomeIcons.userLarge,),
              label: 'Age',
            ),
          ],
        );
      }
    );
  }
}