import 'package:pokedex_sample/routes/home/home.provider.dart';
import 'package:provider/provider.dart';

final List<ChangeNotifierProvider<dynamic>> providers = [
  ChangeNotifierProvider<HomeProvider>(
    create: (context) => HomeProvider(),
  ),
];
