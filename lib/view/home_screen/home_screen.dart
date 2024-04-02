import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_task/view/home_screen/widgets/row_containers.dart';
import 'package:technaureus_task/view/product_screen/product_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/image/profile.png'),
                  ),
                  IconButton(
                      onPressed: () {
                        
                      },
                      icon: const Icon(FontAwesomeIcons.barsStaggered))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const RowContainers(
                    
                    text: 'Customers',
                    icon: Icons.groups,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductScreen(),
                          ));
                    },
                    child: const RowContainers(
                      text: 'Products',
                      icon: FontAwesomeIcons.box,
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  RowContainers(
                    text: 'New Order',
                    icon: Icons.post_add_outlined,
                  ),
                  RowContainers(
                      text: 'Return Order',
                      icon: Icons.subdirectory_arrow_left_rounded)
                ],
              ),
              const Row(
                children: [
                  RowContainers(
                    text: 'Add Payment',
                    icon: FontAwesomeIcons.coins,
                  ),
                  RowContainers(
                      text: "Today's Order",
                      icon: FontAwesomeIcons.clipboardCheck)
                ],
              ),
              const Row(
                children: [
                  RowContainers(
                    text: "Today's Summery",
                    icon: Icons.summarize,
                  ),
                  RowContainers(text: 'Route', icon: Icons.route_outlined)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
