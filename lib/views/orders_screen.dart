import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My orders'),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.error != null) {
            return Center(
              child: Text('An error has occurred!'),
            );
          } else {
            return Consumer<Orders>(
              builder: (ctx, orders, child) {
                return ListView.builder(
                  itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
                  itemCount: orders.itemsCount,
                );
              },
            );
          }
        },
      ),
      // _isLoading
      // ? Center(
      //     child: CircularProgressIndicator(),
      //   )
      //     : ListView.builder(
      //         itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
      //         itemCount: orders.itemsCount,
      //       ),
    );
  }
}
