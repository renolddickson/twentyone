import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:twentyone/Widgets/Custom_Text.dart';

class GameMenu extends StatelessWidget {
  final String playername; // Declare the parameter

  // Constructor to receive the parameter
  const GameMenu(this.playername, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              shadows: const [
                Shadow(
                  blurRadius: 40,
                  color: Colors.purple,
                )
              ],
              text: "Welcome $playername !",
              fontSize: 30,
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/type');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0, // Vertical (block) padding
                  horizontal: 24.0, // Horizontal (inline) padding
                ),
              ),
              child: Text('Play'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/help');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0, // Vertical (block) padding
                  horizontal: 24.0, // Horizontal (inline) padding
                ),
              ),
              child: Text('Help'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Are you sure you want to quit?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () => SystemNavigator.pop(),
                        child: Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0, // Vertical (block) padding
                  horizontal: 24.0, // Horizontal (inline) padding
                ),
              ),
              child: const Text('Quit'),
            ),
          ],
        ),
      ),
    );
  }
}
