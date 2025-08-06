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
    this.isLoading = false, this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final double radius = borderRadius ?? 24;

    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 48,
      child: GestureDetector(
        onTap: isLoading ? () {} : onPressed,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB95FEC), Color(0xff5671CC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(radius),
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
