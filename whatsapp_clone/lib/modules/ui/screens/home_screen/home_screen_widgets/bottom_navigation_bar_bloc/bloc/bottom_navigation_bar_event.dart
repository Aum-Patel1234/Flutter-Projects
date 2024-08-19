part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent{}

class BottomNavigationBarEventOnTap extends BottomNavigationBarEvent{
  BottomNavigationBarEventOnTap({required this.index});

  final int index;
}