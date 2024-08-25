import 'package:flutter/material.dart';
import 'package:twentyone/routes/app_route_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.dark()));
}
