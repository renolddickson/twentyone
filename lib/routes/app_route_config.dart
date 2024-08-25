import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twentyone/Screens/Create_Player.dart';
import 'package:twentyone/Screens/Create_Room.dart';
import 'package:twentyone/Screens/Error.dart';
import 'package:twentyone/Screens/Game_Menu.dart';
import 'package:twentyone/Screens/Game_Mode.dart';
import 'package:twentyone/Screens/Join_Room.dart';
import 'package:twentyone/Screens/Play_With_Friend.dart';
import 'package:twentyone/Screens/Rules.dart';
import 'package:twentyone/Screens/twentyone_board.dart';
import 'package:twentyone/Screens/twentyone_board_multi.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => FutureBuilder(
        future: _buildConditionalWidget(context, state),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data as Widget;
          } else {
            return const Center(
                child: CircularProgressIndicator()); // Loading indicator
          }
        },
      ),
    ),
    // GoRoute(
    //   path: "/new",
    //   builder: (context, state) => CreatePlayer(),
    // ),
    GoRoute(
      path: "/help",
      builder: (context, state) => Rules(),
    ),
    GoRoute(
      path: '/game/:mode',
      builder: (context, state) {
        final mode = state.pathParameters['mode'];
        return TwentyoneBoard(mode: mode);
      },
    ),
    GoRoute(
      path: '/game/:mode/:id',
      builder: (context, state) {
        final mode = state.pathParameters['mode'];
        final id = state.pathParameters['id'];
        return TwentyoneBoardMulti(mode: mode, id: id);
      },
    ),
    GoRoute(
      path: "/type",
      builder: (context, state) => GameType(),
    ),
    GoRoute(
      path: "/lobby",
      builder: (context, state) => Lobby(),
    ),
    GoRoute(
      path: "/create",
      builder: (context, state) => const CreateRoom(),
    ),
    GoRoute(
      path: "/join",
      builder: (context, state) => const JoinRoom(),
    )
  ],
  errorBuilder: (context, state) => ErrorPage(),
);
Future<Widget> _buildConditionalWidget(
    BuildContext context, GoRouterState state) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String savedName = prefs.getString('nickname') ?? '';
  return savedName.isNotEmpty ? GameMenu(savedName) : CreatePlayer();
}
