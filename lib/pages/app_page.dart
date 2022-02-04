import 'package:badges/badges.dart';
import 'package:desafio_supera_flutter/components/custom_search.dart';
import 'package:desafio_supera_flutter/components/drawer_app.dart';

import 'package:desafio_supera_flutter/pages/cart_page.dart';
import 'package:desafio_supera_flutter/pages/favorite_page.dart';
import 'package:desafio_supera_flutter/pages/home_page.dart';
import 'package:desafio_supera_flutter/providers/cart_provider.dart';
import 'package:desafio_supera_flutter/providers/game_list_provider.dart';
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
  int _currentIndex = 0;
  static const indexHome = 0;
  static const indexCart = 2;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameList>(context);
    final cartProvider = Provider.of<Cart>(context);

    void _onSeletionOption(SortOptions selectedOption) {
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
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text(_title[_currentIndex]),
        actions: _currentIndex == indexHome
            ? [
                IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearch(),
                      );
                    },
                    icon: Icon(Icons.search)),
                PopupMenuButton(
                  icon: Icon(Icons.sort),
                  onSelected: _onSeletionOption,
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
            icon: Icon(Icons.home_outlined),
            label: 'Início',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favoritos',
              activeIcon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
            icon: Badge(
              showBadge: cartProvider.itemsCount == 0 ? false : true,
              position: BadgePosition(top: -15, end: -7),
              badgeContent: Text(
                cartProvider.itemsCount.toString(),
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              child: Icon(
                indexCart == _currentIndex
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
              ),
            ),
            label: 'Carrinho',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_currentIndex],
    );
  }
}
