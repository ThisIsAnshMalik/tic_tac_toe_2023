import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/Colors/app_colors.dart';
import 'package:tic_tac_toe_2023/view/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColor.wightColor,
        ),
      ),
    );
  }
}
