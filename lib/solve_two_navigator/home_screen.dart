import 'package:flutter/material.dart';
import 'package:navigator_inherited_example/solve_two_navigator/detail_screen.dart';
import 'package:navigator_inherited_example/common/state/counter_provider.dart';
import 'package:navigator_inherited_example/common/widgets/count_label.dart';
import 'package:navigator_inherited_example/common/widgets/increment_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Home Page'),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_right,
                  size: 36,
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: CountLabel(
              counter: CounterProvider.of(context)?.counter ?? -1,
            ),
          ),
          floatingActionButton: IncrementButton(
            onPressed: CounterProvider.of(context)?.incrementCounter,
          ),
        ),
      ),
    );
  }
}
