import 'dart:async';

import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/routes/routes.dart';
import 'package:tic_tac_toe_2023/res/routes/routes_name.dart';

class SplashController extends GetxController {
  SplashController() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      Get.toNamed(RouteName.homeView);
    });
  }
}
