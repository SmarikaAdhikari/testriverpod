// import 'package:flutter/material.dart';
// import 'dart:js_interop';

class Products {
  final String type;
  final String activity;
  final double price;
  final int participants;

  Products({
    required this.type,
    required this.activity,
    required this.price,
    required this.participants,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      type: json['type'],
      activity: json['activity'],
      price: json['price'],
      participants: json['participants'],
    );
  }
}
