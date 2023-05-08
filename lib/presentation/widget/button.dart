import 'package:flutter/material.dart';
import 'package:mynotes/utils/constants.dart';

class Button extends StatelessWidget {
  final String textButton;
  final bool btnCommand;
  final Function() onTap;

  const Button({
    required this.textButton,
    required this.onTap,
    required this.btnCommand,
  });

  @override
  Widget build(BuildContext context) {
    final Color btnColor;
    if (btnCommand) {
      btnColor = colorPicker[0];
    } else {
      btnColor = colorPicker[2];
    }
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0))),
      child: Text(
        textButton,
        style: sHeading2White,
      ),
    );
  }
}
