part of '../home_screen_widgets/src/home_screen_widgets.dart';

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