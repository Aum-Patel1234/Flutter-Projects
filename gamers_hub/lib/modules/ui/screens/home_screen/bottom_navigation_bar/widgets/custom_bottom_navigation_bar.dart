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
        return Container(
          decoration: const BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: state.index,
            // showSelectedLabels: true,
            backgroundColor: Colors.transparent,
            selectedItemColor: const Color(ColorConfig.submitButtonGreen),
            unselectedItemColor: Colors.white,
            onTap: (int index){
              context.read<BottomNavigationBloc>().add(BottomNavigationEventOnChanged(index: index));
              pageController.jumpToPage(index);
            },
            items: const[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline),
                activeIcon: Icon(Icons.bookmark,),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag),
                label: 'My Games',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      }
    );
  }
}