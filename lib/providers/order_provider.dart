import 'package:desafio_supera_flutter/models/order_model.dart';
import 'package:desafio_supera_flutter/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';

class OrderListProvider with ChangeNotifier {
  List<OrderModel> _orders = [];
  int lastId = 0;
  List<OrderModel> get items => [..._orders];
  get itemsCounts => _orders.length;

  void addOrder(Cart cart) {
    lastId++;
    _orders.insert(
      0,
      OrderModel(
        id: lastId.toString(),
        subtotal: cart.subTotal,
        discount: cart.discount,
        shipping: cart.shipping,
        total: cart.totalAmountWithShipping,
        items: cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
