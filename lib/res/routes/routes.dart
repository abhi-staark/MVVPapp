import 'package:get/get.dart';
import 'package:mvvmapp1/res/routes/route_pages.dart';
import 'package:mvvmapp1/view/login_screen.dart';
import 'package:mvvmapp1/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteNames.splashscreen, page: () => const SplashScreen()),
        GetPage(name: RouteNames.loginScreen, page: () => const LoginScreen()),
      ];
}
