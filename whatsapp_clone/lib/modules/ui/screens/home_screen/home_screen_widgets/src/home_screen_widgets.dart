library home_screen_widgets;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/modules/authentication_module/bloc/auth_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/chat_screen/src/chat_page.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/home_screen_widgets/bottom_navigation_bar_bloc/bloc/bottom_navigation_bar_bloc.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/home_screen_widgets/bottom_navigation_bar_bloc/bloc/bottom_navigation_bar_event.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/home_screen_widgets/bottom_navigation_bar_bloc/bloc/bottom_navigation_bar_state.dart';
import 'package:whatsapp_clone/modules/ui/screens/home_screen/home_screen_widgets/search/bloc/search_user_bloc.dart';

import '../../../../../../models/users_model/user_model.dart';

part '../custom_floating_action_button.dart';
part '../bottom_navigation_bar_bloc/widgets/custom_navigation_bar.dart';
part '../search/widgets/custom_search_bar.dart';