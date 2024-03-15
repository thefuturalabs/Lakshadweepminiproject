import 'package:ecommerce/module/products.dart';
import 'package:ecommerce/module/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text('Are u sure you Want to Add this to Cart'),
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
                context.read<Shop>().addToCart(product);
              },
              child: const Text('Yes'),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(25),
      width: 350,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // product image
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary),
                      width: double.infinity,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                      )),
                ),
                //name
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),

                //description
                const SizedBox(
                  height: 10,
                ),
                Text(product.description),
              ],
            ),

            //price + add to cart

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${product.price.toStringAsFixed(2)}'),
                IconButton(
                  onPressed: () {
                    addToCart(context);
                  },
                  icon: const Icon(Icons.add),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.secondary)),
                )
              ],
            )
          ]),
    );
  }
}
