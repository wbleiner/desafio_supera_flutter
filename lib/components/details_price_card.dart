import 'package:desafio_supera_flutter/models/cart.dart';
import 'package:flutter/material.dart';

class DetailsPriceCard extends StatelessWidget {
  final Cart cartProvider;
  const DetailsPriceCard({Key? key, required this.cartProvider})
      : super(key: key);
  Widget _priceDetail({
    required String title,
    required String value,
    required double fontSize,
    Color? colorText,
    Color? colorValue,
    FontWeight? fontWeight,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title (R\$)',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: colorText,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: colorValue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(8),
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
          _priceDetail(
            title: 'Subtotal',
            value:
                (cartProvider.totalAmountWithShipping - cartProvider.shipping)
                    .toStringAsFixed(2)
                    .replaceAll('.', ','),
            fontSize: 18,
            colorText: Colors.grey,
          ),
          _priceDetail(
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
          Divider(
            thickness: 2,
            color: Colors.black12,
          ),
          _priceDetail(
            title: 'Total',
            value: cartProvider.totalAmountWithShipping
                .toStringAsFixed(2)
                .replaceAll('.', ','),
            fontSize: 18,
            colorValue: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
