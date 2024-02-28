import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginscreen/view/home_screen.dart';
import 'package:loginscreen/view/login_screen.dart';
import 'package:loginscreen/view/signup_screen.dart';
import 'package:loginscreen/view/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
        bodyMedium: TextStyle(),
      )),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
    );
  }
}
