class ProductModel {
  int? id;
  String? name;
  String? image;
  int? price;
  String? createdDate;
  String? createdTime;
  String? modifiedDate;
  String? modifiedTime;
  bool? flag;

  ProductModel(
      {required this.createdDate,
      required this.createdTime,
      required this.flag,
      required this.id,
      required this.image,
      required this.modifiedDate,
      required this.modifiedTime,
      required this.name,
      required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        createdDate: json["created_date"],
        createdTime: json["created_time"],
        flag: json["flag"],
        id: json["id"],
        image: json["image"],
        modifiedDate: json["modified_date"],
        modifiedTime: json["modified_time"],
        name: json["name"],
        price: json["price"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "price": price,
      "created_date": createdDate,
      "created_time": createdTime,
      "modified_date": modifiedDate,
      "modified_time": modifiedTime,
      "flag": flag
    };
  }
}
