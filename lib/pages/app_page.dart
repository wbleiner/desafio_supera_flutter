import 'package:badges/badges.dart';
import 'package:desafio_supera_flutter/models/game_list.dart';
import 'package:desafio_supera_flutter/pages/cart_page.dart';
import 'package:desafio_supera_flutter/pages/favorite_page.dart';
import 'package:desafio_supera_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SortOptions {
  LOWESTPRICE,
  BIGGESTPRICE,
  APHABETICALORDER,
  SCORE,
}

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  static const List<String> _title = ['Game shop', 'Favoritos', 'Carrinho'];
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    CartPage(),
  ];
  int _indexCurrent = 0;
  static const indexHome = 0;
  static const indexFavorite = 1;
  static const indexCart = 2;

  void _onItemTapped(int index) {
    setState(() {
      _indexCurrent = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_indexCurrent]),
        actions: _indexCurrent == indexHome
            ? [
                PopupMenuButton(
                  icon: Icon(Icons.sort),
                  onSelected: (SortOptions selectedOption) {
                    switch (selectedOption) {
                      case SortOptions.APHABETICALORDER:
                        provider.alphabeticalOrder();
                        break;
                      case SortOptions.BIGGESTPRICE:
                        provider.biggestPricelOrder();
                        break;
                      case SortOptions.LOWESTPRICE:
                        provider.lowestPriceOrder();
                        break;
                      case SortOptions.SCORE:
                        provider.scoreOrder();
                        break;
                      default:
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Menor Preço'),
                      value: SortOptions.LOWESTPRICE,
                    ),
                    PopupMenuItem(
                      child: Text('Maior Preço'),
                      value: SortOptions.BIGGESTPRICE,
                    ),
                    PopupMenuItem(
                      child: Text('Score'),
                      value: SortOptions.SCORE,
                    ),
                    PopupMenuItem(
                      child: Text('Ordem Alfabética'),
                      value: SortOptions.APHABETICALORDER,
                    ),
                  ],
                ),
              ]
            : [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        iconSize: 26,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                _indexCurrent == indexHome ? Icons.home : Icons.home_outlined),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(_indexCurrent == indexFavorite
                ? Icons.favorite
                : Icons.favorite_outline),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              position: BadgePosition(top: -15, end: -7),
              badgeContent: Text(
                '15',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              child: Icon(_indexCurrent == indexCart
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined),
            ),
            label: 'Carrinho',
          ),
        ],
        currentIndex: _indexCurrent,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_indexCurrent],
    );
  }
}
