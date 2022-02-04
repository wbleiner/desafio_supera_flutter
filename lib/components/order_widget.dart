import 'package:desafio_supera_flutter/components/single_price_detail.dart';
import 'package:desafio_supera_flutter/models/cart_item.dart';
import 'package:desafio_supera_flutter/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final OrderModel order;
  const OrderWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

double _itemTotalPrice(CartItem item) {
  return item.quantity * item.price;
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    final _order = widget.order;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 5,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('dd/MM/yyy').format(_order.date),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          DateFormat('HH:mm').format(_order.date),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    label: Text(
                      '#${_order.id}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    SinglePriceDetail(
                      title: 'Subtotal',
                      value:
                          'R\$ ${_order.subtotal.toStringAsFixed(2).replaceAll('.', ',')}',
                      colorText: Colors.black38,
                      colorValue: Colors.black38,
                      fontSize: 12,
                    ),
                    SinglePriceDetail(
                      title: 'Frete',
                      value: _order.shipping == 0
                          ? 'Grátis'
                          : 'R\$ ${_order.shipping.toStringAsFixed(2).replaceAll('.', ',')}',
                      colorText: Colors.black38,
                      colorValue: _order.shipping == 0
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.black38,
                      fontSize: 12,
                    ),
                    SinglePriceDetail(
                      title: 'Cupom',
                      value:
                          '- R\$ ${_order.discount.toStringAsFixed(2).replaceAll('.', ',')}',
                      colorText: Colors.black38,
                      colorValue: _order.discount > 0
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.black38,
                      fontSize: 12,
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black12,
                    ),
                    SinglePriceDetail(
                      title: 'Total',
                      value: 'R\$ ${_order.total}',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: IconButton(
                  color: Colors.black38,
                  onPressed: () {
                    setState(() {
                      _showMore = !_showMore;
                    });
                  },
                  icon: Icon(
                    _showMore ? Icons.expand_less : Icons.expand_more,
                  ),
                ),
              ),
              _showMore
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Items:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _order.items
                              .map(
                                (item) => ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: Text(item.name),
                                  subtitle: Text(
                                      '${item.quantity}x ${item.price.toStringAsFixed(2).replaceAll('.', ',')}'),
                                  trailing: Text(
                                    'R\$ ${_itemTotalPrice(item).toStringAsFixed(2).replaceAll('.', ',')}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
