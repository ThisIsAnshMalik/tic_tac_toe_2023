import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/components/custom_button.dart';
import 'package:tic_tac_toe_2023/res/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(ontap: () {}, buttonText: "Online"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomButton(
                ontap: () {
                  Get.toNamed(RouteName.offlineGameView);
                },
                buttonText: "offline")
          ],
        ),
      ),
    );
  }
}
