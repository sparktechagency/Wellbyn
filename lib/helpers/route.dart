import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:wellbyn/views/screen/splash_screen_animation/animatedSplashScreen.dart';


import '../views/screen/Home/home_screen.dart';
import '../views/screen/auth/role.dart';

class AppRoutes {

  static String homeScreen = "/home_screen";
  static String loginScreen = "/login_screen";
  static String Splash = "/AnimatedSplashScreen";

  static List<GetPage> page = [
    GetPage(name: homeScreen, page: () => HomeScreen(), transition: Transition.noTransition),
    GetPage(name: loginScreen, page: () =>  LoginScreen()),
    GetPage(name: Splash, page: () =>  AnimatedSplashScreen()),
  ];
}
