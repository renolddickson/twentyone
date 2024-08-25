import 'package:flutter/material.dart ';
import 'package:go_router/go_router.dart';
import 'package:twentyone/Widgets/Custom_Button.dart';
import 'package:twentyone/Widgets/Responsive.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

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
                  context.go('/create');
                },
                text: "Create Room"),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                onTap: () {
                  context.go('/join');
                },
                text: "Joine Room"),
          ],
        ),
      ),
    ));
  }
}
