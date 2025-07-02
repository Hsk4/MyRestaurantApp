import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // shop name
              const SizedBox(height: 25),
              Text(
                "Sushi Man",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),

              // icon
              Padding(
                padding: EdgeInsets.all(50.0),
                child: Image.asset('assets/Images/sushi.png'),
              ),

              // text
              Text(
                "Taste Japanese cuisine",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 40,
                  color: Colors.grey[300],
                ),
              ),
              // subtext
              const SizedBox(height: 15),

              Text(
                "Taste the best japanese food at our place and enjoy",
                style: GoogleFonts.dmSerifDisplay(
                  height: 2,
                  color: Colors.grey[300],
                ),
              ),

              const SizedBox(height: 25),

              // get started button
              MyButton(
                text: "get started",
                onTap: () {
                  Navigator.pushNamed(context, '/menupage');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
