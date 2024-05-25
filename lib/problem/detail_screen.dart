import 'package:flutter/material.dart';
import 'package:navigator_inherited_example/common/state/counter_provider.dart';
import 'package:navigator_inherited_example/common/widgets/count_label.dart';
import 'package:navigator_inherited_example/common/widgets/increment_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: CountLabel(
          counter: CounterProvider.of(context)?.counter ?? -1,
        ),
      ),
      floatingActionButton: IncrementButton(
        onPressed: CounterProvider.of(context)?.incrementCounter,
      ),
    );
  }
}
