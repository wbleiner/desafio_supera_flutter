import 'package:badges/badges.dart';
import 'package:desafio_supera_flutter/components/carousel.dart';
import 'package:desafio_supera_flutter/utils/app-routes.dart';

import '../data/dummy_data.dart';
import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<GameItem> gamesLoaded = dummyGames;

  Widget _counterStars(int score) {
    List<Icon> iconsStars = [];
    const int maxStars = 5;
    for (var i = 0; i < maxStars; i++) {
      score -= 100;

      if (score > -50) {
        iconsStars.add(Icon(Icons.star));
      } else if (score <= -50 && score > -100) {
        iconsStars.add(Icon(Icons.star_half));
      } else {
        iconsStars.add(Icon(Icons.star_border));
      }
    }
    return Row(
      children: iconsStars,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,

        // unselectedItemColor: Colors.gr,
        iconSize: 26,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favoritos',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Badge(
              position: BadgePosition(top: -15, end: -7),
              badgeContent: Text(
                '15',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              child: Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Carrinho',
            // backgroundColor: Colors.blue,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Game Shop'),
        actions: [
          Badge(
            badgeContent: Text(
              '2',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            position: BadgePosition(top: 2, end: 4),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          CarouselSliderGames(),
          GridView.builder(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: gamesLoaded.length,
            shrinkWrap: true,
            itemBuilder: (ctx, i) => Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: Offset(3, 2),
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRoutes.DETAILS,
                      arguments: gamesLoaded[i],
                    ),
                    child: Container(
                      child: Hero(
                        tag: gamesLoaded[i].id,
                        child: Image.asset(
                          'assets/images/items/${gamesLoaded[i].image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: Text(
                      gamesLoaded[i].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoCondensed',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  _counterStars(gamesLoaded[i].score),
                  Row(
                    children: [
                      Text(
                        'R\$ ${gamesLoaded[i].price.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoCondensed',
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_shopping_cart),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                ],
              ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          ),
        ],
      ),
    );
  }
}
