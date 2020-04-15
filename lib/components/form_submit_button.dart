import 'package:flutter/material.dart';
import 'package:timetrackerflutter/common_widgets/custom_raised_button.dart';
import 'package:timetrackerflutter/constants.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        super(
          color: Colors.indigo,
          disableColor: false,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: kButtonFontSize),
          ),
          onPressed: onPressed,
        );
}
