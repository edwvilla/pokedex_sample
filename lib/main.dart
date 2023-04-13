import 'package:flutter/material.dart';
import 'package:pokedex_sample/routes/index.dart';
import 'package:pokedex_sample/utils/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: theme,
      routes: routes,
    );
  }
}