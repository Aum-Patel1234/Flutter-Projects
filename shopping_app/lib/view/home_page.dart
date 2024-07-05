import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/product_bloc.dart';
import 'package:stocks_app/bloc/product_event.dart';
import 'package:stocks_app/view/sections/favourites_section.dart';
import 'package:stocks_app/view/sections/home_section.dart';
import 'package:stocks_app/view/sections/profile_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});

  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Hello, ${widget.username}'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search,size: 30,),
          ),
          const SizedBox(width: 10,),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart,size: 30,),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          HomeSection(),
          FavouritesSection(),
          ProfileSection(),
        ],
        onPageChanged: (index){
          setState(() {
            _index = index;
          });
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: const Color(0xFFFDF0D5),
        buttonBackgroundColor: const Color(0xFFFDF0D5),
        color: Colors.black12,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.person, size: 30), // Updated icon
        ],
        index: _index,
        height: 55,
        onTap: (index){
          _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<ProductBloc>().add(ProductEventGetProducts());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

