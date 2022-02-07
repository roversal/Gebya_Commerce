import 'package:flutter/material.dart';
import 'package:gebeya/providers/my_theme.dart';
import 'package:gebeya/screens/bottom_nav_screen.dart';
import 'package:gebeya/screens/cart_screen.dart';
import 'package:gebeya/screens/feeds_screen.dart';
import 'package:gebeya/screens/home_screen.dart';
import 'package:gebeya/screens/search_screen.dart';
import 'package:gebeya/screens/user_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ThemeNotifier()),
      ],
      child: Consumer<ThemeNotifier>(
          //stream: null,
          builder: (context, notifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyAppTheme.myThemes(notifier.isDark, context),
          home: const BottomNavScreen(),
          routes: {
            BottomNavScreen.routeName: (ctx) => const BottomNavScreen(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            FeedsScreen.routeName: (ctx) => const FeedsScreen(),
            SearchScreen.routeName: (ctx) => const SearchScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            UserScreen.routeName: (ctx) => const UserScreen(),
          },
          title: 'Gebeya',
        );
      }),
    );
  }
}
