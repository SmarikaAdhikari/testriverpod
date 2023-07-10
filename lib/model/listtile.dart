import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testriverpod/model/api.dart';
import 'package:testriverpod/provider/Cart/cart_file.dart';

import '../provider/Cart/cart_notifier.dart';

// ignore: must_be_immutable
class TilePage extends ConsumerStatefulWidget {
  TilePage({super.key, required this.product});
  Products product;
  @override
  ConsumerState<TilePage> createState() => _TilePageState();
}

class _TilePageState extends ConsumerState<TilePage> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
    final cart = ref.watch(cartNotifierProvider);

    return ListTile(
      title: Text(widget.product.title),
      subtitle: Text('\$${widget.product.price}'),
      trailing: IconButton(
        icon: Icon(counter ? Icons.check : Icons.add_shopping_cart),
        onPressed: () {
          if (counter == false) {
            ref.read(cartNotifierProvider.notifier);
            cart.addProduct(widget.product);
            ref.read(counterProvider.notifier).toggleIcon();
            return;
          } else {
            ref.read(cartNotifierProvider.notifier);
            cart.removeProduct(widget.product);
            ref.read(counterProvider.notifier).toggleIcon();
            return;
          }
        },
      ),
    );
  }
}
