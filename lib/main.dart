import 'package:desafio_supera_flutter/pages/cart_page.dart';
import 'package:desafio_supera_flutter/pages/details_page.dart';
import 'package:desafio_supera_flutter/pages/favorite_page.dart';
import 'package:desafio_supera_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'utils/app-routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (ctx) => HomePage(),
        AppRoutes.CART: (ctx) => CartPage(),
        AppRoutes.FAVORITE: (ctx) => FavoritePage(),
        AppRoutes.DETAILS: (ctx) => DetailsPage(),
      },
    );
  }
}
