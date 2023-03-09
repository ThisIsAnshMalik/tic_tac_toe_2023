import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/routes/routes_name.dart';

class OnlineGameController extends GetxController {
//-----------------------------------------------------------------------------//
  Stream<DocumentSnapshot> getRoomData({required String roomId}) {
    return FirebaseFirestore.instance
        .collection('gameroom')
        .doc(roomId)
        .snapshots(includeMetadataChanges: true);
  }

//-----------------------------------------------------------------------------//
  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: const Text("Exit"),
      onPressed: () {
        Get.offNamed(RouteName.onlineOptionView);
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text(
        'You want to quit the Game?',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Arial',
        ),
      ),
      actions: [okButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
