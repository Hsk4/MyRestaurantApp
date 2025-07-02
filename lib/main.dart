import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/pages/cartpage.dart';
import 'package:myapp/pages/intropage.dart';
import 'package:myapp/pages/menupage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: IntroPage(),
      routes: {
        '/intropage': (context) => IntroPage(),
        '/menupage': (context) => MenuPage(),
        '/cartpage': (context) => CartPage(),
        
        
        },
    );
  }
}
