import 'package:get/get.dart';
import 'package:tic_tac_toe_2023/res/routes/routes_name.dart';
import 'package:tic_tac_toe_2023/view/home/screen/home_screen.dart';
import 'package:tic_tac_toe_2023/view/online_game/screen/create_room.dart';
import 'package:tic_tac_toe_2023/view/online_game/screen/join_room.dart';
import 'package:tic_tac_toe_2023/view/online_game/screen/online_game_screen.dart';

import '../../view/offline_game/screen/offline_game_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.homeView,
            page: (() => const HomeScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.offlineGameView,
            page: (() => const OfflineGameScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.createRoomView,
            page: (() => const CreateRoomScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.joinRoomView,
            page: (() => const JoinRoomScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.onlineGameView,
            page: (() => const OnlineGameScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
      ];
}
