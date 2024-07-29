import 'package:flutter/material.dart';

class PrimaryBtnWidget extends StatelessWidget {
  const PrimaryBtnWidget({
    super.key,
    this.btnBgColor = Colors.black,
    this.btnBorderColor = Colors.transparent,
    this.btnBorderWidth = 2.0,
    this.btnTxtColor = Colors.white,
    required this.btnChild,
    required this.onPressed,
  });

  // Background, Border, Text, Content, onPressed
  final Color? btnBgColor;
  final Color btnBorderColor;
  final double btnBorderWidth;
  final Color? btnTxtColor;
  final Widget btnChild;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: btnBgColor,
            foregroundColor: btnTxtColor,
            minimumSize: const Size(double.infinity, 56),
            textStyle: Theme.of(context).textTheme.bodySmall,
            side: BorderSide(width: btnBorderWidth, color: btnBorderColor),
            shadowColor: Colors.transparent),
        child: btnChild,
      ),
    );
  }
}
