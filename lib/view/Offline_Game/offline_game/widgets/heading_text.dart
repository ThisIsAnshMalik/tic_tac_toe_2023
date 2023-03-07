import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/Colors/app_colors.dart';
import '../controller/offline_game_controller.dart';

class HeadingText extends StatelessWidget {
  HeadingText({Key? key}) : super(key: key);
  final offlineGameController = Get.put(OfflineGameController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Tic Tac Toe",
          style: TextStyle(
            color: AppColor.greenColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx((() {
          return Text(
            " ${offlineGameController.currentPlayer} turn",
            style: const TextStyle(
              color: AppColor.wightColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          );
        }))
      ],
    );
  }
}
