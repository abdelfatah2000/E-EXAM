
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double fontSize;
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColor;
  final Color textColor;
  final Widget page2;
  final Widget page1;

  void routeTo(   Widget page1,Widget page2, BuildContext context) {
    Navigator.of(context).push(
      PageTransition(
inheritTheme: true,
        ctx: context,
        childCurrent:page1 ,
        child: page2,
        type: PageTransitionType.rightToLeft,
        duration: Duration(milliseconds: 100),
      ),
    );
  }

  const CustomButton({
    Key? key,
    required this.name,
    required this.fontSize,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonColor,
    required this.textColor,
    required this.page2, required this.page1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4,
          ),
          border: Border.all(
            color: textColor,
          )),
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () => routeTo(page1,page2, context),
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            buttonColor,
          ),
        ),
      ),
    );
  }
}
