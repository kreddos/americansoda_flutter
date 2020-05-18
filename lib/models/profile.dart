import 'package:americansoda/models/models.dart';

class Profile {
//  List<Customer> customers;
  DateTime createdAt;
  DateTime updatedAt;
  List<Customer> customers;
  String email;
  int id;
  String name;
  String phone;

  Profile({
    this.createdAt,
    this.updatedAt,
    this.customers,
    this.email,
    this.id,
    this.name,
    this.phone,
  });

  factory Profile.fromJson(dynamic json) {
    List<dynamic> customersJson = json['customers'].toList();
    List<Customer> customers = customersJson.map((e) => Customer.fromJson(e)).toList();

    return Profile(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      customers: customers,
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}