import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:technaureus_task/model/customer_model.dart';
import 'package:technaureus_task/model/product_model.dart';


class ApiService {
  Dio dio = Dio();
  static const apiUrl = "http://143.198.61.94/api/";

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await dio.get("${apiUrl}products/");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List data = responseData['data'];
        return data.map((datas) => ProductModel.fromJson(datas)).toList();
      } else {
        print('status code ${response.statusCode}');
        throw Exception("status code error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      Response response = await dio.get("${apiUrl}products/?search_query=$query");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List data = responseData['data'];
        return data.map((datas) => ProductModel.fromJson(datas)).toList();
      } else {
        print('status code ${response.statusCode}');
        throw Exception("status code error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<List<CustomerModel>> searchCustomers(String query) async {
    try {
      Response response = await dio.get("${apiUrl}customers/?search_query=$query");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List data = responseData['data'];
        return data.map((datas) => CustomerModel.fromJson(datas)).toList();
      } else {
        print('status code ${response.statusCode}');
        throw Exception("status code error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CustomerModel>> getCustomers() async {
    try {
      Response response = await dio.get("${apiUrl}customers/");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List data = responseData['data'];
        return data.map((datas) => CustomerModel.fromJson(datas)).toList();
      } else {
        print('status code ${response.statusCode}');
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  createCustomer(value) async {
    try {
      await dio.post('${apiUrl}customers/', data: jsonEncode(value));
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
    }
  }

  updateCustomer(id, value) async {
    try {
      await dio.put("${apiUrl}customers/ $id", data: jsonEncode(value));
    } on DioException catch (e) {
      if (e.response != null) {
        log("${e.response?.data}");
      }
    }
  }
  search(String username){

  }
}
