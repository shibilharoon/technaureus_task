import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_task/view/product_screen/widget/productwidget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Center(
          child: Text(
            'Nesto Hypermarket',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.barsStaggered),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(FontAwesomeIcons.qrcode),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(FontAwesomeIcons.plus))
                    ],
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey.withOpacity(0.5),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)))),
            ),
          ),
          const ProductContainer()
        ],
      ),
    );
  }
}
