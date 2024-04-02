class CustomerModel {
  int? id;
  String? name;
  String? profile;
  String? number;
  String? email;
  String? street;
  String? streetTwo;
  String? city;
  String? state;
  int? pincode;
  String? country;

  CustomerModel(
      {this.id,
      required this.name,
      this.profile,
      required this.number,
      required this.email,
      required this.street,
      required this.streetTwo,
      required this.city,
      this.state,
      required this.pincode,
      this.country});
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      profile: json['profile_pic'],
      number: json['mobile_number'],
      email: json['email'],
      street: json['street'],
      streetTwo: json['street_two'],
      city: json['city'],
      pincode: json['pincode'],
      country: json['country'],
      state: json['state'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      // "profile_pic": profile!,
      "mobile_number": number,
      "email": email,
      "street": street,
      "street_two": streetTwo,
      "city": city,
      "pincode": pincode,
      "country": country,
      "state": state
    };
  }
}
