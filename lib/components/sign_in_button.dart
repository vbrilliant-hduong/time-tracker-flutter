import 'package:flutter/material.dart';
import 'package:timetrackerflutter/common_widgets/custom_raised_button.dart';
import 'package:timetrackerflutter/constants.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
          color: color,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: kButtonFontSize),
          ),
          onPressed: onPressed,
        );
}
