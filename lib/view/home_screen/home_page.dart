import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_task/view/home_screen/widget/container_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.barsStaggered),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CategoryWidget(
                        centerIcon: FontAwesomeIcons.peopleGroup,
                        categoryName: "Customer",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CategoryWidget(
                        centerIcon: FontAwesomeIcons.boxOpen,
                        categoryName: "Products",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CategoryWidget(
                        centerIcon: FontAwesomeIcons.squarePlus,
                        categoryName: "New Order",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CategoryWidget(
                        centerIcon: FontAwesomeIcons.arrowLeftLong,
                        categoryName: "Return Order",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CategoryWidget(
                        centerIcon: FontAwesomeIcons.coins,
                        categoryName: "Add Payment",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CategoryWidget(
                        centerIcon: FontAwesomeIcons.fileCircleCheck,
                        categoryName: "Todays Order",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CategoryWidget(
                        centerIcon: FontAwesomeIcons.clipboard,
                        categoryName: "Todays summary",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CategoryWidget(
                        centerIcon: FontAwesomeIcons.route,
                        categoryName: "Route",
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
