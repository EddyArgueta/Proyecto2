import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    super.key,
    required this.imagePath,
    required this.iconSize,
    this.onPressed,
  });

  final String imagePath;
  final double iconSize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        imagePath,
        width: iconSize,
        height: iconSize,
      ),
      onPressed: onPressed,
    );
  }
}