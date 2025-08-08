import 'package:flutter/material.dart';
import 'dart:ui';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final FontWeight? fontWeight;
  final bool isLoading;
  final double? elevation;
  final Color? fillColor;
  final Color? borderColor; // New parameter for border color
  final double? borderWidth; // New parameter for border width

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.textColor,
    this.borderRadius,
    this.fontSize,
    this.buttonHeight,
    this.buttonWidth,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight,
    this.isLoading = false,
    this.elevation,
    this.fillColor,
    this.borderColor = Colors.black, // Default border color
    this.borderWidth , // Default border width
  });

  @override
  Widget build(BuildContext context) {
    final double radius = borderRadius ?? 10;

    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 48,
      child: GestureDetector(
        onTap: isLoading ? () {} : onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: fillColor ?? Color(0xffE53E3E),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: borderColor ?? Colors.transparent, // Apply the border color
              width: borderWidth ?? 00, // Apply the border width
            ),
          ),
          child: ElevatedButton(
            onPressed: isLoading ? () {} : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Transparent so the gradient shows
              elevation: elevation ?? 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              padding: EdgeInsets.zero,
            ),
            child: isLoading
                ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null) ...[
                  Icon(
                    prefixIcon,
                    color: textColor ?? Colors.white,
                    size: fontSize ?? 24,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  ),
                ),
                if (suffixIcon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    suffixIcon,
                    color: textColor ?? Colors.white,
                    size: fontSize ?? 24,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

