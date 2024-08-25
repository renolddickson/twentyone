import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twentyone/Widgets/Responsive.dart';
import '../Widgets/Custom_Text.dart';

class TwentyoneBoardMulti extends StatefulWidget {
  final String? mode;
  final String? id;
  const TwentyoneBoardMulti({Key? key, required this.mode, this.id})
      : super(key: key);

  @override
  _TwentyoneBoardMultiState createState() => _TwentyoneBoardMultiState();
}

class _TwentyoneBoardMultiState extends State<TwentyoneBoardMulti> {
  late ConfettiController _controller;
  int count = 0;
  int tempCount = 0;
  late bool isIncButtonDisable;
  late bool isDecButtonDisable;
  bool isPlayerTurn = true;
  late bool isPassButtonDisabled;
  late String savedName;
  int player1Points = 0;
  int aiPoints = 0;
  String chosenDifficulty = 'Easy';
  @override
  void initState() {
    isIncButtonDisable = false;
    isDecButtonDisable = true;
    isPassButtonDisabled = false;
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 2));
    _getSavedName();
    if (widget.mode == 'single') {
      Future.delayed(Duration.zero, () => _showDifficultyDialog());
    }
  }

  Future<void> _getSavedName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedName = prefs.getString('nickname') ?? 'Player 1';
    });
  }

  void _showDifficultyDialog() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog without choosing an option
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Difficulty'),
          content: const Text('Please choose the difficulty level:'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  chosenDifficulty = 'Easy';
                });
              },
              child: const Text('Easy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  chosenDifficulty = 'Medium';
                });
              },
              child: const Text('Medium'),
            ),
          ],
        );
      },
    );
  }

  void checkDisable() {
    if (isPlayerTurn) {
      isDecButtonDisable = tempCount <= 0;
      isIncButtonDisable = tempCount >= 2 && count <= 21;
      isPassButtonDisabled = tempCount == 0;
    } else {
      // Disable buttons during AI's turn
      isDecButtonDisable = true;
      isIncButtonDisable = true;
      isPassButtonDisabled = true;
    }
  }

  void increment() {
    setState(() {
      if (count < 21) {
        count++;
        tempCount++;
        checkDisable();

        if (count == 21) {
          _showResultDialog(true);
        }
      }
    });
  }

  void decrement() {
    setState(() {
      count--;
      tempCount--;
      checkDisable();
    });
  }

  Future<void> onPass() async {
    setState(() {
      isPlayerTurn = false;
      checkDisable();
    });

    if (count == 21) {
      _showResultDialog(false);
      return;
    }

    // Array of target numbers
    List<int> targets = [3, 6, 9, 12, 15, 18, 21];

    // Calculate the best move
    int aiChoice = 0;
    if (chosenDifficulty != 'Easy')
      for (int i = 1; i <= 2; i++) {
        if (targets.contains(count + i)) {
          aiChoice = i;
          break;
        }
      }

    // If no optimal move found, choose randomly
    if (aiChoice == 0) {
      aiChoice = Random().nextInt(2) + 1;
    }

    for (int i = 0; i < aiChoice; i++) {
      if (count < 21) {
        await Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            count++;
            checkDisable();

            if (count == 21) {
              _showResultDialog(false);
            }
          });
        });
      }
    }

    if (count < 21) {
      setState(() {
        isPlayerTurn = true;
        tempCount = 0;
        checkDisable();
      });
    }
  }

  Future<void> _showResultDialog(bool isPlayer1Winner) async {
    String result = isPlayer1Winner ? '$savedName Wins!' : 'Bot Wins!';

    if (isPlayer1Winner) {
      player1Points++;
      _controller.play();
    } else {
      aiPoints++;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(result),
          content: Text('Score: $savedName $player1Points - AI $aiPoints'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      count = 0;
      tempCount = 0;
      isIncButtonDisable = false;
      isDecButtonDisable = true;
      isPassButtonDisabled = false;
      isPlayerTurn = true;
      checkDisable();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConfettiWidget(
                confettiController: _controller,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                numberOfParticles: 10,
                gravity: 0.1,
                blastDirection: -pi / 2,
              ),
              if (widget.mode == 'single')
                Center(
                  child: Text('Difficulty: $chosenDifficulty'),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(savedName),
                      Text('$player1Points'),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Bot'),
                      Text('$aiPoints'),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: isIncButtonDisable ? null : increment,
                iconSize: 100,
                icon: Icon(
                  Icons.arrow_drop_up,
                  color: isIncButtonDisable ? null : Colors.white,
                ),
              ),
              CustomText(
                shadows: const [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.purple,
                  ),
                ],
                text: '$count',
                fontSize: 120,
              ),
              IconButton(
                onPressed: isDecButtonDisable ? null : decrement,
                iconSize: 100,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: isDecButtonDisable ? null : Colors.white,
                ),
              ),
              TextButton(
                onPressed: isPassButtonDisabled ? null : onPass,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple),
                child: const Text("Pass"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
