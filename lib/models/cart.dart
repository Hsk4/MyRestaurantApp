// ignore_for_file: unused_field

import 'package:flutter/widgets.dart';
import 'package:myapp/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: 'Dragon maki',
      price: '2000Pkr',
      imagePath: 'assets/Images/sushi4.png', // Corrected image path
      Rating: '2',
    ),
    Food(
      name: 'Dragon maki',
      price: '2000Pkr',
      imagePath: 'assets/Images/sushi2.png', // Corrected image path
      Rating: '2',
    ),
    Food(
      name: 'Dragon maki',
      price: '2000Pkr',
      imagePath: 'assets/Images/sushi3.png', // Corrected image path
      Rating: '2',
    ),
  ];

    List<Food> _cart = [];

  // getter method for cart
  List<Food> get cart => _cart;
  List<Food> get foodmenu => _foodMenu;

  // add to cart
  void addtocart(Food fooditem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(fooditem);
      notifyListeners();
    }
  }

  // remove from cart
  void removefromcart(Food fooditem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.remove(fooditem);
      notifyListeners();
    }
  }
}
