import 'package:ecommerce/components/my_list.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
            child: Icon(
              Icons.shopping_bag,
              size: 70,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )),
          Column(
            children: [
              MyList(
                  text: 'shop',
                  icon: Icons.shopping_bag,
                  ontap: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 10,
              ),
              MyList(
                  text: 'cart',
                  icon: Icons.shopping_cart,
                  ontap: () {
                    Navigator.pushNamed(context, '/cart_page');
                  }),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          MyList(
              text: 'exit',
              icon: Icons.logout,
              ontap: () {
                Navigator.pushNamed(context, '/intro_page');
              }),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
