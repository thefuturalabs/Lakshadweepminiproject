import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:ecommerce/module/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Storepage extends StatelessWidget {
  const Storepage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shope page'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'select a premium Product',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              )),
          SizedBox(
            height: 550,
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
