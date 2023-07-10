import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:testriverpod/model/api.dart';
import 'package:testriverpod/provider/future_provider.dart';

// import '../model/api.dart';
import 'Cart/cart_state_notifier.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartStateNotifierProvider);
    // ignore: non_constant_identifier_names
    final Products = ref.watch(suggestionFutureProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('State Notifier'),
          actions: [
            Stack(children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Cart'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...cart.map((item) => Text(item.title)),
                              const SizedBox(height: 16),
                              Text(
                                'Total: \$${cart.fold<double>(0, (sum, item) => sum + item.price)}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(cartStateNotifierProvider.notifier)
                                  .clear();
                            },
                            child: const Text('Clear'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Positioned(
                right: 0,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    cart.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          ],
        ),
        body: Products.when(
          data: (data) => Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    // ignore: unused_local_variable
                    final products = data[index];
                    return ListTile(
                      title: Text(data[index].title),
                      subtitle: Text('\$${data[index].price}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          ref
                              .read(cartStateNotifierProvider.notifier)
                              .addProduct(data[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          error: (Object error, StackTrace stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
