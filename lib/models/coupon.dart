import 'package:flutter/cupertino.dart';

class Coupon with ChangeNotifier {
  final String code;
  final double discount;

  Coupon({
    required this.code,
    required this.discount,
  });
}
