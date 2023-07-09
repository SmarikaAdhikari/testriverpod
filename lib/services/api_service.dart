// import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testriverpod/model/api.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<List<Products>> getProducts() async {
    try {
      final res = await Dio().get('https://fakestoreapi.com/products');
      List data = res.data;
      return data.map((e) => Products.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
