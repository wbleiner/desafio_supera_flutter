import 'package:desafio_supera_flutter/components/drawer_app.dart';
import 'package:desafio_supera_flutter/components/order_widget.dart';
import 'package:desafio_supera_flutter/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ordersProvider = Provider.of<OrderListProvider>(context);
    var orders = ordersProvider.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
      ),
      drawer: DrawerApp(),
      body: orders.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: ordersProvider.itemsCounts,
                itemBuilder: (ctx, index) => OrderWidget(order: orders[index]),
              ),
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/background/empty-order-list.png',
                  ),
                  Text(
                    'Ops, você não tem pedidos.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
