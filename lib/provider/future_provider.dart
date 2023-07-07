import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testriverpod/model/api.dart';
// import 'package:riverpod_test/ui/models/suggestion.dart';
import '../services/api_service.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose<Products>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getProducts();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  // final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FutureProvider = ref.watch(suggestionFutureProvider);
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: color,
          title: const Text('Future Provider'),
        ),
        body: Center(
          child: FutureProvider.when(data: (data) {
            return Column(
              children: [
                Text(
                  data.activity,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  data.type,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  data.price.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  data.participants.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          }, error: (error, _) {
            return Text(error.toString());
          }, loading: () {
            return const CircularProgressIndicator();
          }),
        ));
  }
}
