// import 'package:flutter/material.dart';
// import 'dart:js_interop';

class Products {
  final String description;
  final int id;
  final double price;
  final String title;

  Products({
    required this.description,
    required this.id,
    required this.price,
    required this.title,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      description: json['description'],
      id: json['id'],
      price: json['price'],
      title: json['title'],
    );
  }
}
