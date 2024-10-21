part of 'home_screen_appbar.dart';

class SettingsAppbar extends StatelessWidget implements PreferredSizeWidget{
  const SettingsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Image(image: AssetImage("assets/images/logo.png"),),
      title: const Text('Settings',style: TextStyle(fontSize: 18),),
      actions: [
        IconButton(
          onPressed: () {
            // debounce the search
          },
          icon: const Icon(Icons.info),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}