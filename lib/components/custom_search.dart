import 'package:desafio_supera_flutter/components/game_grid.dart';
import 'package:desafio_supera_flutter/providers/game_item_provider.dart';
import 'package:desafio_supera_flutter/providers/game_list_provider.dart';
import 'package:desafio_supera_flutter/providers/search_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearch extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            headline6: TextStyle(color: Colors.white),
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var historicSearch = Provider.of<SearchHistoryProvider>(context);
    var provider = Provider.of<GameList>(context);
    List<GameItem> games = provider.gameList.toList();
    List<GameItem> matchQuery = [];

    games.forEach((game) {
      if (game.name.contains(query)) {
        matchQuery.add(game);
      }
    });
    if (query == '') {
      matchQuery = [];
    } else {
      historicSearch.addHistoy(query);
    }
    return matchQuery.isNotEmpty
        ? SingleChildScrollView(
            child: GameGrid(
              loadedGames: matchQuery,
            ),
          )
        : Center(
            child: Text('Não foram encontrados jogos.'),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var historicSearch =
        Provider.of<SearchHistoryProvider>(context).searchHistory;
    var provider = Provider.of<GameList>(context);
    List<GameItem> games = provider.gameList.toList();
    List<GameItem> matchQuery = [];
    games.forEach((game) {
      if (game.name.contains(query)) {
        matchQuery.add(game);
      }
    });
    if (query == '') {
      matchQuery = [];
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: matchQuery.isNotEmpty
          ? ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: ListTile(
                    onTap: () => query = matchQuery[index].name,
                    title: Text(matchQuery[index].name),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: historicSearch.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: ListTile(
                    onTap: () => query = historicSearch[index],
                    // leading: Text(historicSearch[index]),
                    leading: Icon(Icons.history),

                    title: Text(historicSearch[index]),
                  ),
                );
              },
            ),
    );
  }
}
