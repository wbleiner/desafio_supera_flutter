import 'package:desafio_supera_flutter/models/cart_item.dart';

class OrderModel {
  final String id;
  final double subtotal;
  final double discount;
  final double shipping;
  final double total;
  final List<CartItem> items;
  final DateTime date;

  OrderModel({
    required this.id,
    required this.subtotal,
    required this.discount,
    required this.shipping,
    required this.total,
    required this.items,
    required this.date,
  });
}
