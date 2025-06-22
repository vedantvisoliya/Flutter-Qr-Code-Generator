import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:qr_code_generator_app/pages/home_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/qr-code.png",
                  height: 80,
                  width: 80,
                  color: Colors.black,
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "QR- code",
                          style: GoogleFonts.poppins(
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Generator",
                          style: GoogleFonts.poppins(
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "by VedantK",
                          style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create your own personal",
                          style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "qr codes.",
                          style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 50,),

                // swipe button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: SwipeButton(
                    thumb: Icon(Icons.double_arrow, color: Colors.black),
                    activeThumbColor: Colors.tealAccent,
                    activeTrackColor: Colors.grey[300],
                    child: Text(
                      "Create Now",
                      style: GoogleFonts.poppins(
                        color: Colors.black
                      ),
                    ),
                    onSwipe: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        )
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
