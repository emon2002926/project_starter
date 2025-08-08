import 'package:flutter/material.dart';

import '../../../../core/widget/text/app_text.dart';
class LangCard extends StatelessWidget {
  final String asset;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final double width;

  const LangCard({
    required this.asset,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.width,
  });

  static const _navy = Color(0xFF18365D);
  static const _cardBg = Color(0xFFF4F8FF);
  static const _cardBorder = Color(0xFFE6EEF7);

  @override
  Widget build(BuildContext context) {
    final Color bg = selected ? const Color(0xFFE8F0FF) : _cardBg;
    final Color border = selected ? const Color(0xFF0B284C) : _cardBorder;
    final double bw = selected ? 2 : 1;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: width,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border, width: bw),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 1.38,
                child: Image.asset(asset, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            AppText(
              data: label,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _navy,
              textAlign: TextAlign.center,
              textScaleFactor: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}