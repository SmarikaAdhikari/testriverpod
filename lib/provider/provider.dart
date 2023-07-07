import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final riProvider = Provider.autoDispose<String>((ref) => 'Hello Riverpod');

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(
          ' ${ref.watch(riProvider)}.',
        ),
      ),
    );
  }
}
