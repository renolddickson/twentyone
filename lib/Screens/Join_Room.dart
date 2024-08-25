import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Widgets/Custom_Button.dart';
import '../Widgets/Custom_Text.dart';
import '../Widgets/Custom_TextField.dart';
import '../Widgets/Responsive.dart';

class JoinRoom extends StatefulWidget {
  static String routeName = 'join-room';
  const JoinRoom({Key? key}) : super(key: key);

  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameidcontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _gameidcontroller.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Responsive(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(shadows: [
              Shadow(
                blurRadius: 40,
                color: Colors.purple,
              )
            ], text: "Join Room", fontSize: 70),
            SizedBox(
              height: size.height * 0.08,
            ),
            CustomTextField(
                hintText: "Enter your nickname", controller: _nameController),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomTextField(
                hintText: "Enter  ID", controller: _gameidcontroller),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(
                onTap: (() {
                  context.go('/game/multi/id83y83y7');
                }),
                text: "Join")
          ],
        ),
      ),
    ));
  }
}
