import 'package:desafio_supera_flutter/models/game_list.dart';
import 'package:desafio_supera_flutter/pages/app_page.dart';
import 'package:desafio_supera_flutter/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameList(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.APP: (ctx) => AppPage(),
          AppRoutes.DETAILS: (ctx) => DetailsPage(),
        },
      ),
    );
  }
}
