import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_starter/core/constants/app_assert_image.dart';
import 'package:project_starter/features/onboarding/preference_selection/widgets/card.dart';
import '../../../../core/widget/buttons/app_button.dart';
import '../../../../core/widget/text/app_text.dart';
import '../view_models/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// assumes you already have these:
/// import 'app_text.dart';      // AppText widget
/// import 'app_button.dart';    // AppButton widget
/// import 'lang_card.dart';     // LangCard widget
/// import 'app_assets.dart';    // AppAssertImage
/// import 'language_controller.dart'; // contains PreferenceStep + LanguageController
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreferenceSelectScreen extends StatelessWidget {
  PreferenceSelectScreen({super.key});

  final LanguageController controller = Get.put(LanguageController());

  static const _navy = Color(0xFF18365D);
  static const _cta = Color(0xFFE53E3E);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final h = mq.size.height;
    final w = mq.size.width;

    const double gap = 16;
    final double horizontalPad = w * 0.06;
    final double cardW = (w - (horizontalPad * 2) - gap) / 2;

    return Scaffold(
      backgroundColor: Colors.white,

      // Keep scrollable content in body
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPad),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: h * 0.065),

                // Logo
                Image.asset(
                  AppAssertImage.instance.searchLogo,
                  height: 64,
                ),
                const SizedBox(height: 12),

                // App title
                const AppText(
                  data: 'DealDetector',
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: _navy,
                  textScaleFactor: 1.0,
                ),

                const SizedBox(height: 28),

                // Section title
                Obx(() => AppText(
                  data: controller.pageTitle,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: _navy,
                  textScaleFactor: 1.0,
                )),

                const SizedBox(height: 18),

                // Language / Supermarkets section
                Obx(() {
                  if (controller.step.value == PreferenceStep.language) {
                    final sel = controller.selectedLangIndex.value;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LangCard(
                          width: cardW,
                          asset: controller.languages[0].asset,
                          label: controller.languages[0].label,
                          selected: sel == 0,
                          onTap: () => controller.selectLang(0),
                        ),
                        const SizedBox(width: gap),
                        LangCard(
                          width: cardW,
                          asset: controller.languages[1].asset,
                          label: controller.languages[1].label,
                          selected: sel == 1,
                          onTap: () => controller.selectLang(1),
                        ),
                      ],
                    );
                  } else {
                    return Wrap(
                      spacing: gap,
                      runSpacing: gap,
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        controller.supermarkets.length,
                            (i) {
                          final opt = controller.supermarkets[i];
                          final selected =
                          controller.selectedMarketIndexes.contains(i);
                          return SizedBox(
                            width: cardW,
                            child: LangCard(
                              width: cardW,
                              asset: opt.asset,
                              label: opt.label,
                              selected: selected,
                              onTap: () => controller.toggleMarket(i),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }),

                SizedBox(height: h * 0.15), // just for breathing space above button
              ],
            ),
          ),
        ),
      ),

      // Button stays fixed at bottom
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: horizontalPad, vertical: 12),
        child: Obx(
              () => AppButton(
            buttonText: controller.ctaText,
            onPressed:
            controller.canContinue ? controller.continueNext : () {},
            borderRadius: 12,
            buttonHeight: 56,
            fillColor: _cta,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
