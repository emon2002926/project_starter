import 'package:flutter/material.dart';
import '../text/app_text.dart';
import 'dart:ui';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final Color? iconColor;
  final bool enableFrostEffect;
  final bool showSideButton;
  final VoidCallback? onSideButtonPressed;
  final IconData sideButtonIcon;
  final bool showBackButton;

  const BuildAppBar({
    super.key,
     this.title,
    this.titleColor,
    this.iconColor,
    this.enableFrostEffect = false,
    this.showSideButton = false,
    this.onSideButtonPressed,
    this.sideButtonIcon = Icons.more_vert,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final appBarContent = AppBar(
      backgroundColor: enableFrostEffect
          ? Colors.white.withOpacity(0.15)
          : Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: showBackButton, // ✅ Fix: prevent default back button
      leading: showBackButton
          ? IconButton(
        icon: Icon(Icons.arrow_back, color: iconColor ?? Colors.black),
        onPressed: () => Navigator.pop(context),
      )
          : null,
      title: Text(
        title?? "",
        style: TextStyle(
          color: titleColor ?? Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: showSideButton
          ? [
        IconButton(
          icon: Icon(sideButtonIcon, color: iconColor ?? Colors.white),
          onPressed: onSideButtonPressed,
        )
      ]
          : null,
    );

    return enableFrostEffect
        ? ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: appBarContent,
      ),
    )
        : appBarContent;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
