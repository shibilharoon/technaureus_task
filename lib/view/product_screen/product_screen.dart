import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technaureus_task/controller/search_provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<SearchProvider>(context, listen: false);
    pro.searchProducts("");
  }

  @override
  Widget build(BuildContext context) {
    final searchcontroller =
        Provider.of<SearchProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Center(
          child: Text(
            'Nesto Hypermarket',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                searchcontroller.searchProducts(value);
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.grey.withOpacity(0.5),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
              ),
            ),
          ),
          Expanded(
            child: Consumer<SearchProvider>(
              builder: (context, searchProvider, child) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                ),
                itemCount: searchProvider.searchResults.length,
                itemBuilder: (context, index) {
                  final product = searchProvider.searchResults[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 110,
                      width: 150,
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
                          SizedBox(
                            height: 120,
                            child: Image.network(
                                'http://143.198.61.94${product.image}'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(product.name!),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child:
                                        Text('\$${product.price.toString()}/-'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 30,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 0, 52, 143),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Add',
                                      style: GoogleFonts.urbanist(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
