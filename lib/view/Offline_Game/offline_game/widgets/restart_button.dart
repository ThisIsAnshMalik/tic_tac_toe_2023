import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/view/Offline_Game/offline_game/controller/offline_game_controller.dart';

class RestartButton extends StatelessWidget {
  RestartButton({Key? key}) : super(key: key);
  final offlineGameController = Get.put(OfflineGameController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        onPressed: () {
          offlineGameController.startGame();
        },
        child: const Text("Restart Game"));
  }
}
