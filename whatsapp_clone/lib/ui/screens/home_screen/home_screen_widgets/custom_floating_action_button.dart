part of '../home_screen_widgets/src/home_screen_widgets.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key, 
    required this.index, 
    required this.onPressed,
  });

  final int index;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (index == 0) {
      child = const Icon(Icons.add_comment_rounded);
    } else if (index == 1) {
      child = const Icon(Icons.camera_alt);
    } else if (index == 2) {
      // Return an empty container or something else if you want to disable the button
      return const SizedBox.shrink();
    } else {
      child = const Icon(Icons.add_call);
    }

    return FloatingActionButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
