import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
        itemCount: orders.itemsCount,
      ),
    );
  }
}
