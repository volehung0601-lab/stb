import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/navigation_wrapper.dart';
import 'screens/order_pickup_screen.dart';

void main() {
  runApp(const StarbucksApp());
}

class StarbucksApp extends StatelessWidget {
  const StarbucksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starbucks Rewards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF008248),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF008248),
          primary: const Color(0xFF008248),
          secondary: const Color(0xFF0e382c),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/navigation': (context) => const NavigationWrapper(),
        '/order_pickup': (context) => const OrderPickUpScreen(),
      },
    );
  }
}
