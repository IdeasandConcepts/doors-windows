// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class BottomSignin extends StatelessWidget {
  const BottomSignin({
    super.key,
    required this.name,
    required this.onTap,
  });
  final String name;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 335,
        height: 52,
        decoration: BoxDecoration(
            color: const Color(0xff3787FF),
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 17.5, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}