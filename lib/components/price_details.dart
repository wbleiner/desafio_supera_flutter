import 'package:desafio_supera_flutter/components/single_price_detail.dart';
import 'package:desafio_supera_flutter/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class DetailsPriceCard extends StatelessWidget {
  final Cart cartProvider;
  const DetailsPriceCard({Key? key, required this.cartProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Obs.: O frete é calculado automáticamente. A cada produto inserido no carrinho são somados R\$ 10,00 no valor do frete.',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.justify,
          ),
          Text(
            'Em compras acima de R\$ 250,00 o frete é grátis.',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.justify,
          ),
          Divider(
            thickness: 2,
            color: Colors.black12,
          ),
          SinglePriceDetail(
            title: 'Subtotal',
            value:
                'R\$ ${cartProvider.subTotal.toStringAsFixed(2).replaceAll('.', ',')}',
            fontSize: 18,
            colorText: Colors.grey,
          ),
          SinglePriceDetail(
            title: 'Frete',
            value: cartProvider.shipping == 0
                ? 'Grátis'
                : 'R\$ ${cartProvider.shipping.toStringAsFixed(2).replaceAll('.', ',')}',
            fontSize: 18,
            colorText: Colors.black38,
            colorValue: cartProvider.shipping == 0
                ? Theme.of(context).colorScheme.secondary
                : Colors.black,
          ),
          SinglePriceDetail(
            title: 'Cupom',
            value:
                '- R\$ ${cartProvider.discount.toStringAsFixed(2).replaceAll('.', ',')}',
            fontSize: 18,
            colorText: Colors.black38,
            colorValue: cartProvider.discount > 0
                ? Theme.of(context).colorScheme.secondary
                : Colors.black,
          ),
          Divider(
            thickness: 2,
            color: Colors.black12,
          ),
          SinglePriceDetail(
            title: 'Total',
            value:
                'R\$ ${cartProvider.totalAmountWithShipping.toStringAsFixed(2).replaceAll('.', ',')}',
            fontSize: 18,
            colorValue: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
