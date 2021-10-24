import 'dart:convert';

import 'package:intl/intl.dart';

class Product {
  String id;
  String name;
  String description;
  int price;
  String image;
  int amount;
  String FK_category;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.amount,
    required this.FK_category,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    String? image,
    int? amount,
    String? FK_category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      amount: amount ?? this.amount,
      FK_category: FK_category ?? this.FK_category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'amount': amount,
      'FK_category': FK_category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      image: map['image'],
      amount: map['amount'],
      FK_category: map['FK_category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, image: $image, amount: $amount, FK_category: $FK_category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.image == image &&
        other.amount == amount &&
        other.FK_category == FK_category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        image.hashCode ^
        amount.hashCode ^
        FK_category.hashCode;
  }

  String getPrice() {
    return NumberFormat.currency(locale: 'vi',customPattern: '#,###', decimalDigits: 0).format(price)+"đ";
  }
}

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
