import 'package:flutter/material.dart';
import 'package:navigator_inherited_example/common/state/counter_provider.dart';

class CounterScope extends StatefulWidget {
  const CounterScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CounterScope> createState() => _CounterScopeState();
}

class _CounterScopeState extends State<CounterScope> {
  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: counter,
      incrementCounter: incrementCounter,
      child: widget.child,
    );
  }
}
