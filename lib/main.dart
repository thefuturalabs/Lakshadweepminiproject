import 'package:ecommerce/module/shop.dart';
import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/intro_page.dart';
import 'package:ecommerce/pages/store_page.dart';
import 'package:ecommerce/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Intropage(),
      theme: lightmode,
      routes: {
        '/intro_page': (context) => const Intropage(),
        '/store_page': (context) => const Storepage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
