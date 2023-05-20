import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DesignerWelcome extends StatelessWidget {
  const DesignerWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/ColorMeVivid.png')),
          Text('Add Image From Icon Below', style: GoogleFonts.acme(
            fontSize: 24,
            color: Colors.black54
          )),
        ],
      ),
    );
  }
}
