import 'package:desafio_supera_flutter/components/cart_item_widget.dart';
import 'package:desafio_supera_flutter/components/price_details.dart';
import 'package:desafio_supera_flutter/providers/cart_provider.dart';
import 'package:desafio_supera_flutter/providers/order_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _codeCouponController = TextEditingController();
  bool _isValid = true;
  var _focusNode = FocusNode();

  void _validate(Cart cart) {
    setState(() {
      _isValid = cart.validateCoupon(
        _codeCouponController.text.toString().trim(),
      );
    });
    _focusNode.unfocus();
    _codeCouponController.clear();
  }

  @override
  void dispose() {
    _codeCouponController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final items = cart.items.values.toList();

    return cart.itemsCount == 0
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/background/empty-cart.png',
                ),
                Text(
                  'Opz, o seu carrinho está vázio.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          )
        : GestureDetector(
            onTap: () => _focusNode.unfocus(),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: Column(
                      children: items
                          .map(
                            (item) => CartItemWidget(
                              item: item,
                              cartProvider: cart,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextField(
                            onSubmitted: (_) {
                              _validate(cart);
                            },
                            controller: _codeCouponController,
                            decoration: InputDecoration(
                              errorText:
                                  _isValid ? null : 'Este cupom está inválido.',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.black38),
                              labelText: 'CUPOM',
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4 - 16,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              _validate(cart);
                            },
                            child: Text('APLICAR'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  DetailsPriceCard(cartProvider: cart),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<OrderListProvider>(context, listen: false)
                            .addOrder(cart);
                        cart.clear();
                      },
                      child: Text('FINALIZAR COMPRA'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
