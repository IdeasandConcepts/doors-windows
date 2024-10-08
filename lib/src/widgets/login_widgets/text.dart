import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSubtitle extends StatelessWidget {
  const TextSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "A handful of model sentence structures",
      style: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xff767372),
      ),
    );
  }
}

class TextWelcome extends StatelessWidget {
  const TextWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome Back!",
      style: GoogleFonts.dmSans(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}