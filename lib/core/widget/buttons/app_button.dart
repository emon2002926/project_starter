import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSize;
  final double? elevation;
  final double? buttonHeight;
  final double? buttonWidth;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final FontWeight? fontWeight;
  final bool isLoading; // Added to handle loading state

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.fontSize,
    this.elevation,
    this.buttonHeight,
    this.buttonWidth,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight,
    this.isLoading = false, // Added to control the loading state
  });

  @override
  Widget build(BuildContext context) {
    final double radius = borderRadius ?? 24;

    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 48,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed, // Ensure that onPressed is always a valid function
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFF69BE28), // ✅ Manual Green (Figma)
          foregroundColor: textColor ?? Colors.white, // ✅ Default white text
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
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
    );
  }
}
