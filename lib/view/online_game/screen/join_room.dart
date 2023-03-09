import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/components/custom_button.dart';
import 'package:tic_tac_toe_2023/res/components/custom_textfield.dart';
import 'package:tic_tac_toe_2023/view/online_game/controller/join_room_controller.dart';

import '../../../res/components/custom_text.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final joinRoomController = Get.put(JoinRoomController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(text: "Join Room", fontSize: 75, shadows: const [
                    Shadow(blurRadius: 40, color: Colors.blue)
                  ]),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Name is required");
                        }
                        return null;
                      },
                      controller: joinRoomController.nameController.value,
                      hintText: "Enter your nickname"),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Room Id is required");
                        } else if (value.length < 6) {
                          return ("Room Id must be greater than 6");
                        }
                        return null;
                      },
                      controller: joinRoomController.gameIDController.value,
                      hintText: "Enter Game ID"),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  CustomButton(
                      ontap: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        joinRoomController.joinRoom(context: context);
                      },
                      buttonText: const Text("Join"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
