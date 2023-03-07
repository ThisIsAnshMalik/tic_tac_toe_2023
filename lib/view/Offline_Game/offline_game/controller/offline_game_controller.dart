import 'package:get/get.dart';

class OfflineGameController extends GetxController {
  RxString playerX = "X".obs;
  RxString playerY = "O".obs;
  RxString currentPlayer = "".obs;
  RxBool gameEnd = false.obs;
  RxList<String> occupied = ["", "", "", "", "", "", "", "", ""].obs;

  void startGame() {
    currentPlayer.value = playerX.value;
    gameEnd.value = false;
    occupied.value = ["", "", "", "", "", "", "", "", ""];
  }

  changeTurn() {
    if (currentPlayer == playerX) {
      currentPlayer = playerY;
    } else {
      currentPlayer = playerX;
    }
  }
}
