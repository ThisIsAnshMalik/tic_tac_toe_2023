import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/Colors/app_colors.dart';
import 'package:tic_tac_toe_2023/view/Offline_Game/offline_game/controller/offline_game_controller.dart';
import 'package:tic_tac_toe_2023/view/Offline_Game/offline_game/widgets/game_continer.dart';
import 'package:tic_tac_toe_2023/view/Offline_Game/offline_game/widgets/heading_text.dart';
import 'package:tic_tac_toe_2023/view/Offline_Game/offline_game/widgets/restart_button.dart';

class OfflineGameScreen extends StatefulWidget {
  const OfflineGameScreen({Key? key}) : super(key: key);

  @override
  State<OfflineGameScreen> createState() => _OfflineGameScreenState();
}

class _OfflineGameScreenState extends State<OfflineGameScreen> {
  final offlineGameController = Get.put(OfflineGameController());

  @override
  void initState() {
    offlineGameController.startGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeadingText(),
            GameContainer(),
            SizedBox(
              height: Get.height * 0.02,
            ),
            RestartButton(),
          ],
        ),
      ),
    );
  }
}
