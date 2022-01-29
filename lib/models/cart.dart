import 'dart:math';

import 'package:desafio_supera_flutter/models/cart_item.dart';
import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  double _shipping = 0.0;
  double _totalAmountWithShipping = 0.0;

  Map<String, CartItem> get items => {..._items};
  int get itemsCount => _items.length;
  double get shipping => _shipping;
  double get totalAmountWithShipping {
    _totalAmountWithShipping = 0.0;
    _totalAmountWithShipping += _shipping + _calculateTotalAmount();
    return _totalAmountWithShipping;
  }

  void _calculateShipping() {
    const valueShipping = 10.0;
    _shipping = 0.0;
    if (_calculateTotalAmount() < 250) {
      _items.forEach((key, value) {
        _shipping += value.quantity * valueShipping;
      });
    }
  }

  void addItemById(String id) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingItem) => CartItem(
          idGame: existingItem.idGame,
          id: existingItem.id,
          name: existingItem.name,
          price: existingItem.price,
          image: existingItem.image,
          quantity: existingItem.quantity + 1,
        ),
      );
      _calculateShipping();
    }
    notifyListeners();
  }

  void addItem(GameItem item) {
    if (_items.containsKey(item.id)) {
      _items.update(
        item.id,
        (existingItem) => CartItem(
          idGame: existingItem.idGame,
          id: existingItem.id,
          name: existingItem.name,
          price: existingItem.price,
          image: existingItem.image,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        item.id,
        () => CartItem(
          idGame: item.id,
          id: Random().nextDouble().toString(),
          name: item.name,
          price: item.price,
          image: item.image,
          quantity: 1,
        ),
      );
    }
    _calculateShipping();
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    _calculateShipping();
    notifyListeners();
  }

  void removeSingleItemById(String id) {
    if (_items.containsKey(id)) {
      if (_items[id]!.quantity > 1) {
        _items.update(
          id,
          (existingItem) => CartItem(
            idGame: existingItem.idGame,
            id: existingItem.id,
            name: existingItem.name,
            price: existingItem.price,
            image: existingItem.image,
            quantity: existingItem.quantity - 1,
          ),
        );
      } else {
        _items.remove(id);
      }
    }
    _calculateShipping();
    notifyListeners();
  }

  void removeAll() {
    _items = {};
    _calculateShipping();
    notifyListeners();
  }

  double totalAmountGame(String id) {
    return _items[id]!.quantity * _items[id]!.price;
  }

  double _calculateTotalAmount() {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }
}
