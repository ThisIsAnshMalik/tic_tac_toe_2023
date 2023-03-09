import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/routes/routes_name.dart';
import 'package:tic_tac_toe_2023/utils/utils.dart';

class CreateRoomController extends GetxController {
  RxBool loading = false.obs;
  RxString playerX = "".obs;
  RxString playerY = "".obs;

  final nameController = TextEditingController().obs;
  final roomIdController = TextEditingController().obs;

  Future creatRoom({required BuildContext context}) async {
    loading.value = true;
    String roomId = roomIdController.value.text.toString();
    String nickname = nameController.value.text.toString();
    final ref = FirebaseFirestore.instance.collection('gameroom');

    try {
      await ref.doc(roomId).set({
        "P1 joined": true,
        "P2 joined": false,
        "room id": roomId,
        "player data": {"P1 name": nickname, "P2 name": ""}
      }).then((value) {
        loading.value = false;
        debugPrint("room created");
        Utils.snackBar("Created", "room created");
        Get.offNamed(RouteName.onlineGameView, arguments: {roomId});
      }).onError((error, stackTrace) {
        loading.value = false;
        debugPrint("error in creating room :- ${error.toString()}");
        Utils.snackBar("error", "error in creating room");
      });
    } catch (e) {
      loading.value = false;
      debugPrint("error in trying creating room :- ${e.toString()}");
      Utils.snackBar("error", "error in trying creating room");
    }
  }
}
