import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Loading...',
            style: GoogleFonts.parisienne(
                textStyle: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            )),
          ),
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      ),
    );
  }
}
