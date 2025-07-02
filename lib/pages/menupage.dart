import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/button.dart';
import 'package:myapp/components/foodtile.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/pages/fooddetail.dart';
import 'package:myapp/themes/colors.dart';
import 'package:myapp/models/food.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu

  // navigate to food detail page
  void navigateToFoodDetail(Food food) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodDetailPage(food: food)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get shop and food menu from shop
    final shop =
        context.watch<Shop>(); // No need for final here if foodMenu is accessed
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        elevation: 0,
        title: Text('Tokyo ', style: TextStyle(color: Colors.grey[900])),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Column(
          // Changed the body to a Column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promobanner
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // promo message
                  Column(
                    children: [
                      Text(
                        'get 32% off',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      MyButton(text: 'Redeem', onTap: () {}),
                    ],
                  ),
                  Image.asset(
                    'assets/Images/sushi2.png',
                    height: 100,
                  ), // Corrected image path
                ],
              ),
            ),
            SizedBox(height: 25),
            // searchbar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search here...',
                ),
              ),
            ),
            SizedBox(height: 25),
            // menu list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'food menu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shop.foodmenu.length,
                itemBuilder:
                    (context, index) => FoodTile(
                      food: shop.foodmenu[index],
                      onTap: () {
                        navigateToFoodDetail(shop.foodmenu[index]);
                      },
                    ),
              ),
            ),

            SizedBox(height: 25),

            // popular food
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Popular Food',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            SizedBox(height: 25),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Images/sushi3.png', height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dragon maki',
                        style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '2000Pkr',
                        style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  Icon(Icons.favorite_outline, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
