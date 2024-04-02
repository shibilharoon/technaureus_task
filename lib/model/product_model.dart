class ProductModel {
  int? id;
  String? name;
  String? image;
  int? price;

  ProductModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price']);
  }
}
