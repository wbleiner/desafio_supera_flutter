import 'package:desafio_supera_flutter/models/cart.dart';
import 'package:desafio_supera_flutter/models/cart_item.dart';
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
        leading: Image.asset('assets/images/items/${item.image}'),
        title: Text(item.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('R\$ ${item.price.toStringAsFixed(2).replaceAll('.', ',')}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  iconSize: 20,
                  onPressed: () {
                    cartProvider.removeSingleItemById(item.idGame);
                  },
                  icon: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Icon(Icons.remove),
                  ),
                ),
                Text(item.quantity.toString()),
                IconButton(
                  iconSize: 20,
                  onPressed: () {
                    cartProvider.addItemById(item.idGame);
                  },
                  icon: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green),
                    ),
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
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        trailing: Text(
            'R\$ ${cartProvider.totalAmountGame(item.idGame).toStringAsFixed(2).replaceAll('.', ',')}'),
      ),
    );
  }
}
