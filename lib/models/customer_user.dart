class CustomerUser {
  int companyId;
  DateTime createdAt;
  DateTime updatedAt;
  String email;
  int id;
  String name;
  String phone;
  int roleId;

  CustomerUser({
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.id,
    this.name,
    this.phone,
    this.roleId,
  });

  factory CustomerUser.fromJson(dynamic json) {
    return CustomerUser(
        companyId: json['company_id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        email: json['email'],
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        roleId: json['role_id'],
    );
  }
}