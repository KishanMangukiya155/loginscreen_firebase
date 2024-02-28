import 'package:flutter/material.dart';
import 'package:loginscreen/utils/colors.dart';
import 'package:loginscreen/view/signup_screen.dart';

import '../components/components.dart';
import 'demo_otp.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TopScreenImage(screenImageName: 'home.jpg'),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Welcome to Crossx',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Hero(
                        tag: 'login_btn',
                        child: CustomButton(
                          buttonText: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: 'signup_btn',
                        child: CustomButton(
                          buttonText: 'Sign Up',
                          isOutlined: true,
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Sign up using',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 25,
                              child: Image.asset(
                                  'assets/images/facebook-circular-logo.png'),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: Image.asset('assets/images/google.png'),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                            },
                            icon: Icon(Icons.add_call,
                                color: AppColors.fontColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
