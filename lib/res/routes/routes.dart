import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/routes/routes_name.dart';
import 'package:tic_tac_toe_2023/view/splash/screen/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: (() => const SplashScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
      ];
}
