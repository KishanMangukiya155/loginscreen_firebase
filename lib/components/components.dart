import 'package:flutter/material.dart';
import 'package:loginscreen/utils/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../view/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.isOutlined = false,
      required this.onPressed,
      this.width = 280});

  final String buttonText;
  final bool isOutlined;
  final Function onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 4,
        child: Container(
          width: width,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: isOutlined ? Colors.white : kTextColor,
            border: Border.all(color: kTextColor, width: 2.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: isOutlined ? kTextColor : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopScreenImage extends StatelessWidget {
  const TopScreenImage({super.key, required this.screenImageName});
  final String screenImageName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 40,
        color: AppColors.fontColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.textField});
  final TextField textField;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          width: 2.5,
          color: kTextColor,
        ),
      ),
      child: textField,
    );
  }
}

class CustomBottomScreen extends StatelessWidget {
  const CustomBottomScreen({
    super.key,
    required this.textButton,
    required this.question,
    this.heroTag = '',
    required this.buttonPressed,
    required this.questionPressed,
    required this.color,
  });
  final String textButton;
  final String question;
  final String heroTag;
  final Function buttonPressed;
  final Function questionPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: GestureDetector(
              onTap: () {
                questionPressed();
              },
              child:
                  Text(question, style: TextStyle(color: AppColors.fontColor)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Hero(
            tag: heroTag,
            child: CustomButton(
              buttonText: textButton,
              width: 150,
              onPressed: () {
                buttonPressed();
              },
            ),
          ),
        ),
      ],
    );
  }
}

Alert signUpAlert({
  required Function onPressed,
  required String title,
  required String desc,
  required String btnText,
  required BuildContext context,
}) {
  return Alert(
    context: context,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        onPressed: () {
          onPressed();
        },
        width: 120,
        child: Text(
          btnText,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    ],
  );
}

Alert showAlert({
  required Function onPressed,
  required String title,
  required String desc,
  required BuildContext context,
}) {
  return Alert(
    context: context,
    type: AlertType.error,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        onPressed: () {
          onPressed();
        },
        width: 120,
        child: const Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  );
}