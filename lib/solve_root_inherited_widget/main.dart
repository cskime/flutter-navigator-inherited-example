import 'package:flutter/material.dart';
import 'package:navigator_inherited_example/solve_root_inherited_widget/home_screen.dart';
import 'package:navigator_inherited_example/common/state/counter_scope.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CounterScope(
      child: MaterialApp(
        title: 'Navigator Inherited Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
