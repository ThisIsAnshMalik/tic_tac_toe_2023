import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/components/custom_button.dart';
import 'package:tic_tac_toe_2023/res/routes/routes_name.dart';

class OnlineOptionScreen extends StatefulWidget {
  const OnlineOptionScreen({Key? key}) : super(key: key);

  @override
  State<OnlineOptionScreen> createState() => _OnlineOptionScreenState();
}

class _OnlineOptionScreenState extends State<OnlineOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                ontap: () {
                  Get.toNamed(RouteName.createRoomView);
                },
                buttonText: const Text("Create Room")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomButton(
                ontap: () {
                  Get.toNamed(RouteName.joinRoomView);
                },
                buttonText: const Text("Join Room"))
          ],
        ),
      ),
    );
  }
}
