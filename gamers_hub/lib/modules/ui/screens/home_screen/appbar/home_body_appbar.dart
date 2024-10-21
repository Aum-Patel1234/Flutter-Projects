part of 'home_screen_appbar.dart';

class HomeBodyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeBodyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:  IconButton(
        onPressed: (){},
        icon: ClipOval( 
          child: Image.network(
            "https://static.vecteezy.com/system/resources/thumbnails/033/129/417/small/a-business-man-stands-against-white-background-with-his-arms-crossed-ai-generative-photo.jpg",
            fit: BoxFit.cover,           
            width: 50,
            height: 50,
          ),
        ),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back 👏',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4,),
          Text(
            'Andrew Airslay',   
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            // debounce the search
          },
          icon: const Icon(CupertinoIcons.search),
        ),
        IconButton(
          onPressed: () {
            // debounce the search
          },
          icon: const Icon(Icons.notifications),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
