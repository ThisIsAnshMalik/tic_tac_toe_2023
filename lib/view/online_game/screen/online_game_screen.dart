import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/Colors/app_colors.dart';
import 'package:tic_tac_toe_2023/view/online_game/controller/online_game_controller.dart';

class OnlineGameScreen extends StatefulWidget {
  const OnlineGameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnlineGameScreen> createState() => _OnlineGameScreenState();
}

class _OnlineGameScreenState extends State<OnlineGameScreen> {
  final onlineGameController = Get.put(OnlineGameController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onlineGameController.showAlertDialog(context);
      },
      child: Scaffold(
          body: StreamBuilder(
        stream:
            onlineGameController.getRoomData(roomId: Get.arguments.toString()),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Error to connecting to the room"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.wightColor,
              ),
            );
          } else {
            return ListView(
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                // DisplayRoomId(snapshot.data),
                // DisplayPlayers(snapshot.data),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                // snapshot.data!["P1 joined"] == true &&
                //         snapshot.data!["P2 joined"] == true
                //     ? TicTacToeBoard(size, snapshot.data)
                //     : const Center(
                //         child: Text("Waiting for another player to join "))
              ],
            );
          }
        },
      )),
    );
  }
}
