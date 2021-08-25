import 'package:flutter/material.dart';

class Vehicle {
  final String name;
  final String description;
  final double price;
  String get image => images.first;
  final List<String> images;
  final String makeSpecefication;
  final String modelSpecefication;
  final String yearSpecefication;
  final String miliageSpecefication;
  final String transmitionSpecefication;
  final String colorSpecefication;
  final String dorsSpecefication;
  final String category;
  final String uniqueIdentificator;
  final bool available;

  Vehicle({
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.makeSpecefication,
    required this.modelSpecefication,
    required this.yearSpecefication,
    required this.miliageSpecefication,
    required this.transmitionSpecefication,
    required this.colorSpecefication,
    required this.dorsSpecefication,
    required this.category,
    required this.available,
    required this.uniqueIdentificator,
  });

  Map<String, dynamic> toJSON() => {
        'name': name,
        'description': description,
        'price': price,
        'images': images,
        'makeSpecefication': makeSpecefication,
        'modelSpecefication': modelSpecefication,
        'yearSpecefication': yearSpecefication,
        'miliageSpecefication': miliageSpecefication,
        'transmitionSpecefication': transmitionSpecefication,
        'colorSpecefication': colorSpecefication,
        'dorsSpecefication': dorsSpecefication,
        'category': category,
        'available': available,
        'uniqueIdentificator': uniqueIdentificator,
      };

  static Vehicle fromJSON(Map<String, dynamic> json) => Vehicle(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        images: json['images'].cast<String>(),
        makeSpecefication: json['makeSpecefication'],
        modelSpecefication: json['modelSpecefication'],
        yearSpecefication: json['yearSpecefication'],
        miliageSpecefication: json['miliageSpecefication'],
        transmitionSpecefication: json['transmitionSpecefication'],
        colorSpecefication: json['colorSpecefication'],
        dorsSpecefication: json['dorsSpecefication'],
        category: json['category'],
        available: json['available'],
        uniqueIdentificator: json['uniqueIdentificator'],
      );

  String speceficationFor(String key) =>
      {
        'MAKE': makeSpecefication,
        'MODEL': modelSpecefication,
        'YEAR': yearSpecefication,
        'MILEAGE': miliageSpecefication,
        'TRANSMISSION': transmitionSpecefication,
        'COLOR': colorSpecefication,
        'No OF DOORS': dorsSpecefication,
      }[key] ??
      '';

  // static Vehicle random() {
  //   final faker = Faker();
  //   final price = Random().nextInt(1000).toDouble();
  //   final vehicle = faker.vehicle.asVehicle();
  //   final make = vehicle.make;
  //   final model = vehicle.model;
  //   final categories = RentalCategories.values
  //       .map((e) => e.toString().replaceAll('RentalCategories.', ''))
  //       .toList();
  //   return Vehicle(
  //     name: make + ' ' + model,
  //     category: categories[Random().nextInt(categories.length)],
  //     description: model,
  //     uniqueIdentificator: base64.encode(utf8.encode((make + ':' + model))),
  //     price: price,
  //     available: true,
  //     images: List.generate(
  //       5,
  //       (index) => faker.image.image(
  //         keywords: ['auto'],
  //         random: true,
  //       ),
  //     ),
  //     colorSpecefication: Color.fromARGB(255, Random().nextInt(255),
  //             Random().nextInt(255), Random().nextInt(255))
  //         .toHex(),
  //     dorsSpecefication: Random().nextBool() ? '4' : '5',
  //     makeSpecefication: make,
  //     miliageSpecefication: Random().nextInt(999999).toString(),
  //     transmitionSpecefication: Random().nextBool() ? 'Automatic' : 'Manual',
  //     modelSpecefication: model,
  //     yearSpecefication: faker.date.year(minYear: 2000, maxYear: 2021),
  //   );
  // }
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
  static Color fromHex(String hex) =>
      Color(int.tryParse(hex.replaceAll('#', '0x')) ?? 0xFF);
}
