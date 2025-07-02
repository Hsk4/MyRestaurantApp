import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/themes/colors.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/food.dart'; // Import Food class

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) {
        return Scaffold(

          appBar: AppBar(
            title: Text('Cart'),
            backgroundColor: primaryColor,
          ),
          body: shop.cart.isEmpty // Check if cart is empty
              ? Center(
                  child: Text(
                    'Your cart is empty.',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                )
              : ListView.builder(
                  itemCount: shop.cart.length, // Use shop.cart.length
                  itemBuilder: (context, index) {
                    final Food food = shop.cart[index]; // Get food from shop.cart

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(
                          left: 20, top: 20, right: 20),
                      child: ListTile(
                        leading: Image.asset(food.imagePath), // Display image
                        title: Text(food.name), // Display name
                        subtitle: Text(food.price), // Display price
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () => shop.removefromcart(food, 1), // Remove one item
                        ),
                      ),
                    );
                  }),
        ); // Added missing closing parenthesis
      },
    );
  }
}
