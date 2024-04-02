import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(FontAwesomeIcons.cartShopping),
      ),
    );
  }
}
