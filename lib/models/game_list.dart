import 'package:desafio_supera_flutter/data/dummy_data.dart';
import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:flutter/material.dart';

class GameList with ChangeNotifier {
  List<GameItem> _gameList = dummyGames;
  List<GameItem> _gameFavoriteList = [];

  List<GameItem> get gameList {
    return [..._gameList];
  }

  List<GameItem> get gameFavoriteList {
    return [..._gameFavoriteList];
  }

  void filterFavorite() {
    _gameFavoriteList = _gameList.where((game) => game.isFavorite).toList();
    notifyListeners();
  }

  void alphabeticalOrder() {
    _gameList.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void lowestPriceOrder() {
    _gameList.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  void biggestPricelOrder() {
    _gameList.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  void scoreOrder() {
    _gameList.sort((a, b) => b.score.compareTo(a.score));
    notifyListeners();
  }

  void noOrder() {
    _gameList = dummyGames.toList();
    notifyListeners();
  }
}
