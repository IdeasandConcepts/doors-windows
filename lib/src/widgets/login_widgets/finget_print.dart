import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 52,
      margin: EdgeInsets.only(
        right: screenWidth / 40,
        left: screenWidth / 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: SvgPicture.asset(
        'assets/images/fingerprint.svg',
        width: 25,
        height: 28,
        fit: BoxFit.none,
      ),
    );
  }
}