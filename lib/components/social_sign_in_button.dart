import 'package:flutter/material.dart';
import 'package:timetrackerflutter/common_widgets/custom_raised_button.dart';
import 'package:timetrackerflutter/constants.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        assert(assetName != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: kButtonFontSize),
              ),
              Image.asset('assets/images/pixel.png'),
            ],
          ),
          color: color,
          disableColor: true,
          onPressed: onPressed,
        );
}
