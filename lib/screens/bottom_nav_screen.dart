import 'package:flutter/material.dart';
import 'package:gebeya/screens/cart_screen.dart';
import 'package:gebeya/screens/feeds_screen.dart';
import 'package:gebeya/screens/home_screen.dart';
import 'package:gebeya/screens/search_screen.dart';
import 'package:gebeya/screens/user_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/Bottom-nav-screen';
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _pages = [
    const HomeScreen(),
    const FeedsScreen(),
    const SearchScreen(),
    const CartScreen(),
    const UserScreen(),
  ];

  int _currentIndex = 4;

  _onTap(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed), label: 'Feeds', tooltip: 'Feeds'),
          BottomNavigationBarItem(icon: Icon(null), label: '', tooltip: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Cart', tooltip: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'User', tooltip: 'User'),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.search,
        ),
        tooltip: 'Search',
        onPressed: () {
          _onTap(2);
        },
      ),
    );
  }
}
