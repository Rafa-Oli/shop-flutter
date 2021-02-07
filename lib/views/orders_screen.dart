import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<Orders>(context, listen: false).loadOrders().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My orders'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
              itemCount: orders.itemsCount,
            ),
    );
  }
}
