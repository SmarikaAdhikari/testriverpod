import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueStateProvider = StateProvider<int>((ref) => 1);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);
    ref.listen<int>(valueStateProvider, (prev, next) {
      if (next == 110) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You have already reached 110')));
      }
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text('State Provider'),
        ),
        body: Center(
            child: Column(children: [
          Text(
            'The value is $value.',
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(valueStateProvider.notifier).state++;
            },
            child: const Text('Increment'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(valueStateProvider.notifier).state--;
            },
            child: const Text('Decrement'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(valueStateProvider);
            },
            child: const Text('Invalidate'),
          )
        ])));
  }
}
