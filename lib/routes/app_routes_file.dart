import 'package:get/get.dart';
import 'package:project_starter/features/onboarding/preference_selection/views/language_select_screen.dart';
import '../features/auth/views/login_screen.dart';
import '../features/auth/views/otp_verification_page.dart';
import '../features/auth/views/reset_password_screen.dart';
import '../features/auth/views/sign_up_screen.dart';
import '../features/auth/views/verify_email_screen.dart';
import '../features/home/home_screen.dart';
import '../features/onboarding/splash/splash_screen.dart';
import 'app_routes.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  /////////////  Authentication
  GetPage(name: AppRoutes.login, page: () =>  LoginScreen(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.register, page: () => const SignUpScreen(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.verifyEmail, page: () =>  VerifyEmailScreen(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.verifyCodePage, page: () =>  OtpVerificationPage(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen(),transition: Transition.rightToLeftWithFade, ),
  /////////////  initial or splash screen
  GetPage(name: AppRoutes.initial, page: () => const SplashScreen(), transition: Transition.rightToLeftWithFade, ),
  GetPage(name: AppRoutes.languageSelection, page: () =>  PreferenceSelectScreen(), transition: Transition.rightToLeftWithFade, ),



  GetPage(name: AppRoutes.home, page: () =>  HomeScreen(), transition: Transition.rightToLeftWithFade, ),


];