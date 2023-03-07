import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/Colors/app_colors.dart';
import 'package:tic_tac_toe_2023/res/components/custom_button.dart';
import 'package:tic_tac_toe_2023/res/components/custom_text.dart';
import 'package:tic_tac_toe_2023/res/components/custom_textfield.dart';
import 'package:tic_tac_toe_2023/view/online_game/controller/create_room_controller.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final createRoomController = Get.put(CreateRoomController());

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
                  CustomText(text: "Create Room", fontSize: 70, shadows: const [
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
                      controller: createRoomController.nameController.value,
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
                      controller: createRoomController.roomIdController.value,
                      hintText: "generate room Id"),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Obx((() {
                    return CustomButton(
                        ontap: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            createRoomController.creatRoom(
                              context: context,
                            );
                          }
                        },
                        buttonText: createRoomController.loading.value == true
                            ? const CircularProgressIndicator(
                                color: AppColor.wightColor,
                              )
                            : const Text("Create "));
                  }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
