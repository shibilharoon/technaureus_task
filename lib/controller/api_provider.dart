import 'package:flutter/material.dart';
import 'package:technaureus_task/model/customer_model.dart';
import 'package:technaureus_task/model/product_model.dart';
import 'package:technaureus_task/service/api_service.dart';


class ApiProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<ProductModel>? products = [];
  List<CustomerModel>? customer = [];
   

  

  Future<List<ProductModel>> fetchProducts() async {
    try {
      products = await apiService.getProducts();
      notifyListeners();
      return products!;
    } catch (e) {
      print('Error fetching products: $e');
      notifyListeners();
      return [];
    }
  }
  Future<List<ProductModel>> fetchCustomers() async {
    try {
      customer = await apiService.getCustomers();
      notifyListeners();
      return products!;
    } catch (e) {
      print('Error fetching products: $e');
      notifyListeners();
      return [];
    }
  }
}
