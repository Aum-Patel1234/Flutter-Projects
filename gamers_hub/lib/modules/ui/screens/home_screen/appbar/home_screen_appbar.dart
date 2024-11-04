library home_screen_appbar.dart;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamers_hub/modules/ui/screens/home_screen/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';

part 'home_body_appbar.dart';
part 'mygames_appbar.dart';
part 'settings_appbar.dart';
part 'wishlist_appbar.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget{
  const HomeScreenAppbar({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc,BottomNavigationState>(
      builder: (context,state){
        switch(state.index){
          case 0: return const HomeBodyAppbar();
          case 1: return const WishlistAppbar();
          case 2: return const MygamesAppbar();
          default: return const SettingsAppbar();
        }
      },
    );
  }

   @override
  Size get preferredSize => Size.fromHeight(height);
}