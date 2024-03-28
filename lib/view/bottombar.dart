import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_task/view/product_screen/products.dart';
import 'package:technaureus_task/view/customer_screen/customer.dart';
import 'package:technaureus_task/view/home_screen/home_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    ProductScreen(),
    ProductScreen(),
    CustomersScreen(),
    CustomersScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 3, 12, 23),
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: 25,
              color: Color.fromARGB(255, 27, 86, 134),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.squarePlus,
              size: 25,
              color: Color.fromARGB(255, 27, 86, 134),
            ),
            label: 'New Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cartShopping,
                size: 20, color: Color.fromARGB(255, 27, 86, 134)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.arrowLeftLong,
                size: 20, color: Color.fromARGB(255, 27, 86, 134)),
            label: 'Return Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.peopleGroup,
                size: 28, color: Color.fromARGB(255, 27, 86, 134)),
            label: 'Customers',
          ),
        ],
        elevation: 8,
      ),
    );
  }
}
