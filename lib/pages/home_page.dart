import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_generator_app/components/my_button.dart';
import 'package:qr_code_generator_app/pages/qr_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();
  String? error;
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 35.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Enter Text, or URL",
                          style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "and Customise it.",
                          style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
        
                  ],
                ),
                const SizedBox(height: 30,),
        
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Type Text or URL.",
                    hintStyle: GoogleFonts.lato(
        
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ), 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ), 
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.text,
                ),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Note: type url with http or https.",
                          style: GoogleFonts.robotoFlex(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        
                Text(
                  error ?? "",
                    style: GoogleFonts.robotoFlex(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.red,
                    ),
                ),
        
                const Spacer(),
        
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: KeyboardListener(
                    focusNode: myFocusNode,
                    onKeyEvent: (event) {
                      if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                        if (textController.text.isNotEmpty) {
                          setState(() {
                            error = ""; 
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QrPage(
                                data: textController.text,
                              ),
                            ),
                          );
                        }
                        else {
                          setState(() {
                            error = "Error: please enter something.";
                          });
                        }
                      }
                    },
                    child: MyButton(
                      onTap: () {
                        if (textController.text.isNotEmpty) {
                          setState(() {
                            error = ""; 
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QrPage(
                                data: textController.text,
                              ),
                            ),
                          );
                        }
                        else {
                          setState(() {
                            error = "Error: please enter something.";
                          });
                        }
                      }, 
                      text: "Generate"
                    ),
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