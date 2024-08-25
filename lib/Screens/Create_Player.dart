import 'package:flutter/material.dart';
import 'package:twentyone/Screens/Create_Room.dart';
import 'package:twentyone/Screens/Game_Menu.dart';
import 'package:twentyone/Screens/Join_Room.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePlayer extends StatefulWidget {
  static String routeName = '/main-menu';

  @override
  _CreatePlayerState createState() => _CreatePlayerState();
}

class _CreatePlayerState extends State<CreatePlayer> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  String _savedName = '';

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('nickname') ?? '';
    });
  }

  _saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nickname', name);
  }

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoom.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoom.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 300.0, // Set your desired maximum width
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty.';
                    } else if (value.length < 3) {
                      return 'Name must be at least 3 characters.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String enteredName = _nameController.text;
                    _saveName(enteredName).then((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GameMenu(_nameController.text)),
                      );
                    });
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
