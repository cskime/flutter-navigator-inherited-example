import 'package:flutter/material.dart';

class CountLabel extends StatelessWidget {
  const CountLabel({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tap Count:',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          '$counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
