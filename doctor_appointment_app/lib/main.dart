import 'package:doctor_appointment_app/main_layout.dart';
import 'package:doctor_appointment_app/screens/auth_page.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {'/': (context) => AuthPage(), 'main': (context) => MainLayout()},
    );
  }
}
