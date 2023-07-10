import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterStateNotifier extends StateNotifier<bool> {
  CounterStateNotifier() : super(false);

  void toggleIcon() {
    state = !state;
  }
}

final counterProvider =
    StateNotifierProvider<CounterStateNotifier, bool>((ref) {
  return CounterStateNotifier();
});
