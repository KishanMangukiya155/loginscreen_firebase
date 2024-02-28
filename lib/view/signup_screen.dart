import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:loading_overlay/loading_overlay.dart';
import 'package:loginscreen/utils/colors.dart';

import '../components/components.dart';
import 'constants.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String id = 'signup_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;
  late String _confirmPass;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popAndPushNamed(context, HomeScreen.id);
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: LoadingOverlay(
          isLoading: _saving,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopScreenImage(screenImageName: 'signup.png'),
                ScreenTitle(title: 'Sign Up'),
                SizedBox(height: 20),
                CustomTextField(
                  textField: TextField(
                    onChanged: (value) {
                      _email = value;
                    },
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: AppColors.fontColor)),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  textField: TextField(
                    obscureText: true,
                    onChanged: (value) {
                      _password = value;
                    },
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: AppColors.fontColor)),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  textField: TextField(
                    obscureText: true,
                    onChanged: (value) {
                      _confirmPass = value;
                    },
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: AppColors.fontColor)),
                  ),
                ),
                SizedBox(height: 10),
                CustomBottomScreen(
                  textButton: 'Sign Up',
                  heroTag: 'signup_btn',
                  question: 'Have an account?',
                  buttonPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {
                      _saving = true;
                    });
                    if (_confirmPass == _password) {
                      try {
                        await _auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);

                        if (context.mounted) {
                          signUpAlert(
                            context: context,
                            title: 'GOOD JOB',
                            desc: 'Go login now',
                            btnText: 'Login Now',
                            onPressed: () {
                              setState(() {
                                _saving = false;
                                Navigator.popAndPushNamed(
                                    context, SignUpScreen.id);
                              });
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                          ).show();
                        }
                      } catch (e) {
                        signUpAlert(
                            context: context,
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            title: 'SOMETHING WRONG',
                            desc: 'Close the app and try again',
                            btnText: 'Close Now');
                      }
                    } else {
                      showAlert(
                          context: context,
                          title: 'WRONG PASSWORD',
                          desc:
                              'Make sure that you write the same password twice',
                          onPressed: () {
                            Navigator.pop(context);
                          }).show();
                    }
                  },
                  questionPressed: () async {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  color: AppColors.fontColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
