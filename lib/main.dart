import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/Colors/app_colors.dart';
import 'package:tic_tac_toe_2023/res/localization/languages.dart';
import 'package:tic_tac_toe_2023/res/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale('en', 'US'),
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: AppColor.primaryColor),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
