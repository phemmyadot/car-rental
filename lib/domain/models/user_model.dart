import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String uniqueId;
  final List<String> rentedCars;

  UserModel._({
    required this.name,
    required this.email,
    required this.phone,
    required this.uniqueId,
    required this.rentedCars,
  });
  factory UserModel.signUp({
    required String name,
    required String password,
    required String email,
    required String phone,
  }) =>
      UserModel._(
        name: name,
        email: email,
        phone: phone,
        rentedCars: [],
        uniqueId: base64.encode(utf8.encode('$email:$password')),
      );

  factory UserModel.fromJSON(Map<String, dynamic> json) => UserModel._(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        uniqueId: json['uniqueId'],
        rentedCars: json['rentedCars'].cast<String>(),
      );

  Map<String, dynamic> toJSON() => {
        'name': name,
        'email': email,
        'phone': phone,
        'uniqueId': uniqueId,
        'rentedCars': rentedCars,
      };
}
