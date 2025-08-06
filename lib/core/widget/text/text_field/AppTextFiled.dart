import 'package:flutter/material.dart';
class AppTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Color? borderColor;

  const AppTextField({
    super.key,
    this.label,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.focusNode,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Conditional label display
        if (label != null && label!.isNotEmpty)
          Text(
            label!,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          focusNode: focusNode,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16, // Increased font size for better readability
            fontFamily: 'Poppins',
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16, // Match the font size to the label
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
            ),
            filled: true,
            fillColor: const Color(0xFFF9F9F9), // Light background for input
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Colors.grey[700], size: 20)
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.grey[700], size: 20)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18, // Increased vertical padding for bigger text field
              horizontal: 14,
            ),
            // Outline border with pink color and border radius
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: borderColor ?? Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color:  Color(0xf9f3bac9), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xc0f3bac9), width: 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
