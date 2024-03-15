import 'package:ecommerce/module/products.dart';
import 'package:ecommerce/module/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text('Are u sure you Want to remove this from Cart'),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().removeFromCart(product);
              },
              child: const Text('Yes'),
            )
          ]),
    );
  }

  payButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          const AlertDialog(content: Text('user wants to pay')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart page'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("No Item In Cart"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () {
                                removeFromCart(context, item);
                              },
                              icon: const Icon(Icons.remove_circle)),
                        );
                      },
                    )),
          ElevatedButton(
              onPressed: () {
                payButton(context);
              },
              child: const Text(
                'Pay Now',
                style: TextStyle(color: Colors.black),
              )),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
