import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget {
  const CounterProvider({
    super.key,
    required super.child,
    required this.counter,
    required this.incrementCounter,
  });

  final int counter;
  final void Function() incrementCounter;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CounterProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();
}
