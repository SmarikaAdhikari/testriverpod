import 'package:flutter/material.dart';
import 'package:testriverpod/provider/change_notifier.dart';
import 'package:testriverpod/provider/future_provider.dart';
import 'package:testriverpod/provider/provider.dart';
import 'package:testriverpod/provider/state_notifier.dart';
import 'package:testriverpod/provider/state_provider.dart';
import 'package:testriverpod/provider/stream_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                  // width: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FutureProviderPage()),
                    );
                  },
                  child: const Text('Future Provider',
                      style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StreamProviderPage()),
                    );
                  },
                  child: const Text('Streams', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProviderPage()),
                    );
                  },
                  child:
                      const Text('Providers', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StateProviderPage()),
                    );
                  },
                  child: const Text('State Providers',
                      style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangeNotifierPage()),
                    );
                  },
                  child: const Text('Change Notifier',
                      style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const StateNotifierProviderPage()),
                    );
                  },
                  child: const Text('State Notifier',
                      style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ));
  }
}
