// import 'dart:js_interop';

// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Cart/cart_notifier.dart';
import 'future_provider.dart';

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: non_constant_identifier_names
    final CartNotifier = ref.watch(cartNotifierProvider);
    final Products = ref.watch(suggestionFutureProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Change Notifier'), actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text('Cart')),
                          content: Column(
                            children: [
                              ...CartNotifier.cart
                                  .map((item) => Text(item.type)),
                              const SizedBox(height: 16),
                              Text(
                                'Total: \$${CartNotifier.cart.fold<double>(0, (sum, item) => sum + item.price)}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  ref
                                      .read(cartNotifierProvider.notifier)
                                      .clearCart();
                                },
                                child: Text('Clear Cart'))
                          ],
                        );
                      });
                },
              ),
              Positioned(
                // right: 0,
                // top: 6,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  // constraints: const BoxConstraints(
                  //   minWidth: 16,
                  //   minHeight: 16,
                  // ),
                  child: Text(
                    CartNotifier.cart.length.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ]),
        body: Column(children: [
          Expanded(
            child: Products.when(
              data: (data) => ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  // final product = CartNotifier.cart[index];
                  return Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            ref.read(cartNotifierProvider.notifier).clearCart();
                          },
                          child: Text('Remove')),
                      ListTile(
                        title: Text(data.type),
                        subtitle: Text('\$${data.price}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addProduct(data);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              error: (Object error, StackTrace stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ),
        ]));
  }
}
