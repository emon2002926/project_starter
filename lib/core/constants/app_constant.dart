class AppConstant {
  AppConstant._privateConstructor();
  static final AppConstant _instance = AppConstant._privateConstructor();
  static AppConstant get instance => _instance;

  // final String appLogo = "assets/logo/app_logo_with_name.png";
  final String font = "Montserrat";
  final String playfair = "PlayfairDisplay";
  final String poppins = "Poppins";
  final String GOOGLE_MAPS_API_KEY = "API_KEY";
  final String scavengerHunt = "A Scavenger Hunt";
  final String freeTour = "Free Tour";
  final double DEAFULT_CAMERA_ZOOM = 15;
  final String baseUrl = 'http://10.10.7.76:8000';
  // Endpoints
  final String loginEndpoint = '/api/auth/sign_in/';
  final String singUpEndpoint = '/api/auth/register/';

}
