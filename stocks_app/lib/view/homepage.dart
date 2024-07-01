import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/CompaniesBloc/companies_bloc.dart';
import 'package:stocks_app/bloc/CompaniesBloc/companies_event.dart';
import 'package:stocks_app/view/subpages/companies_page.dart';
import 'package:stocks_app/view/subpages/currency_page.dart';
import 'package:stocks_app/view/subpages/top_gainers_and_losers_page.dart';
import 'package:stocks_app/widgets/navbar.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadCSVfile();
  }

  Future<void> _loadCSVfile() async {
    try {
      final rawData = await rootBundle.loadString('assets/listing_status.csv');
      List<List<dynamic>> data = const CsvToListConverter().convert(rawData);
      context.read<CompaniesBloc>().add(CompaniesEventFetchCompanies(data: data));
    } catch (e) {
      // log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: Text(
          _pageIndex > 1 ? 'Currency' : (_pageIndex == 0) ? 'Companies' : 'Top Gainers and Losers',
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        children:  const[
          CompaniesPage(),
          TopGainersAndLosersPage(),
          CurrencyPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.business, size: 30, color: Colors.white),
          Icon(Icons.trending_up, size: 30, color: Colors.white),
          Icon(Icons.currency_exchange, size: 30, color: Colors.white),
        ],
        color: Colors.blueAccent.shade100,
        buttonBackgroundColor: Colors.blueAccent,
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        index: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
          });
        },
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}