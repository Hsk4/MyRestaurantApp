import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/button.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/food.dart';
import 'package:myapp/themes/colors.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void navigateToCartPage() {
    if (quantity > 0) {
      final shop = context.read<Shop>();
      shop.addtocart(widget.food, quantity);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Item Added To Cart'),
          actions: [
            IconButton(onPressed: (){Navigator.pop(context); Navigator.pop(context);}, icon: Icon(Icons.done)),
          ],
          ),
      );
    }
    // Navigator.pushNamed(context, '/cartpage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[900],
        elevation: 0,
        title: Text('Food Detail ', style: TextStyle(color: Colors.grey[900])),
      ),

      body: Column(
        children: [
          // list view
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: ListView(
                children: [
                  // image
                  Image.asset(widget.food.imagePath, height: 200),
                  // rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 10),

                      Text(
                        widget.food.Rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 15),
                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                  ),

                  SizedBox(height: 10),
                  Text(
                    "Description",
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                  SizedBox(height: 10),

                  // description
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price + quantity + add to cart
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              // Changed to Column to stack elements
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align elements to the start
              children: [
                // Price and Quantity in a Row
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween, // Distribute space between price and quantity
                  children: [
                    // price
                    Text(
                      widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ), // Added font size
                    ),
                    // + quantity
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ), // Added font size
                        ),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10), // SizedBox for spacing
                // add to cart
                MyButton(text: 'Add To Cart Button', onTap: navigateToCartPage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
