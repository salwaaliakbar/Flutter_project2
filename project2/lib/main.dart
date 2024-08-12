import 'package:flutter/material.dart';
import 'package:project2/home.dart';
import 'package:project2/login.dart';
import 'package:project2/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pref = await SharedPreferences.getInstance();
  bool isLoggedIn = pref.getBool("isLoggedIn") ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter project 2",
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: isLoggedIn ? const HomePage() : const Splash(),
      routes: {
        "/loginRoute": (context) => const Login(),
        "/homeRoute": (context) => const HomePage(),
        "/splashRoute": (context) => const Splash(),
      },
    );
  }
}
