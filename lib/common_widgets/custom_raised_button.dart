import 'package:flutter/material.dart';
import '../constants.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({this.child, this.color, this.onPressed});
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kButtonHeight,
      child: RaisedButton(
        color: color,
        child: child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(kButtonBorderRadius),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
