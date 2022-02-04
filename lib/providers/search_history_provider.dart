import 'package:flutter/cupertino.dart';

class SearchHistoryProvider with ChangeNotifier {
  final List<String> _searchHistory = [];
  List<String> get searchHistory => [..._searchHistory];

  void addHistoy(String history) {
    if (!_searchHistory.contains(history)) {
      _searchHistory.insert(0, history);
      notifyListeners();
    }
  }
}
