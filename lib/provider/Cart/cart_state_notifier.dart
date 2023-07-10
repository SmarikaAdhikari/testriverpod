import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/api.dart';

final cartStateNotifierProvider =
    StateNotifierProvider<StateNotifierPage, List<Products>>((ref) {
  return StateNotifierPage();
});

class StateNotifierPage extends StateNotifier<List<Products>> {
  StateNotifierPage() : super([]);

  void addProduct(Products product) {
    state = [...state, product];
  }

  void removeProduct(Products product) {
    state = [...state, product];
  }

  void clear() {
    state = [];
  }
}
