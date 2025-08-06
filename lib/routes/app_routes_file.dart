import 'package:get/get.dart';
import '../features/auth/views/login_screen.dart';
import '../features/auth/views/otp_verification_page.dart';
import '../features/auth/views/reset_password_screen.dart';
import '../features/auth/views/sign_up_screen.dart';
import '../features/auth/views/verify_email_screen.dart';
import 'app_routes.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  // GetPage(name: AppRoutes.initial, page: () => const SplashScreen(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.login, page: () =>  LoginScreen(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.register, page: () => const SignUpScreen(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.verifyEmail, page: () =>  VerifyEmailScreen(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.verifyCodePage, page: () =>  OtpVerificationPage(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.resetPassword, page: () =>  const ResetPasswordScreen(), transition: Transition.rightToLeftWithFade, ),

  // GetPage(name: AppRoutes.citySearch, page: () => const CitySelection(), transition: Transition.rightToLeftWithFade, ),
  // GetPage(name: AppRoutes.landMark, page: () => const LandmarkPage(), transition: Transition.rightToLeftWithFade, ),
  // GetPage(name: AppRoutes.landmarkBrief, page: () => const BriefScreen(), transition: Transition.rightToLeftWithFade, ),
  // GetPage(name: AppRoutes.touristAttraction, page: () =>  TouristAttractionScreen(), transition: Transition.rightToLeftWithFade,),

  // GetPage(name: AppRoutes.submitPage, page: () =>  SubmitPage(), transition: Transition.rightToLeftWithFade, ),
  // GetPage(name: AppRoutes.mapPage, page: () =>  MapScreen(), transition: Transition.rightToLeftWithFade, ),
  // GetPage(name: AppRoutes.clues, page: () =>  ClueScreen(), transition: Transition.rightToLeftWithFade, ),
  // GetPage(name: AppRoutes.home, page: () => const HomeScreen(), transition: Transition.rightToLeftWithFade, ),
  // GetPage(name: AppRoutes.testPage, page: () => const MainStreetBoltPage(), transition: Transition.rightToLeftWithFade, ),
];