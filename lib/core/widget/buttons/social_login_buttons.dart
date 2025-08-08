import 'package:flutter/material.dart';

import '../text/app_text.dart';
class SocialLoginButtons extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String iconPath;
  final Color? fillColor; // Default fill color
  final Color? labelColor; // Default label color
  final Color? borderColor; // Default border color
  const SocialLoginButtons({super.key, required this.title,
    required this.onPressed, required this.iconPath,
    this.fillColor, this.labelColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    // Get dynamic height and width from MediaQuery0xff18365D
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.8, // You can adjust this percentage as needed
      height: screenHeight * 0.06, // You can adjust this based on your design
      child: OutlinedButton.icon(
        onPressed: onPressed, // Call the onPressed callback
        icon: SizedBox(
          width: 20,
          height: 20,
          child: Image.asset(iconPath),
        ),
        label: AppText(color: labelColor??Colors.white, data: title),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: fillColor ?? Colors.black, // Fill color (adjust as per your need)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side:  BorderSide(color: borderColor?? Colors.grey, width: 1),
        ),
      ),
    );
  }
}