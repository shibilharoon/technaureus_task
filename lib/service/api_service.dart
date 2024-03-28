import 'package:dio/dio.dart';
import 'package:technaureus_task/model/product_model.dart';

class ApiService {
  static const apiUrl = "http://143.198.61.94/api/";
  Dio dio = Dio();

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await dio.get("${apiUrl}products/");
      if (response.statusCode == 200) {
        final List data = response.data["data"];
        return data.map((item) => ProductModel.fromJson(item)).toList();
      } else {
        throw Exception("statuscode error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
