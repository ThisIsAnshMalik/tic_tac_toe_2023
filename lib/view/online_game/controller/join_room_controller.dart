import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/routes/routes_name.dart';

class JoinRoomController extends GetxController {
  RxBool loading = false.obs;
  final nameController = TextEditingController().obs;
  final gameIDController = TextEditingController().obs;

  Future joinRoom({required BuildContext context}) async {
    loading.value = true;
    var roomId = gameIDController.value.text.toString();
    var nickname = nameController.value.text.toString();
    final ref = FirebaseFirestore.instance.collection('gameroom');
    final varResult = await ref.doc(roomId).get();
    if (varResult.exists) {
      await ref.doc(roomId).set({
        "P2 joined": true,
        "currentPlayer": "X",
        "player data": {
          "P2 name": nickname,
        }
      }, SetOptions(merge: true)).then((value) {
        loading.value = false;
        Get.offNamed(RouteName.onlineGameView);
      }).onError((error, stackTrace) {
        loading.value = false;
        debugPrint("error in joining room :- ${error.toString()}");
      });
    } else {
      loading.value = false;
      debugPrint("cannot find the room");
    }
  }
}
