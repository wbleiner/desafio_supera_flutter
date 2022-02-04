import 'package:desafio_supera_flutter/models/cart_item.dart';
import 'package:desafio_supera_flutter/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.item,
    required this.cartProvider,
  }) : super(key: key);

  final CartItem item;
  final Cart cartProvider;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Image.asset(
          'assets/images/items/${item.image}',
        ),
        title: Text(item.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('R\$ ${item.price.toStringAsFixed(2).replaceAll('.', ',')}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green),
                  ),
                  child: InkWell(
                    onTap: () {
                      cartProvider.removeSingleItemById(item.idGame);
                    },
                    child: Icon(Icons.remove),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 20,
                  height: 20,
                  child: Text(
                    item.quantity.toString(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green),
                  ),
                  child: InkWell(
                    onTap: () {
                      cartProvider.addItemById(item.idGame);
                    },
                    child: Icon(Icons.add),
                  ),
                ),
                Spacer(),
                IconButton(
                  iconSize: 30,
                  onPressed: () {
                    cartProvider.removeItem(item.idGame);
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        trailing: Chip(
          backgroundColor: Theme.of(context).colorScheme.primary,
          labelStyle: TextStyle(color: Colors.white),
          label: FittedBox(
            child: Text(
              'R\$ ${cartProvider.totalAmountGame(item.idGame).toStringAsFixed(2).replaceAll('.', ',')}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
