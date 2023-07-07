import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testriverpod/model/api.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Products> getProducts() async {
    try {
      final res = await Dio().get('https://www.boredapi.com/api/activity');
      return Products.fromJson(res.data);
    } catch (e) {
      throw Exception('Error getting suggestion $e');
    }
  }
}
