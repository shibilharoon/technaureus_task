import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technaureus_task/controller/api_provider.dart';
import 'package:technaureus_task/controller/search_provider.dart';
import 'package:technaureus_task/model/customer_model.dart';
import 'package:technaureus_task/service/api_service.dart';


class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController streetTwoController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController countyController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<ApiProvider>(context, listen: false);
    pro.fetchCustomers();
    final pro2 = Provider.of<SearchProvider>(context, listen: false);
    pro2.searchCustomers("");
  }

  @override
  Widget build(BuildContext context) {
    final searchcontroller =
        Provider.of<SearchProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
            title: const Center(
              child: Text(
                'Customers',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Add Customer',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextFormField(
                                          controller: nameController,
                                          decoration: const InputDecoration(
                                              labelText: 'Customer Name'),
                                        ),
                                        const SizedBox(height: 10),
                                        TextFormField(
                                          controller: numberController,
                                          decoration: const InputDecoration(
                                              labelText: 'Number'),
                                          keyboardType: TextInputType.phone,
                                        ),
                                        const SizedBox(height: 10),
                                        TextFormField(
                                          controller: emailController,
                                          decoration: const InputDecoration(
                                              labelText: 'Email'),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 20),
                                        const Text(
                                          'Address',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: streetController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Street'),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: TextFormField(
                                                controller: streetTwoController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Street 2'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: cityController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'City'),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: TextFormField(
                                                controller: pinCodeController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Pin Code'),
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: DropdownButtonFormField<
                                                  String>(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Country',
                                                ),
                                                items: <String>[
                                                  'USA',
                                                  'Canada',
                                                  'UK',
                                                  'India'
                                                ].map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged:
                                                    (String? newValue) {},
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: DropdownButtonFormField<
                                                  String>(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'State',
                                                ),
                                                items: <String>[
                                                  'State 1',
                                                  'State 2',
                                                  'State 3'
                                                ].map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged:
                                                    (String? newValue) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Center(
                                            child: ElevatedButton(
                                          onPressed: () {
                                            if (areAllFieldFilled()) {
                                              createCustomer();
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        "Please fill in all fields")),
                                              );
                                            }
                                          },
                                          child: const Text('Submit'),
                                        ))
                                      ]))));
                    },
                  );
                },
                icon: const Icon(FontAwesomeIcons.plus),
              )
            ]),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  onChanged: (value) {
                    searchcontroller.searchCustomers(value);
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.grey.withOpacity(0.5),
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                      )))),
          Expanded(
              child: Consumer<SearchProvider>(
                  builder: (context, searchProvider, child) => ListView.builder(
                      itemCount: searchcontroller.searchCustomerResults.length,
                      itemBuilder: (context, index) {
                        final customers =
                            searchProvider.searchCustomerResults[index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3))
                                      ]),
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 100,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: customers.profile != null
                                                ? Image.network(
                                                    'http://143.198.61.94${customers.profile}')
                                                : Image.asset(
                                                    "assets/image/profile.png")),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                customers.name!,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                width: 100,
                                              ),
                                              const Icon(Icons.phone)
                                            ],
                                          ),
                                          Text('id:${customers.id!}'),
                                          Row(
                                            children: [
                                              Text(customers.street!),
                                              Text(',${customers.streetTwo},'),
                                              Text('${customers.state}')
                                            ],
                                          ),
                                          const Row(children: [
                                            Text(
                                              'Due Amount: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            )
                                          ])
                                        ])
                                  ])),
                              const SizedBox(
                                height: 5,
                              )
                            ]));
                      })))
        ]));
  }

  createCustomer() async {
    final name = nameController.text;
    final number = numberController.text;
    final email = emailController.text;
    final street = streetController.text;
    final streetTwo = streetTwoController.text;
    final city = cityController.text;
    final pincode = int.tryParse(pinCodeController.text);
    final requestModel = CustomerModel(
      name: name,
      number: number,
      email: email,
      street: street,
      streetTwo: streetTwo,
      city: city,
      pincode: pincode,
      state: 'kerala',
      country: 'india',
    );
    ApiService().createCustomer(requestModel);
    Navigator.pop(context);
  }

  bool areAllFieldFilled() {
    return nameController.text.isNotEmpty &&
        numberController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        streetTwoController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        streetController.text.isNotEmpty;
  }
}
