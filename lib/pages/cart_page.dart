import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          // ListView.builder(itemBuilder: itemBuilder)
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Total'),
                      Text('R\$ 1000,00'),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('FINALIZAR COMPRA'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
