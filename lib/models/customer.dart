import 'package:americansoda/models/customer_user.dart';

class Customer {
  int id;
  String billingAddress;
  String name;
  DateTime createdAt;
  String email;
  CustomerUser user;

  Customer({
    this.id,
    this.billingAddress,
    this.createdAt,
    this.email,
    this.user,
    this.name,
  });

  factory Customer.fromJson(dynamic json) {
    return Customer(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        billingAddress: json['billing_address'],
        name: json['name'],
        email: json['email'],
        user: CustomerUser.fromJson(json['user']),
    );
  }
}