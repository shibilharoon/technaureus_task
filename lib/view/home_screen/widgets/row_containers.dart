import 'package:flutter/material.dart';

class RowContainers extends StatelessWidget {
  const RowContainers({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 135,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
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
                  icon,
                  color: const Color.fromARGB(255, 16, 82, 136),
                  size: 35,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 16, 82, 136),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
