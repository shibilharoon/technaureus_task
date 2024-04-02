import 'package:flutter/material.dart';
import 'package:technaureus_task/model/customer_model.dart';
import 'package:technaureus_task/model/product_model.dart';
import 'package:technaureus_task/service/api_service.dart';


class SearchProvider extends ChangeNotifier {
  final TextEditingController queryController = TextEditingController();
  final ApiService service = ApiService();
  List<ProductModel> searchResults = [];
  List<CustomerModel> searchCustomerResults = [];
  void searchProducts(String query) async {
        searchResults = await service.searchProducts(query);
        notifyListeners();
  }
  void searchCustomers(String query) async {
        searchCustomerResults = await service.searchCustomers(query);
        notifyListeners();
  }
}