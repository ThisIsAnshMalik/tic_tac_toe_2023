import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/Colors/app_colors.dart';
import 'package:tic_tac_toe_2023/view/offline_game/controller/offline_game_controller.dart';

class GameContainer extends StatelessWidget {
  GameContainer({Key? key}) : super(key: key);
  final offlineGameController = Get.put(OfflineGameController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.6,
      width: Get.width * 2,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (context, int index) {
            return _box(index);
          }),
    );
  }

  Widget _box(int index) {
    return Obx(() {
      return InkWell(
        onTap: () {
          //on click of box
          if (offlineGameController.gameEnd.value ||
              offlineGameController.occupied[index].isNotEmpty) {
            //Return if game already ended or box already clicked
            return;
          } else {
            offlineGameController.occupied[index] =
                offlineGameController.currentPlayer.value;
            offlineGameController.changeTurn();
            checkForWinner();
            checkForDraw();
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: offlineGameController.occupied[index].isEmpty
                  ? AppColor.wightColor
                  : offlineGameController.occupied[index] ==
                          offlineGameController.playerX.value
                      ? Colors.red
                      : Colors.green,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(14)),
          margin: const EdgeInsets.all(8),
          child: Obx(() {
            return Center(
              child: Text(
                offlineGameController.occupied[index],
                style: const TextStyle(fontSize: 50),
              ),
            );
          }),
        ),
      );
    });
  }

  checkForWinner() {
    //Define winning positions
    List<List<int>> winningList = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var winningPos in winningList) {
      String playerPosition0 = offlineGameController.occupied[winningPos[0]];
      String playerPosition1 = offlineGameController.occupied[winningPos[1]];
      String playerPosition2 = offlineGameController.occupied[winningPos[2]];

      if (playerPosition0.isNotEmpty) {
        if (playerPosition0 == playerPosition1 &&
            playerPosition0 == playerPosition2) {
          //all equal means player won
          showGameOverMessage("Player $playerPosition0 Won");
          offlineGameController.gameEnd.value = true;
          return;
        }
      }
    }
  }

  checkForDraw() {
    if (offlineGameController.gameEnd.value) {
      return;
    }
    bool draw = true;
    for (var occupiedPlayer in offlineGameController.occupied) {
      if (occupiedPlayer.isEmpty) {
        //at least one is empty not all are filled
        draw = false;
      }
    }
    if (draw) {
      showGameOverMessage("Draw");
      offlineGameController.gameEnd.value = true;
    }
  }

  showGameOverMessage(String message) {}
}
