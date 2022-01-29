import 'package:desafio_supera_flutter/components/cart_item_widget.dart';
import 'package:desafio_supera_flutter/components/details_price_card.dart';
import 'package:desafio_supera_flutter/models/cart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final cart = cartProvider.items.values.toList();
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.32,
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) => CartItemWidget(
              item: cart[index],
              cartProvider: cartProvider,
            ),
          ),
        ),
        DetailsPriceCard(cartProvider: cartProvider),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('FINALIZAR COMPRA'),
          ),
        )
      ],
    );
  }
}
