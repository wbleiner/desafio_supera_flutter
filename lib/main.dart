import 'package:desafio_supera_flutter/models/cart.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GameList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Color.fromRGBO(29, 31, 34, 1),
                primaryVariant: Color.fromRGBO(67, 70, 78, 1),
                secondary: Color.fromRGBO(11, 207, 131, 1),
                secondaryVariant: Color.fromRGBO(158, 226, 176, 1),
              ),
          fontFamily: 'DMSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Raleway',
                ),
              ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 20,
            ),
          ),
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
