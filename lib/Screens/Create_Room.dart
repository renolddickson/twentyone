import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:twentyone/Widgets/Custom_Button.dart';
import 'package:twentyone/Widgets/Custom_Text.dart';
import 'package:twentyone/Widgets/Custom_TextField.dart';
import 'package:twentyone/Widgets/Responsive.dart';
import 'package:twentyone/resources/socket_method.dart';

class CreateRoom extends StatefulWidget {
  static String routeName = 'create-room';
  const CreateRoom({Key? key}) : super(key: key);

  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void dispose() {
    super.dispose();
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
            ], text: "Create Room", fontSize: 70),
            SizedBox(
              height: size.height * 0.08,
            ),
            CustomTextField(
                hintText: "Invite link", controller: _nameController),
            SizedBox(
              height: size.height * 0.02,
            ),
            CustomButton(
                onTap: (() => Share.share(_nameController.text,
                    subject: 'Click to join 21 with your friend !')),
                text: "Share")
          ],
        ),
      ),
    ));
  }
}
