import 'package:flutter/material.dart';
import 'home.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';
import './screens/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            brightness: Brightness.light,
            /* light theme settings */
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            /* dark theme settings */
          ),
          themeMode: ThemeMode.dark,
          home: auth.isAuth ? const Home(title: 'Home') : const AuthScreen(),
          routes: {
            Home.routeName: (ctx) => const Home(
                  title: 'Home',
                ),
            AuthScreen.routeName: (ctx) => const AuthScreen(),
            Profile.routeName: (ctx) => const Profile(),
          },
        ),
      ),
    );
  }
}
