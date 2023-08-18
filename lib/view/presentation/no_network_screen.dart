import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/data/helpers/style_helper.dart';

class NoNetworkScreen extends ConsumerWidget {
  const NoNetworkScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No Network"),
      ),
      body: Center(
        child: Text("No Network", style: Styles.largeText()),
      ),
    );
  }
}
