import 'package:flutter/material.dart';
import 'package:foodie/resources/color_manager.dart';
import 'package:foodie/resources/size_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.color = ColorManager.faintPinkColor,
    this.child,
    this.textColor = Colors.white,
    required this.onPressed,
    this.disabled = false,
    this.label = '',
    this.fontSize = SizeManager.FONT_SMALL,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color color;

  final Color textColor;

  final EdgeInsets padding;

  final String label;
  final bool disabled;
  final double fontSize;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: padding,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
      onPressed: disabled ? null : onPressed,
      child: child ??
          Text(
            label,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
    );
  }
}
