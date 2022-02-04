import 'package:desafio_supera_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/background/user.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              title: Text(
                'Usuário',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'usuário@email.com',
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop_outlined),
            title: Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.APP);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
