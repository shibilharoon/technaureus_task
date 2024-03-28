import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  final IconData centerIcon;
  final String categoryName;
  const CategoryWidget(
      {super.key, required this.categoryName, required this.centerIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 130,
            width: 170,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  centerIcon,
                  color: const Color.fromARGB(255, 16, 82, 136),
                  size: 35,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  categoryName,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 13, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
