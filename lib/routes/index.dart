import 'package:flutter/material.dart';
import 'package:pokedex_sample/routes/home/home.view.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const HomeView(),
};
