import 'package:desafio_supera_flutter/models/cart_item.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  CartItem item;
  CardItem({required this.item});

  @override
  _CardItemState createState() => _CardItemState(item);
}

class _CardItemState extends State<CardItem> {
  final CartItem item;
  _CardItemState(this.item);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
