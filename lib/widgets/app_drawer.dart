import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Welcome user!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Store'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.HOME);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.ORDERS);
            },
          ),
        ],
      ),
    );
  }
}
