import 'package:get/get.dart';
import '../../../../core/constants/app_assert_image.dart';
import '../data/model/preference_option.dart';
enum PreferenceStep { language, supermarkets }

class LanguageController extends GetxController {
  // step
  final step = PreferenceStep.language.obs;

  // language options
  final languages = [
    PreferenceOption(label: 'Dutch',  asset: AppAssertImage.instance.dutchFlag),
    PreferenceOption(label: 'English', asset: AppAssertImage.instance.englishFlag),
  ];

  // supermarket options
  final supermarkets = [
    PreferenceOption(label: 'Albert Heijn', asset: AppAssertImage.instance.dutchFlag),
    PreferenceOption(label: 'Jumbo',        asset: AppAssertImage.instance.dutchFlag),
    PreferenceOption(label: 'Lidl',         asset: AppAssertImage.instance.dutchFlag),
    PreferenceOption(label: 'Aldi',         asset: AppAssertImage.instance.dutchFlag),
  ];

  // selections
  final selectedLangIndex = RxnInt();
  final selectedMarketIndexes = <int>{}.obs; // allow multi-select

  // actions
  void selectLang(int i) => selectedLangIndex.value = i;

  void toggleMarket(int i) {
    if (selectedMarketIndexes.contains(i)) {
      selectedMarketIndexes.remove(i);
    } else {
      selectedMarketIndexes.add(i);
    }
  }

  bool get canContinue {
    return step.value == PreferenceStep.language
        ? selectedLangIndex.value != null
        : selectedMarketIndexes.isNotEmpty;
  }

  String get pageTitle => step.value == PreferenceStep.language
      ? 'Choose your language'
      : 'Select your supermarkets';

  String get ctaText => step.value == PreferenceStep.language ? 'Continue' : 'Finish';

  void continueNext() {
    if (!canContinue) return;

    if (step.value == PreferenceStep.language) {
      // move to supermarket step
      step.value = PreferenceStep.supermarkets;
    } else {
      // done → go where you want
      // Get.offAllNamed('/home');
    }
  }
}