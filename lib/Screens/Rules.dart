import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => context.go('/')),
          title: Text('21 - Number Increment Game Rules'),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Objective:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'The goal of the game is to reach the number 21 by taking turns incrementing the current number. Players can increment by either 1 or 2 on their turn. The player who reaches 21 is the winner, and the player who says the number 21 is the loser.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Game Rules:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '1. The game starts with the number 0.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '2. Players take turns to increment the current number by either 1 or 2.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '3. The maximum increment allowed per turn is 2.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '4. The first player to reach 21 is the loser.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '5. Players should say the incremented number clearly on their turn.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '6. If a player mistakenly says a number greater than 21, they lose the game.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Example Gameplay:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '- Player 1 starts with 0.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '- Player 1 says "1".',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '- Player 2 says "3".',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '- Player 1 says "5".',
                  style: TextStyle(fontSize: 16),
                ),
                // ... Add more gameplay steps
                SizedBox(height: 16),
                Text(
                  'Winning:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'The player who says "21" is the loser. The other player wins the game.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Notes:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '- The game can be played between two players.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Have Fun and Enjoy the Game!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
        ));
  }
}
