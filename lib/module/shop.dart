import 'package:ecommerce/module/products.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: 'product 1',
        price: 99,
        description: 'good quality',
        image:
            'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?q=80&w=1615&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'product 2',
        price: 99,
        description: 'good quality',
        image:
            'https://images.unsplash.com/photo-1608231387042-66d1773070a5?q=80&w=1674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'product 3',
        price: 99,
        description: 'good quality',
        image:
            'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?q=80&w=1760&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Product(
        name: 'product 4',
        price: 99,
        description: 'good quality',
        image:
            'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?q=80&w=1597&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  ];
//user cart
  final List<Product> _cart = [];

//get product list
  List<Product> get shop => _shop;

//get user cart
  List<Product> get cart => _cart;

//add item to cart

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

//remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
