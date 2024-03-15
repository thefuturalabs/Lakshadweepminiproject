import 'package:flutter/material.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Minimal shop',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            'Premium quality Products',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.secondary),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/store_page');
                },
                icon: const Icon(Icons.arrow_forward)),
          )
        ],
      )),
    );
  }
}
