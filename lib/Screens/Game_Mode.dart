import 'package:flutter/material.dart ';
import 'package:go_router/go_router.dart';
import 'package:twentyone/Widgets/Custom_Button.dart';
import 'package:twentyone/Widgets/Responsive.dart';

class GameType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                onTap: () {
                  context.go('/game/single');
                },
                text: "Single Player"),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                onTap: () {
                  context.go('/lobby');
                },
                text: "Multi Player"),
          ],
        ),
      ),
    ));
  }
}
