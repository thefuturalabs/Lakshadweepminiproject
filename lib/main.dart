import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_game/controller/gamepage_controller.dart';

import 'view/initgame_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>GamePageController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InitGamePage(),
      ),
    );
  }
}
