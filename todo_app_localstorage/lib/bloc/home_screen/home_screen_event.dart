abstract class HomeScreenEvent{}

class HomeScreenEventChangeScreen extends HomeScreenEvent{
  final int index;

  HomeScreenEventChangeScreen({required this.index});
}
