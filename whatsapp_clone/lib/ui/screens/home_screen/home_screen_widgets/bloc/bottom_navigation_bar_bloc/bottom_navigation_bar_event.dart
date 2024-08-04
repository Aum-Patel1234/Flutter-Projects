abstract class BottomNavigationBarEvent{}

class BottomNavigationBarEventOnTap extends BottomNavigationBarEvent{
  BottomNavigationBarEventOnTap({required this.index});

  final int index;
}